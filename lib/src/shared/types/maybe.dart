import 'package:freezed_annotation/freezed_annotation.dart';

part 'maybe.freezed.dart';

@freezed
class Maybe<T> with _$Maybe<T> {
  const Maybe._();
  const factory Maybe.nothing() = Nothing;
  const factory Maybe.just(T value) = Just<T>;

  T? get value => map(
        nothing: (_) => null,
        just: (just) => just.value,
      );

  getOrElse(fallback) {
    return map(
      nothing: (_) => fallback,
      just: (_) => value ?? fallback,
    );
  }
}
