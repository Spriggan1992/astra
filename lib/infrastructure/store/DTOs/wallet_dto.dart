// ignore_for_file: invalid_annotation_target

import 'package:astra_app/domain/store/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_dto.freezed.dart';
part 'wallet_dto.g.dart';

/// Represent wallet data transfer object
@freezed
class WalletDTO with _$WalletDTO {
  const WalletDTO._();
  const factory WalletDTO({
    /// Wallet identifier.
    required int id,

    /// Amount of likes on the account.
    required int amount,

    /// Profile identifier.
    @JsonKey(name: 'profile_id') required int profielId,
  }) = _WalletDTO;

  /// Return converted DTO from json.
  factory WalletDTO.fromJson(Map<String, dynamic> json) =>
      _$WalletDTOFromJson(json);

  /// Convert object to json.
  factory WalletDTO.toJson() {
    return WalletDTO.toJson();
  }

  /// Return converted DTO from from domain.
  factory WalletDTO.fromDomain(Wallet _) {
    return WalletDTO(
      id: _.id,
      amount: _.amount,
      profielId: _.profielId,
    );
  }

  /// Convert DTO to domain.
  Wallet toDomain() => Wallet(
        id: id,
        amount: amount,
        profielId: profielId,
      );
}
