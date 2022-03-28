import 'package:astra_app/core/presentation/constants/app_tests.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/dialog_two_actions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Represent dialog layout of unsuccessfully submitted promo code.
class PromocodeDialogFailure extends StatelessWidget {
  const PromocodeDialogFailure({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogTwoActions(
      content: Column(
        children: const [
          SizedBox(height: 16),
          SvgIcon(asset: 'assets/icons/promocode_failure.svg'),
          SizedBox(height: 4),
          Text(
            AppTexts.oops,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: Color(0xFFFFBA0A)),
          ),
          SizedBox(height: 18),
          Text(
          AppTexts.failedApplyPromoCode,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 4),
          Text(
            AppTexts.contactYouCurator,
            style: TextStyle(fontSize: 15, color: AstraColors.black06),
          )
        ],
      ),
      action1: DialogActionButton(
        title: AppTexts.cancel,
        onClick: () {
          context.router.pop();
        },
      ),
      action2: DialogActionButton(
        title: AppTexts.curator,
        onClick: () async {
          await context.router.pop();
          context.router.replace(const SupportScreenRoute());
        },
      ),
    );
  }
}
