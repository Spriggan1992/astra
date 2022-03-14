import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/search/search_action/search_action_bloc.dart';
import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/application/core/enums/search_state_type.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/presentation/astra/search/search_screen.dart';
import 'package:astra_app/presentation/core/enums/store_screen_qualifier.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Search bloc router to show screen quess from the state
class SearchPageRoute extends StatelessWidget {
  final FavoriteScreenType? favoriteType;
  const SearchPageRoute({
    Key? key,
    this.favoriteType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchActionBloc, SearchActionState>(
      listener: (context, state) {
        if (state.canCloseDialog) {
          context.popRoute();
        }
      },
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, listenState) {
          if (listenState.stateType == SearchStateType.success) {
            if (listenState.isHiddenProfile) {
              _showHiddenAccountDialog(
                context: context,
                title:
                    'Вы не можете просматривать анкеты, так как ваш профиль скрыт',
                positiveBtnTitle: 'Включить',
                positiveBtnPressed: () => context
                    .read<SearchActionBloc>()
                    .add(const SearchActionEvent.accountShown()),
              );
            }
          }
          if (listenState.stateType == SearchStateType.emptyBalance) {
            _showHiddenAccountDialog(
              context: context,
              title: 'У вас не осталось лайков, пополните баланс',
              positiveBtnTitle: 'Магазин',
              positiveBtnPressed: () {
                context.navigateTo(
                  CommonStoreScreenRouter(
                    storeQualifier: StoreScreenQualifier.storeSearch,
                  ),
                );
                context.popRoute();
              },
            );
          }
        },
        builder: (context, state) {
          if (state.stateType == SearchStateType.success ||
              state.stateType == SearchStateType.emptyBalance) {
            return SearchScreen(applicants: state.applicants);
          } else if (state.stateType == SearchStateType.failure) {
            return ErrorScreen(
              failure: state.isUnexpectedError
                  ? const AstraFailure.api()
                  : const AstraFailure.noConnection(),
              onTryAgain: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(const SearchEvent.loadData());
              },
            );
          } else {
            return const Scaffold(
              body: Center(
                child: PlatformActivityIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  /// Used when user profile is hidden
  _showHiddenAccountDialog({
    required BuildContext context,
    required String title,
    required String positiveBtnTitle,
    required VoidCallback positiveBtnPressed,
  }) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        return DialogTwoActions(
          content: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AstraColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          action1: TextButton(
            child: const Text(
              'Отмена',
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              context.popRoute();
              context.navigateTo(const FavoritesTab());
            },
          ),
          action2: TextButton(
            child: Text(
              positiveBtnTitle,
              style: const TextStyle(
                color: AstraColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              positiveBtnPressed();
            },
          ),
        );
      },
    );
  }
}
