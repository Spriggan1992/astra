import 'package:astra_app/application/settings/store/store_actor/store_actor_bloc.dart';
import 'package:astra_app/application/settings/store/store_bloc.dart';
import 'package:astra_app/domain/store/models/like.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/enums/store_screen_qualifier.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/store_dialog.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/astra_check_box.dart';
import 'widgets/grouped_selected_like_packages.dart';

class StoreScreen extends StatelessWidget {
  /// Current screen qualifier
  final StoreScreenQualifier storeQualifer;
  const StoreScreen(
      {Key? key, this.storeQualifer = StoreScreenQualifier.storeSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StoreBloc>()..add(const StoreEvent.initialized()),
      child: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const LoadingScreen(),
            loadSuccess: (state) => BlocProvider(
              create: (context) => getIt<StoreActorBloc>()
                ..add(StoreActorEvent.initialized(state.likes)),
              child: StoreScreenContent(storeQualifer: storeQualifer),
            ),
            loadFailure: (_) => ErrorScreen(
              onTryAgain: () {},
            ),
          );
        },
      ),
    );
  }
}

class StoreScreenContent extends StatelessWidget {
  final StoreScreenQualifier storeQualifer;
  const StoreScreenContent({Key? key, required this.storeQualifer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          storeQualifer == StoreScreenQualifier.storeSettings,
      child: Scaffold(
        appBar: AstraAppBar(
          onPressed: () {
            context.router.pop();
          },
          title: 'Магазин',
          elevation: 0.3,
          actions: [
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const StoreDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.error_outline,
                size: 25,
                color: Color.fromRGBO(24, 24, 24, 0.6),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Выберите количество лайков,\n которые хотите преобрести',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<StoreActorBloc, StoreActorState>(
              builder: (context, state) => GroupedSelectedLikePackages(
                likes: state.likes,
                onSelectLike: (like) => context
                    .read<StoreActorBloc>()
                    .add(StoreActorEvent.likePackageSelected(like)),
                selectedLike: state.like,
              ),
            ),
            const AstraChekBox(),
            const Divider(
                color: AstraColors.dividerColor,
                thickness: 1,
                endIndent: 25,
                indent: 25),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'К оплате',
                    style: TextStyle(color: AstraColors.black, fontSize: 18),
                  ),
                  BlocBuilder<StoreActorBloc, StoreActorState>(
                    buildWhen: (p, c) => p.like != c.like,
                    builder: (context, state) {
                      return Text(
                        state.like.price.toString(),
                        style: const TextStyle(
                            color: AstraColors.black, fontSize: 18),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            AstraGradientButton(
              onTap: () {
                AutoRouter.of(context).push(const FinishRegisterScreenRoute());
              },
              title: 'Apple Pay',
            )
          ],
        ),
      ),
    );
  }
}
