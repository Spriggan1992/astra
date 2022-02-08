import 'package:astra_app/application/settings/store/store_actor/store_actor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'dart:developer';

class AstraPayButton extends StatelessWidget {
  final BuildContext context;
  final StoreActorState state;
  final ValueSetter<Map<String, dynamic>> onApplePayResult;
  final ValueSetter<Map<String, dynamic>> onGooglePayResult;
  final VoidCallback? onPressed;

  /// Implements ApplePay & GooglePay buttons and renders proper button
  /// depending of platform and StoreActorState [state]
  /// TODO: Add valid merchant info into configs
  const AstraPayButton({
    Key? key,
    required this.context,
    required this.state,
    required this.onApplePayResult,
    required this.onGooglePayResult,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _aPayButton(context, state),
        _gPayButton(context, state),
      ],
    );
  }

  Widget _aPayButton(BuildContext context, StoreActorState state) {
    return Column(
      children: List.generate(
        state.likes.length,
        (index) => (state.like.id == state.likes[index].id)
            ? ApplePayButton(
                paymentConfigurationAsset:
                    'payment_configs/applepay_config.json',
                onPaymentResult: onApplePayResult,
                paymentItems: [
                  PaymentItem(
                    amount: state.likes[index].price.toString(),
                    label: "Покупка ${state.likes[index].amount} лайков",
                    status: PaymentItemStatus.final_price,
                    type: PaymentItemType.total,
                  ),
                ],
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 5),
                height: 55,
                type: ApplePayButtonType.buy,
                style: ApplePayButtonStyle.automatic,
                onPressed: onPressed,
                onError: (err) => log("$err", name: "Apple pay error"),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(),
      ),
    );
  }

  Widget _gPayButton(BuildContext context, StoreActorState state) {
    return Column(
      children: List.generate(
        state.likes.length,
        (index) => (state.like.id == state.likes[index].id)
            ? GooglePayButton(
                paymentConfigurationAsset: 'payment_configs/gpay_config.json',
                onPaymentResult: onGooglePayResult,
                paymentItems: [
                  PaymentItem(
                    amount: state.likes[index].price.toString(),
                    label: "Покупка ${state.likes[index].amount} лайков",
                    status: PaymentItemStatus.final_price,
                    type: PaymentItemType.total,
                  ),
                ],
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 5),
                height: 55,
                type: GooglePayButtonType.buy,
                onPressed: onPressed,
                onError: (err) => log("$err", name: "Google pay error"),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(),
      ),
    );
  }
}
