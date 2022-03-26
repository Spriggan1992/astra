import 'package:freezed_annotation/freezed_annotation.dart';

part 'promocode_failure.freezed.dart';

/// Represent promocode failures.
@freezed
class PromocodeFailure with _$PromocodeFailure {
  const PromocodeFailure._();

  /// Unexpected failures.
  const factory PromocodeFailure.api([int? errorCode]) = _Api;

  /// Represents failure of lack internet connection.
  const factory PromocodeFailure.noConnection() = _NoConnection;

  /// Represents failure that promo code not exist.
  const factory PromocodeFailure.notExist() = _DataNotExist;

  /// Represents failure that promo code is not valid no more.
  const factory PromocodeFailure.isNotValid() = _IsNotValid;
}
