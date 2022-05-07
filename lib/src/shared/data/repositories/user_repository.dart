import 'dart:io';
import 'dart:typed_data';

import 'package:blog_app_2/src/auth/domain/models/user_model.dart';
import 'package:blog_app_2/src/shared/errors/app_error.dart';
import 'package:blog_app_2/src/shared/errors/exceptions.dart';
import 'package:blog_app_2/src/shared/types/maybe.dart';
import 'package:blog_app_2/src/shared/types/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

const String _mockCapy =
    'https://s2.glbimg.com/k7N9JKFDftF5ghR6CTPQ08d2UVU=/0x0:960x1280/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2019/Z/B/MXaqi8Tr6eLqPF3rCD8w/whatsapp-image-2019-11-13-at-09.56.14.jpeg';

class UserRepository {
  UserRepository({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseStorage firebaseStorage,
    required FirebaseAuth firebaseAuth,
    required PostsRepository postsRepository,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseStorage = firebaseStorage,
        _postsRepository = postsRepository,
        _firebaseAuth = firebaseAuth;

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;
  final PostsRepository _postsRepository;

  Future<Result<User>> _getLoggedUser() async {
    try {
      final User? user = _firebaseAuth.currentUser;

      if (user != null) {
        return Success(user);
      } else {
        return Failure(AppUnknownError(slug: "User not logged"));
      }
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<UserModel>> getUser() async {
    try {
      Result<User> loggedUserRes = await _getLoggedUser();

      return loggedUserRes.handle(
        onSuccess: (data) async {
          final Result<File> userProfilePicture =
              await _getUserProfilePicture(data);
          final Result<UserEntity> userEntityRes = await _getUserDocument(data);

          return userEntityRes.handle(
            onSuccess: (entity) => Success(
              entity.toDomain().copyWith(
                    profilePicture: (userProfilePicture is Success)
                        ? Just((userProfilePicture as Success).data)
                        : const Nothing(),
                  ),
            ),
            onFailure: (error) => Failure(error),
          );
        },
        onFailure: (error) {
          return Failure(error);
        },
      );
    } on ParseException catch (e) {
      return Failure(EntityNotFitError(slug: e.toString()));
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<String>> updateUser({
    required EditProfileForm form,
  }) async {
    try {
      Result<User> loggedUserRes = await _getLoggedUser();

      return loggedUserRes.handle(
        onSuccess: (data) async {
          final Result<bool> updateUserDocumentRes = await _updateUserDocument(
            user: data,
            form: form,
          );

          await form.selfie.field.map(
            nothing: (_) {},
            just: (selfie) async {
              final Result<bool> updateUserPictureRes =
                  await _updateUserPicture(
                userId: data.uid,
                picture: File(selfie.getOrElse('')),
              );

              if (updateUserDocumentRes is Success &&
                  updateUserPictureRes is Success) {
                return const Success("User updated successfully");
              } else {
                return Failure(
                    AppUnknownError(slug: "failed at least one step"));
              }
            },
          );

          if (updateUserDocumentRes is Success) {
            return const Success("User updated successfully");
          } else {
            return Failure(AppUnknownError(slug: "failed at least one step"));
          }
        },
        onFailure: (error) {
          return Failure(error);
        },
      );
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<bool>> _updateUserDocument({
    required User user,
    required EditProfileForm form,
  }) async {
    try {
      await _firebaseFirestore.collection("Users").doc(user.uid).update(
            form.toJson(),
          );

      return const Success(true);
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<bool>> _updateUserPicture({
    required String userId,
    required File picture,
  }) async {
    try {
      await _firebaseStorage.ref("/profile_pictures/$userId").putFile(picture);

      return const Success(true);
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<UserEntity>> _getUserDocument(User user) async {
    try {
      String providerId = user.providerData.first.providerId;

      late UserEntity userEntity;

      if (providerId.contains("google")) {
        userEntity = UserEntity(
          id: user.uid,
          email: user.email,
          emailVerified: user.emailVerified,
          name: user.displayName,
          providerId: providerId,
        );

        final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await _firebaseFirestore.collection("Users").doc(user.uid).get();

        if (!documentSnapshot.exists) {
          await _firebaseFirestore
              .collection("Users")
              .doc(userEntity.id)
              .set(userEntity.toJson());
        } else {
          userEntity = UserEntity.fromJson(documentSnapshot.data()!);
        }
      } else {
        final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await _firebaseFirestore.collection("Users").doc(user.uid).get();

        userEntity = UserEntity.fromJson(documentSnapshot.data()!);
        if (userEntity.emailVerified != user.emailVerified) {
          await _firebaseFirestore.collection("Users").doc(user.uid).update(
            {
              "emailVerified": user.emailVerified,
            },
          );
        }
        userEntity = userEntity.copyWith(providerId: providerId);
      }

      return Success(userEntity);
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<File>> _getUserProfilePicture(User user) async {
    try {
      FullMetadata infos = await _firebaseStorage
          .ref("/profile_pictures/${user.uid}")
          .getMetadata();

      Uint8List? data =
          await _firebaseStorage.ref("/profile_pictures/${user.uid}").getData();

      if (data != null) {
        Directory tempDir = await getTemporaryDirectory();
        File file = await File(
                '${tempDir.path}/${user.uid}_${infos.updated?.millisecond}.png')
            .create();
        file.writeAsBytesSync(data);

        return Success(file);
      } else {
        return Failure(AppUnknownError(slug: 'could not load image'));
      }
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<List<String>>> getUserPhotos() async {
    try {
      Result<User> loggedUserRes = await _getLoggedUser();

      return loggedUserRes.handle(
        onSuccess: (data) async {
          // List<String> urls = await _firebaseStorage.ref('');

          return Success(
            List.generate(
              33,
              (index) => _mockCapy,
            ),
          );
        },
        onFailure: (error) {
          return Failure(error);
        },
      );
    } on ParseException catch (e) {
      return Failure(EntityNotFitError(slug: e.toString()));
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  Future<Result<List<PostModel>>> getUserPosts() async {
    try {
      Result<User> loggedUserRes = await _getLoggedUser();

      return loggedUserRes.handle(
        onSuccess: (data) async {
          return await _postsRepository.getPosts(userId: data.uid);
        },
        onFailure: (error) {
          return Failure(error);
        },
      );
    } on ParseException catch (e) {
      return Failure(EntityNotFitError(slug: e.toString()));
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }
}
