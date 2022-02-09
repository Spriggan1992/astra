import 'package:astra_app/application/settings/store/store_actor/store_actor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'dart:developer';

class AstraPayButton extends StatelessWidget {
  /// BuildContext [context]
  final BuildContext context;

  /// The StoreActorState [state]
  final StoreActorState state;

  /// The callback that is called when Apple Pay payment processed
  final ValueSetter<Map<String, dynamic>> onApplePayResult;

  /// The callback that is called when Google Pay payment processed
  final ValueSetter<Map<String, dynamic>> onGooglePayResult;

  /// The callback that is called when the button is tapped.
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
        _APayButton(
          context: context,
          state: state,
          onApplePayResult: onApplePayResult,
          onPressed: onPressed,
        ),
        _GPayButton(
          context: context,
          state: state,
          onGooglePayResult: onGooglePayResult,
          onPressed: onPressed,
        ),
      ],
    );
  }
}

class _APayButton extends StatelessWidget {
  final BuildContext context;
  final StoreActorState state;
  final ValueSetter<Map<String, dynamic>> onApplePayResult;
  final VoidCallback? onPressed;

  const _APayButton({
    Key? key,
    required this.context,
    required this.state,
    required this.onApplePayResult,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class _GPayButton extends StatelessWidget {
  final BuildContext context;
  final StoreActorState state;
  final ValueSetter<Map<String, dynamic>> onGooglePayResult;
  final VoidCallback? onPressed;

  const _GPayButton({
    Key? key,
    required this.context,
    required this.state,
    required this.onGooglePayResult,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
