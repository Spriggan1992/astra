import 'package:astra_app/application/settings/support/clip_board/clip_board_cubit.dart';
import 'package:astra_app/application/settings/support/support_bloc.dart';
import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/settings/my_pofile/widgets/profile_widgets.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines SupportScreen.
class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SupportBloc>()..add(const SupportEvent.supportLoaded()),
      child: BlocBuilder<SupportBloc, SupportState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => SizedBox.fromSize(),
            loadInProgress: (_) => const LoadingScreen(),
            loadSuccess: (state) => BlocProvider(
              create: (context) => getIt<ClipBoardCubit>(),
              child: SupportScreenContent(curatorInfo: state.curatorInfo),
            ),
            loadFailure: (state) => ErrorScreen(
              failure: state.failure,
              onTryAgain: () {
                context
                    .read<SupportBloc>()
                    .add(const SupportEvent.supportLoaded());
              },
            ),
          );
        },
      ),
    );
  }
}

/// Defines content for Support screen.
class SupportScreenContent extends StatelessWidget {
  /// Information about curator.
  final CuratorModel curatorInfo;
  const SupportScreenContent({
    Key? key,
    required this.curatorInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'Поддержка',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CuratorListTile(
              curator: curatorInfo,
              trailingRadius: 28,
              onPressed: () {},
            ),

            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Divider(
                color: AstraColors.black01,
                thickness: 1,
              ),
            ),
            // const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(29, 46, 86, 0.05),
                borderRadius: BorderRadius.circular(14),
              ),
              height: 66,
              child: Row(
                children: [
                  Text(
                    curatorInfo.email,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AstraColors.black,
                    ),
                  ),
                  const Expanded(
                    child: VerticalDivider(
                      color: AstraColors.black01,
                      width: 30,
                      thickness: 1,
                    ),
                  ),
                  BlocBuilder<ClipBoardCubit, ClipBoardState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: (state.copiedData.isNotEmpty)
                            ? null
                            : () {
                                context
                                    .read<ClipBoardCubit>()
                                    .saveData(curatorInfo.email);
                              },
                        child: Text(
                          'Копировать',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: (state.copiedData.isNotEmpty)
                                ? AstraColors.black06
                                : AstraColors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Вы можете оставить заявку вашему \nкуратору, либо отправить \nсообщение на email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AstraColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
