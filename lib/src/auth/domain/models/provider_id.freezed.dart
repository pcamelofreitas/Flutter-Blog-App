// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'provider_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProviderId {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() password,
    required TResult Function() google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? password,
    TResult Function()? google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? password,
    TResult Function()? google,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Password value) password,
    required TResult Function(Google value) google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Password value)? password,
    TResult Function(Google value)? google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Password value)? password,
    TResult Function(Google value)? google,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderIdCopyWith<$Res> {
  factory $ProviderIdCopyWith(
          ProviderId value, $Res Function(ProviderId) then) =
      _$ProviderIdCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProviderIdCopyWithImpl<$Res> implements $ProviderIdCopyWith<$Res> {
  _$ProviderIdCopyWithImpl(this._value, this._then);

  final ProviderId _value;
  // ignore: unused_field
  final $Res Function(ProviderId) _then;
}

/// @nodoc
abstract class $PasswordCopyWith<$Res> {
  factory $PasswordCopyWith(Password value, $Res Function(Password) then) =
      _$PasswordCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordCopyWithImpl<$Res> extends _$ProviderIdCopyWithImpl<$Res>
    implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(Password _value, $Res Function(Password) _then)
      : super(_value, (v) => _then(v as Password));

  @override
  Password get _value => super._value as Password;
}

/// @nodoc

class _$Password implements Password {
  const _$Password();

  @override
  String toString() {
    return 'ProviderId.password()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Password);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() password,
    required TResult Function() google,
  }) {
    return password();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? password,
    TResult Function()? google,
  }) {
    return password?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? password,
    TResult Function()? google,
    required TResult orElse(),
  }) {
    if (password != null) {
      return password();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Password value) password,
    required TResult Function(Google value) google,
  }) {
    return password(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Password value)? password,
    TResult Function(Google value)? google,
  }) {
    return password?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Password value)? password,
    TResult Function(Google value)? google,
    required TResult orElse(),
  }) {
    if (password != null) {
      return password(this);
    }
    return orElse();
  }
}

abstract class Password implements ProviderId {
  const factory Password() = _$Password;
}

/// @nodoc
abstract class $GoogleCopyWith<$Res> {
  factory $GoogleCopyWith(Google value, $Res Function(Google) then) =
      _$GoogleCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoogleCopyWithImpl<$Res> extends _$ProviderIdCopyWithImpl<$Res>
    implements $GoogleCopyWith<$Res> {
  _$GoogleCopyWithImpl(Google _value, $Res Function(Google) _then)
      : super(_value, (v) => _then(v as Google));

  @override
  Google get _value => super._value as Google;
}

/// @nodoc

class _$Google implements Google {
  const _$Google();

  @override
  String toString() {
    return 'ProviderId.google()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Google);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() password,
    required TResult Function() google,
  }) {
    return google();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? password,
    TResult Function()? google,
  }) {
    return google?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? password,
    TResult Function()? google,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Password value) password,
    required TResult Function(Google value) google,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Password value)? password,
    TResult Function(Google value)? google,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Password value)? password,
    TResult Function(Google value)? google,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class Google implements ProviderId {
  const factory Google() = _$Google;
}
