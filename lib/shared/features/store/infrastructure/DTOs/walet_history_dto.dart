import 'package:astra_app/shared/features/store/domain/models/wallet_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'walet_history_dto.freezed.dart';
part 'walet_history_dto.g.dart';

/// Represent top-up history.
@freezed
class WalletHistoryDTO with _$WalletHistoryDTO {
  const WalletHistoryDTO._();
  const factory WalletHistoryDTO({
    /// History identifier.
    required int id,

    /// Amount of added likes
    required int amount,

    /// Date and time of top-up account.
    required String datetime,

    /// Address
    required String address,
  }) = _WalletHistoryDTO;

  /// Return converted DTO from json.
  factory WalletHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryDTOFromJson(json);

  /// Convert object to json.
  factory WalletHistoryDTO.toJson() {
    return WalletHistoryDTO.toJson();
  }

  /// Return converted DTO from from domain.
  factory WalletHistoryDTO.fromDomain(WalletHistory _) {
    return WalletHistoryDTO(
      id: _.id,
      amount: _.amount,
      datetime: _.datetime,
      address: _.address,
    );
  }

  /// Convert DTO to domain.
  WalletHistory toDomain() => WalletHistory(
        id: id,
        amount: amount,
        datetime: datetime,
        address: address,
      );
}
