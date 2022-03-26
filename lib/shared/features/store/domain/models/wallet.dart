import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet.freezed.dart';

/// Represent wallet.
@freezed
class Wallet with _$Wallet {
  const Wallet._();
  const factory Wallet({
    /// Wallet identifier.
    required int id,

    /// Amount of likes on the account.
    required int amount,

    /// Profile identifier.
    required int profielId,
  }) = _Wallet;

  /// Return emty walet package.
  factory Wallet.empty() => const Wallet(
        id: 0,
        amount: 0,
        profielId: 0,
      );
}
