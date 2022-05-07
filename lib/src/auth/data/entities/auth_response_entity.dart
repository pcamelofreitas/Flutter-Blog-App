import 'package:blog_app_2/src/auth/domain/models/auth_response_model.dart';
import 'package:blog_app_2/src/shared/errors/exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_entity.freezed.dart';

@freezed
class AuthResponseEntity with _$AuthResponseEntity {
  const AuthResponseEntity._();
  const factory AuthResponseEntity({
    String? uid,
    bool? emailVerified,
  }) = _AuthResponseEntity;

  AuthResponseModel toDomain() {
    try {
      return AuthResponseModel(
        uid: uid!,
        emailVerified: emailVerified!,
      );
    } catch (e) {
      throw ParseException(e.toString());
    }
  }
}
