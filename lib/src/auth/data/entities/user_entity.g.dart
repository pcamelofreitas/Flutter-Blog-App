// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      providerId: json['providerId'] as String?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'providerId': instance.providerId,
    };
