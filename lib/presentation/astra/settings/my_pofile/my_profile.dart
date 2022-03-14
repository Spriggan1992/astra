import 'package:astra_app/application/search/search_action/search_action_bloc.dart';
import 'package:astra_app/application/settings/my_profile/my_profile/my_profile_bloc.dart';
import 'package:astra_app/application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/theming/icons/svg_icon.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/snack_bar.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/astra_appbar.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_app/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_widgets.dart';

/// Defines MyProfileScreen.
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyProfileBloc>(
      create: (context) =>
          getIt<MyProfileBloc>()..add(const MyProfileEvent.profileLoaded()),
      child: BlocBuilder<MyProfileBloc, MyProfileState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const LoadingScreen(),
            loadSuccess: (state) => BlocProvider(
              create: (context) => getIt<MyProfileActorBloc>()
                ..add(
                  MyProfileActorEvent.initialized(state.profile),
                ),
              child: MultiBlocListener(
                listeners: [
                  BlocListener<MyProfileActorBloc, MyProfileActorState>(
                    listener: (context, state) {
                      if (state.isShowNoInternetConnectionError) {
                        showSnackBar(context);
                      }
                      if (state.isSuccessfullySubmitted) {
                        context
                            .read<MyProfileBloc>()
                            .add(const MyProfileEvent.profileLoaded());
                      }
                    },
                  ),
                  BlocListener<SearchActionBloc, SearchActionState>(
                    listener: (context, state) {
                      if (state.canCloseDialog) {
                        context.read<MyProfileActorBloc>().add(
                            const MyProfileActorEvent
                                .accountVisibilityToggled());
                      }
                    },
                  ),
                ],
                child: MyProfileScreenContent(
                  profile: state.profile,
                ),
              ),
            ),
            loadFailure: (state) => ErrorScreen(
              failure: state.failure,
              onTryAgain: () {
                context
                    .read<MyProfileBloc>()
                    .add(const MyProfileEvent.profileLoaded());
              },
            ),
          );
        },
      ),
    );
  }
}

/// Defines content for MyProfileScreen.
class MyProfileScreenContent extends StatefulWidget {
  final Profile profile;
  const MyProfileScreenContent({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  State<MyProfileScreenContent> createState() => _MyProfileScreenContentState();
}

class _MyProfileScreenContentState extends State<MyProfileScreenContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProfileActorBloc, MyProfileActorState>(
      builder: (context, scaffoldState) {
        if (scaffoldState.isLoading) {
          return const LoadingScreen();
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AstraAppBar(
              onPressed: () {
                AutoRouter.of(context).pop(true);
              },
              title: 'Мой профиль',
              actions: [
                BlocBuilder<MyProfileActorBloc, MyProfileActorState>(
                  buildWhen: (p, c) => p.isEditMode != c.isEditMode,
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        context
                            .read<MyProfileActorBloc>()
                            .add(const MyProfileActorEvent.editModeToggled());
                        if (state.isEditMode) {
                          context.read<MyProfileActorBloc>().add(
                                const MyProfileActorEvent.changesSubmitted(),
                              );
                        }
                      },
                      child: (state.isEditMode)
                          ? const Icon(Icons.check, color: AstraColors.black)
                          : const SvgIcon(
                              asset: 'assets/icons/pencil.svg', height: 20),
                    );
                  },
                ),
              ],
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height * 0.82,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo.
                      BlocConsumer<MyProfileActorBloc, MyProfileActorState>(
                        buildWhen: (p, c) =>
                            p.isEditMode != c.isEditMode ||
                            p.profile.profilePhotos !=
                                c.profile.profilePhotos ||
                            p.selectedImages != c.selectedImages,
                        builder: (context, state) {
                          return ProfileLogoScreen(
                            images: widget.profile.profilePhotos,
                            addedImg: state.selectedImages.isNotEmpty
                                ? state.selectedImages[0]
                                : null,
                            isEditMode: state.isEditMode,
                            onPickImage: () {
                              context
                                  .read<MyProfileActorBloc>()
                                  .add(const MyProfileActorEvent.imagesAdded());
                            },
                            onShowImage: () async {
                              await context.router.push(
                                ShowImageFullScreenRoute(
                                  images: widget.profile.profilePhotos,
                                  enableDeleteButton: true,
                                ),
                              );
                            },
                          );
                        },
                        listenWhen: (p, c) =>
                            p.uploadImageLimited != c.uploadImageLimited,
                        listener: (context, listenState) {
                          if (listenState.uploadImageLimited) {
                            showSnackBar(context,
                                title: 'Превышен лимит загрузки фотографии');
                          }
                        },
                      ),

                      const SizedBox(height: 8),
                      // User info.
                      BlocBuilder<MyProfileActorBloc, MyProfileActorState>(
                        buildWhen: (p, c) =>
                            p.profile.userInfo != c.profile.userInfo,
                        builder: (context, state) {
                          return Align(
                            alignment: Alignment.center,
                            child: Text(
                              state.profile.userInfo,
                              style: const TextStyle(
                                color: AstraColors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        },
                      ),

                      /// Short info about user.
                      BlocBuilder<MyProfileActorBloc, MyProfileActorState>(
                        buildWhen: (p, c) =>
                            p.isEditMode != c.isEditMode ||
                            p.profile.profileInfo != c.profile.profileInfo,
                        builder: (context, shortInfoState) {
                          return ProfileTextField(
                            isEditingMode: shortInfoState.isEditMode,
                            description: widget.profile.profileInfo,
                            leftSymbols:
                                shortInfoState.profile.profileInfo.length,
                            onChanged: (value) {
                              context.read<MyProfileActorBloc>().add(
                                  MyProfileActorEvent.descriptionChanged(
                                      value));
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'На счету:',
                              style: TextStyle(
                                color: AstraColors.black04,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            BlocBuilder<MyProfileActorBloc,
                                MyProfileActorState>(
                              builder: (context, state) {
                                return Text(
                                  state.profile.likeAmount < 0
                                      ? '0'
                                      : state.profile.likeAmount.toString(),
                                  style: const TextStyle(
                                    color: AstraColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AstraColors.black01,
                        thickness: 1,
                      ),
                      BlocBuilder<MyProfileActorBloc, MyProfileActorState>(
                        buildWhen: (p, c) =>
                            p.profile.showInfo != c.profile.showInfo,
                        builder: (context, state) {
                          return ProfileSwitchWidget(
                            onChanged: (value) {
                              context.read<MyProfileActorBloc>().add(
                                  const MyProfileActorEvent
                                      .accountInfoDisplayingToggled());
                            },
                            switchValue: state.profile.showInfo,
                            title: 'Отображать подробную анкету',
                          );
                        },
                      ),
                      BlocBuilder<MyProfileActorBloc, MyProfileActorState>(
                        buildWhen: (p, c) =>
                            p.profile.isHidden != c.profile.isHidden,
                        builder: (context, state) {
                          return ProfileSwitchWidget(
                            onChanged: (value) {
                              context.read<MyProfileActorBloc>().add(
                                  const MyProfileActorEvent
                                      .accountVisibilityToggled());
                            },
                            switchValue: state.profile.isHidden,
                            title: 'Скрыть профиль',
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      CuratorListTile(
                        trailingRadius: 20,
                        curatorPhoto: widget.profile.curatorPhotos.first,
                        curatorFullName: widget.profile.curatorFullName,
                        onPressed: () {},
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Divider(
                          color: AstraColors.black01,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
