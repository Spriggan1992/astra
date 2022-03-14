import 'package:astra_app/application/favorite/favorite_actor/favorite_actor_bloc.dart';
import 'package:astra_app/application/favorite/favorite_bloc.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_screen_content.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines start screen for favorite.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state.isNoInternetConnection || state.isUnexpectedError) {
          return ErrorScreen(
            failure: state.isNoInternetConnection
                ? const AstraFailure.noConnection()
                : const AstraFailure.api(),
            onTryAgain: () {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(const FavoriteEvent.loadedData());
            },
          );
        }
        return BlocProvider(
          create: (context) => getIt<FavoriteActorBloc>()
            ..add(FavoriteActorEvent.initialized(state.profiles)),
          child: const FavoriteScreenContent(),
        );
      },
    );
  }
}
