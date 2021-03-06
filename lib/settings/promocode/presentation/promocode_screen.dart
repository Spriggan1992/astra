import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/widgets/buttons/astra_elevated_button.dart';
import 'package:astra_app/core/presentation/widgets/custom/keyboard_visibility.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/snack_bar.dart';
import 'package:astra_app/core/presentation/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/settings/promocode/application/promocode_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'widgets/promocode_dialog_failure.dart';
import 'widgets/promocode_dialog_success.dart';
import 'widgets/promocode_text_field.dart';

/// Represent promocode screen.
class PromocodeScreen extends StatelessWidget {
  const PromocodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PromocodeBloc>(),
      child: BlocListener<PromocodeBloc, PromocodeState>(
        listener: (context, state) {
          if (state.isNotValid) {
            showDialog(
              context: context,
              builder: (context) => const PromocodeDialogFailure(),
            );
          }
          if (state.isSuccess) {
            showDialog(
              context: context,
              builder: (context) =>
                  PromocodeDialogSuccess(state.promocodeModel.getLikes),
            );
          }
          if (state.isNoConnectionError) {
            showSnackBar(context);
          }
          if (state.isUnexpectedError) {
            showSnackBar(context, title: 'Что-то пошло не так....');
          }
        },
        child: KeyboardDismisser(
          child: Scaffold(
            appBar: AstraAppBar(
              title: 'Промокод',
              iconColor: AstraColors.black,
              onPressed: () => context.router.pop(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  BlocSelector<PromocodeBloc, PromocodeState, bool>(
                    selector: (state) => state.isNotExist,
                    builder: (context, isNotExist) {
                      return PromocodeTextField(
                        isShowError: isNotExist,
                        onChange: (value) {
                          context
                              .read<PromocodeBloc>()
                              .add(PromocodeEvent.promocodeChanged(value));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  BlocSelector<PromocodeBloc, PromocodeState, bool>(
                    selector: (state) => state.isNotExist,
                    builder: (context, isNotExist) {
                      return Visibility(
                        visible: isNotExist,
                        child: const Text(
                          'Неправильно введен промокод',
                          style: TextStyle(color: AstraColors.red),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        'Введите промокод',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  KeyboardVisibility(
                    scaffoldContext: context,
                    child: (isVisible) =>
                        BlocBuilder<PromocodeBloc, PromocodeState>(
                      buildWhen: (p, c) =>
                          p.textInputIsValid != c.textInputIsValid ||
                          p.isLoading != c.isLoading,
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: isVisible ? 0 : 56),
                          child: AstraElevatedButton(
                            isLoading: state.isLoading,
                            isEnableButton: state.textInputIsValid,
                            title: 'Продолжить',
                            onClick: () {
                              context
                                  .read<PromocodeBloc>()
                                  .add(const PromocodeEvent.codeSubmitted());
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
