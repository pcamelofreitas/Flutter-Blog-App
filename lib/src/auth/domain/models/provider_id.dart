import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_id.freezed.dart';

@freezed
class ProviderId with _$ProviderId {
  const factory ProviderId.password() = Password;
  const factory ProviderId.google() = Google;
}
