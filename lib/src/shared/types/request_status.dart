import 'package:blog_app_2/src/shared/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status.freezed.dart';

@freezed
class RequestStatus<ResultType> with _$RequestStatus<ResultType> {
  const RequestStatus._();
  const factory RequestStatus.idle() = Idle;
  const factory RequestStatus.loading() = Loading;
  const factory RequestStatus.succeeded(ResultType data) =
      Succeeded<ResultType>;
  const factory RequestStatus.failed(AppError error) = Failed;

  ResultType? get data => maybeWhen(
        succeeded: (data) => data,
        orElse: () => null,
      );

  AppError? get error => maybeWhen(
        failed: (error) => error,
        orElse: () => null,
      );
}
