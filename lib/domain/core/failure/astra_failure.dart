import 'package:freezed_annotation/freezed_annotation.dart';
part 'astra_failure.freezed.dart';

/// Represent union of astra failure.
@freezed
class AstraFilure with _$AstraFilure {
  const AstraFilure._();
  const factory AstraFilure.api(int? errorCode) = _Api;
}
