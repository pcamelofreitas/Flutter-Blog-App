import 'dart:io';

import 'package:blog_app_2/src/auth/domain/models/provider_id.dart';
import 'package:blog_app_2/src/shared/types/maybe.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required Maybe<String> bio,
    required Maybe<File> profilePicture,
    required String email,
    required bool emailVerified,
    required ProviderId providerId,
  }) = _UserModel;
}
