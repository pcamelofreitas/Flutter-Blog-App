import 'package:blog_app_2/src/auth/domain/models/provider_id.dart';
import 'package:blog_app_2/src/auth/domain/models/user_model.dart';
import 'package:blog_app_2/src/shared/errors/exceptions.dart';
import 'package:blog_app_2/src/shared/types/maybe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();
  const factory UserEntity({
    String? id,
    String? name,
    String? bio,
    String? email,
    bool? emailVerified,
    String? providerId,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  UserModel toDomain() {
    try {
      return UserModel(
        id: id!,
        name: name!,
        bio: bio != null ? Just(bio!) : const Nothing(),
        profilePicture: const Nothing(),
        email: email!,
        emailVerified: emailVerified!,
        providerId: providerId?.contains("googgle") == true
            ? const Google()
            : const Password(),
      );
    } catch (e) {
      throw ParseException(e.toString());
    }
  }
}
