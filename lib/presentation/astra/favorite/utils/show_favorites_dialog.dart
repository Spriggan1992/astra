import 'package:astra_app/application/chats/chats_bloc.dart';
import 'package:astra_app/application/core/enums/favorite_screen_type.dart';
import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/application/search/search_action/search_action_bloc.dart';
import 'package:astra_app/domain/favorites/match_status.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/core/enums/store_screen_qualifier.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/utils/show_one_action_dialog.dart';
import 'package:astra_app/presentation/core/utils/show_two_action_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Show dialogs for [FavoriteScreen].
void showFavoritesDialog(
  /// A handle to the location of a widget in the widget tree.
  BuildContext context,

  /// Enumeration of the display category of the screen favorites.
  FavoriteScreenType favoriteType,

  /// Applicants profiles.
  List<Profile> profiles,

  /// Applicant profile.
  Profile profile,

  /// Whether the current user is hidden.
  bool isHiddenProfile,

  /// Whether the current user has empty balance.
  bool isEmptyBalance,
) {
  final isStopList = favoriteType == FavoriteScreenType.stopList;
  final isMatch = favoriteType == FavoriteScreenType.match;
  final isLikeForYou = favoriteType == FavoriteScreenType.likesForYou;
  final isThink = favoriteType == FavoriteScreenType.think;

  if (isMatch) {
    _showMatchDialog(context, profile);
  } else {
    if (isEmptyBalance) {
      _showEmptyBalanceDialog(context);
    } else if (isHiddenProfile) {
      _showHideAccountDialog(context);
    } else {
      if (isStopList) {
        showOneActionDialog(
          context: context,
          dialogTitle: 'Пользователи пересен в раздел\n«подумать‎»',
          btnTitle: 'Продолжить',
          onClick: (dialogContext) {
            context.read<FavoriteActorBloc>().add(
                  FavoriteActorEvent.removedFromStopList(
                    profile,
                  ),
                );
            dialogContext.popRoute();
          },
        );
      } else if (isLikeForYou || isThink) {
        context
            .pushRoute(FavoriteSearchRouter(
              applicants: profiles,
              favoriteType: favoriteType,
            ))
            .then(
              (value) => context.read<FavoriteBloc>().add(
                    FavoriteEvent.loadedData(favoriteType: favoriteType),
                  ),
            );
      } else {
        context.router.navigate(
          UsersFormScreenRouter(
            profile: profile,
          ),
        );
      }
    }
  }
}

void _showEmptyBalanceDialog(BuildContext context) {
  showTwoActionDialog(
    context: context,
    dialogTitle:
        'У вас недостаточно средст на счету.\nДля подтверждения мэтча необходимо пополнить баланс',
    positiveBtnTitle: 'В магазин',
    onPositiveBtnClick: (dialogContext) {
      dialogContext.router.pop();
      context.pushRoute(CommonStoreScreenRouter(
          storeQualifier: StoreScreenQualifier.storeSettings));
    },
  );
}

void _showHideAccountDialog(BuildContext context) {
  showTwoActionDialog(
    context: context,
    dialogTitle:
        'Вы не можете просматривать анкеты,\nтак как ваш профиль скрыт',
    positiveBtnTitle: 'Включить',
    onPositiveBtnClick: (dialogContext) {
      dialogContext.router.pop();
      context
          .read<SearchActionBloc>()
          .add(const SearchActionEvent.accountShown());
    },
  );
}

void _showMatchDialog(
  BuildContext context,
  Profile profile,
) {
  final isAwaiting = profile.matchStatus == MatchStatus.awaiting;
  final isEmptyBalance = profile.matchStatus == MatchStatus.emptyBalance;
  final isSuccess = profile.matchStatus == MatchStatus.success;
  if (isAwaiting) {
    context.router.push(UsersFormScreenRouter(
        profile: profile, matchStatus: profile.matchStatus));
  }
  if (isEmptyBalance) {
    _showEmptyBalanceDialog(context);
  }
  if (isSuccess) {
    showTwoActionDialog(
      context: context,
      dialogTitle: 'Выберите куда перейти',
      negativeBtnTitle: 'Анкета',
      positiveBtnTitle: 'Чат',
      onNegativeBtnClick: (dialogContext) {
        dialogContext.popRoute();
        context.navigateTo(
          UsersFormScreenRouter(
            profile: profile,
          ),
        );
      },
      onPositiveBtnClick: (dialogContext) {
        dialogContext.router.pop();
        context
            .read<ChatsBloc>()
            .add(ChatsEvent.existenceChatChecked(profile.id));
      },
    );
  }
}
