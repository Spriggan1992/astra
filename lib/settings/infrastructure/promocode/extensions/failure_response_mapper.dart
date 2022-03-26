import 'package:astra_app/settings/domain/promocode/promocode_failure.dart';

/// Error converter.
extension Error400 on Map<String, dynamic> {
  /// Convert errors from server to [PromocodeFailure].
  PromocodeFailure get failure {
    if (this['error'] == 'Promocode is not valid.') {
      return const PromocodeFailure.isNotValid();
    } else {
      return const PromocodeFailure.notExist();
    }
  }
}
