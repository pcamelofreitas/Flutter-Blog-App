import 'package:blog_app_2/src/shared/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<ResultType> with _$Result<ResultType> {
  const Result._();
  const factory Result.success(ResultType data) = Success<ResultType>;
  const factory Result.failure(AppError error) = Failure;

  T handle<T>({
    required T Function(ResultType data) onSuccess,
    required T Function(AppError error) onFailure,
  }) {
    return map<T>(
      success: (success) => onSuccess(success.data),
      failure: (failure) => onFailure(failure.error),
    );
  }
}
