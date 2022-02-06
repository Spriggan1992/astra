import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/application/core/enums/search_state_type.dart';
import 'package:astra_app/application/settings/my_profile/my_profile/my_profile_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/presentation/astra/search/search_screen.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/error_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';

/// Search bloc router to show screen quess from the state
class SearchPageRoute extends StatelessWidget {
  const SearchPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, listenState) {
        if (listenState.stateType == SearchStateType.success) {
          if (listenState.isHidenProfile) {
            showAstraAlertDialog(context);
          }
        }
      },
      builder: (context, state) {
        if (state.stateType == SearchStateType.success) {
          return SearchScreen(applicants: state.applicants);
        } else if (state.stateType == SearchStateType.failure) {
          String _errorMessage = '';

          if (state.isNoInternetConnection) {
            _errorMessage = 'Отсутствует подключение к интернету';
          } else {
            _errorMessage = '';
          }

          return ErrorScreen(
            errorTitle: _errorMessage,
            onTryAgain: () {
              Profile? _profile;
              getIt<MyProfileBloc>().state.mapOrNull(loadSuccess: (value) {
                _profile = value.profile;
              });
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchEvent.loadData(profile: _profile));
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
    );
  }

  /// Used when user profile is hiden
  showAstraAlertDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) {
        return DialogTwoActions(
          content: const Text(
            'Вы не можете просматривать анкеты, так как ваш профиль скрыт',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
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
              AutoRouter.of(context).pop(false);
            },
          ),
          action2: TextButton(
            child: const Text(
              'Включить',
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              AutoRouter.of(context).pop(true);
            },
          ),
        );
      },
    );

    /// If result == true, go to store.
    /// If result == false , go back
    if (result) {
      context.navigateTo(const FavoritesRouter());
    } else {
      context.navigateTo(const FavoritesRouter());
    }
  }
}
