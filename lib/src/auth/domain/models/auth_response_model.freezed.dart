// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthResponseModel {
  String get uid => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res>;
  $Res call({String uid, bool emailVerified});
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  final AuthResponseModel _value;
  // ignore: unused_field
  final $Res Function(AuthResponseModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthResponseModelCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$AuthResponseModelCopyWith(
          _AuthResponseModel value, $Res Function(_AuthResponseModel) then) =
      __$AuthResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String uid, bool emailVerified});
}

/// @nodoc
class __$AuthResponseModelCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res>
    implements _$AuthResponseModelCopyWith<$Res> {
  __$AuthResponseModelCopyWithImpl(
      _AuthResponseModel _value, $Res Function(_AuthResponseModel) _then)
      : super(_value, (v) => _then(v as _AuthResponseModel));

  @override
  _AuthResponseModel get _value => super._value as _AuthResponseModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_AuthResponseModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthResponseModel implements _AuthResponseModel {
  const _$_AuthResponseModel({required this.uid, required this.emailVerified});

  @override
  final String uid;
  @override
  final bool emailVerified;

  @override
  String toString() {
    return 'AuthResponseModel(uid: $uid, emailVerified: $emailVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthResponseModel &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.emailVerified, emailVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(emailVerified));

  @JsonKey(ignore: true)
  @override
  _$AuthResponseModelCopyWith<_AuthResponseModel> get copyWith =>
      __$AuthResponseModelCopyWithImpl<_AuthResponseModel>(this, _$identity);
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel(
      {required final String uid,
      required final bool emailVerified}) = _$_AuthResponseModel;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  bool get emailVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthResponseModelCopyWith<_AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
