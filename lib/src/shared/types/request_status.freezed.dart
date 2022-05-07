// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestStatus<ResultType> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStatusCopyWith<ResultType, $Res> {
  factory $RequestStatusCopyWith(RequestStatus<ResultType> value,
          $Res Function(RequestStatus<ResultType>) then) =
      _$RequestStatusCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class _$RequestStatusCopyWithImpl<ResultType, $Res>
    implements $RequestStatusCopyWith<ResultType, $Res> {
  _$RequestStatusCopyWithImpl(this._value, this._then);

  final RequestStatus<ResultType> _value;
  // ignore: unused_field
  final $Res Function(RequestStatus<ResultType>) _then;
}

/// @nodoc
abstract class $IdleCopyWith<ResultType, $Res> {
  factory $IdleCopyWith(
          Idle<ResultType> value, $Res Function(Idle<ResultType>) then) =
      _$IdleCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res>
    implements $IdleCopyWith<ResultType, $Res> {
  _$IdleCopyWithImpl(
      Idle<ResultType> _value, $Res Function(Idle<ResultType>) _then)
      : super(_value, (v) => _then(v as Idle<ResultType>));

  @override
  Idle<ResultType> get _value => super._value as Idle<ResultType>;
}

/// @nodoc

class _$Idle<ResultType> extends Idle<ResultType> {
  const _$Idle() : super._();

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Idle<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<ResultType> extends RequestStatus<ResultType> {
  const factory Idle() = _$Idle<ResultType>;
  const Idle._() : super._();
}

/// @nodoc
abstract class $LoadingCopyWith<ResultType, $Res> {
  factory $LoadingCopyWith(
          Loading<ResultType> value, $Res Function(Loading<ResultType>) then) =
      _$LoadingCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res>
    implements $LoadingCopyWith<ResultType, $Res> {
  _$LoadingCopyWithImpl(
      Loading<ResultType> _value, $Res Function(Loading<ResultType>) _then)
      : super(_value, (v) => _then(v as Loading<ResultType>));

  @override
  Loading<ResultType> get _value => super._value as Loading<ResultType>;
}

/// @nodoc

class _$Loading<ResultType> extends Loading<ResultType> {
  const _$Loading() : super._();

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<ResultType> extends RequestStatus<ResultType> {
  const factory Loading() = _$Loading<ResultType>;
  const Loading._() : super._();
}

/// @nodoc
abstract class $SucceededCopyWith<ResultType, $Res> {
  factory $SucceededCopyWith(Succeeded<ResultType> value,
          $Res Function(Succeeded<ResultType>) then) =
      _$SucceededCopyWithImpl<ResultType, $Res>;
  $Res call({ResultType data});
}

/// @nodoc
class _$SucceededCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res>
    implements $SucceededCopyWith<ResultType, $Res> {
  _$SucceededCopyWithImpl(
      Succeeded<ResultType> _value, $Res Function(Succeeded<ResultType>) _then)
      : super(_value, (v) => _then(v as Succeeded<ResultType>));

  @override
  Succeeded<ResultType> get _value => super._value as Succeeded<ResultType>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Succeeded<ResultType>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class _$Succeeded<ResultType> extends Succeeded<ResultType> {
  const _$Succeeded(this.data) : super._();

  @override
  final ResultType data;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.succeeded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Succeeded<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $SucceededCopyWith<ResultType, Succeeded<ResultType>> get copyWith =>
      _$SucceededCopyWithImpl<ResultType, Succeeded<ResultType>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return succeeded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
  }) {
    return succeeded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return succeeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
  }) {
    return succeeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(this);
    }
    return orElse();
  }
}

abstract class Succeeded<ResultType> extends RequestStatus<ResultType> {
  const factory Succeeded(final ResultType data) = _$Succeeded<ResultType>;
  const Succeeded._() : super._();

  ResultType get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SucceededCopyWith<ResultType, Succeeded<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailedCopyWith<ResultType, $Res> {
  factory $FailedCopyWith(
          Failed<ResultType> value, $Res Function(Failed<ResultType>) then) =
      _$FailedCopyWithImpl<ResultType, $Res>;
  $Res call({AppError error});
}

/// @nodoc
class _$FailedCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res>
    implements $FailedCopyWith<ResultType, $Res> {
  _$FailedCopyWithImpl(
      Failed<ResultType> _value, $Res Function(Failed<ResultType>) _then)
      : super(_value, (v) => _then(v as Failed<ResultType>));

  @override
  Failed<ResultType> get _value => super._value as Failed<ResultType>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Failed<ResultType>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$Failed<ResultType> extends Failed<ResultType> {
  const _$Failed(this.error) : super._();

  @override
  final AppError error;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failed<ResultType> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $FailedCopyWith<ResultType, Failed<ResultType>> get copyWith =>
      _$FailedCopyWithImpl<ResultType, Failed<ResultType>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed<ResultType> extends RequestStatus<ResultType> {
  const factory Failed(final AppError error) = _$Failed<ResultType>;
  const Failed._() : super._();

  AppError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailedCopyWith<ResultType, Failed<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}
