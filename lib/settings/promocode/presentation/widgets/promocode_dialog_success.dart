import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/theming/gradients.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/core/presentation/widgets/custom/gradient_text.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/dialog_one_actions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Represent dialog layout of successfully submitted promo code.
class PromocodeDialogSuccess extends StatelessWidget {
  /// Information how many likes do u get from promocode.
  final String likes;
  const PromocodeDialogSuccess(
    this.likes, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogOneAction(
      content: Column(
        children: [
          const SizedBox(height: 16),
          const SvgIcon(asset: 'assets/icons/promocode_success.svg'),
          const SizedBox(height: 37),
          const Text(
            AppTexts.creditedSuccessfully,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),
          GradientText(
            likes,
            style: const TextStyle(fontSize: 15),
            gradient: const LinearGradient(colors: Gradients.goldenGradient),
          )
        ],
      ),
      action: DialogActionButton(
        title: AppTexts.perfect,
        onClick: () {
          context.router.pop();
          context.router.navigate(const SettingsTab());
        },
      ),
    );
  }
}
