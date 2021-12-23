import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_history.freezed.dart';

/// Represent top-up history.
@freezed
class WalletHistory with _$WalletHistory {
  const WalletHistory._();
  const factory WalletHistory({
    /// History identifier.
    required int id,

    /// Amount of added likes
    required int amount,

    /// Date and time of top-up account.
    required String datetime,

    /// Adress
    required String address,
  }) = _WalletHistory;

  /// Return emty walet package.
  factory WalletHistory.empty() => const WalletHistory(
        id: 0,
        amount: 0,
        datetime: '',
        address: '',
      );
}
