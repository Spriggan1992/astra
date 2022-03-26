import 'package:astra_app/core/domain/models/image_models.dart';
import 'package:astra_app/core/presentation/theming/colors.dart';
import 'package:astra_app/core/presentation/theming/icons/svg_icon.dart';
import 'package:astra_app/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_app/core/presentation/widgets/dialogs/snack_bar.dart';
import 'package:astra_app/core/presentation/widgets/images/astra_network_image.dart';
import 'package:astra_app/settings/application/my_profile/my_profile/my_profile_bloc.dart';
import 'package:astra_app/shared/features/full_screen_image.dart/application/full_screen_image_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astra_app/injection.dart';

///  Defines FullImageScreen.
class ShowImageFullScreen extends StatelessWidget {
  /// Images.
  final List<ImageModel> images;

  /// A Flag to enable or disable delete button
  final bool enableDeleteButton;

  const ShowImageFullScreen({
    Key? key,
    required this.images,
    this.enableDeleteButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FullScreenImageBloc>()
            ..add(FullScreenImageEvent.initialized(images)),
        ),
        BlocProvider(
          create: (context) => getIt<MyProfileBloc>(),
        ),
      ],
      child: BlocConsumer<FullScreenImageBloc, FullScreenImageState>(
        listener: (context, state) {
          if (state.isShowNoInternetConnectionError) {
            showSnackBar(context);
          }
          if (state.isShowUnexpectedError) {
            showSnackBar(context,
                title:
                    'Произошла непредвиденная ошибка.\nОбратитесь в службу поддержки.');
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => context
                .read<FullScreenImageBloc>()
                .add(const FullScreenImageEvent.appBarAndBottomBarHidden()),
            child: Scaffold(
              body: Stack(
                children: [
                  Stack(
                    children: [
                      if (state.isLoading)
                        const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      PageView.builder(
                        onPageChanged: (value) => context
                            .read<FullScreenImageBloc>()
                            .add(
                              FullScreenImageEvent.currentImageIndexSet(value),
                            ),
                        allowImplicitScrolling: true,
                        itemCount: state.images.length,
                        itemBuilder: (context, index) {
                          return state.images[index].cachedImage?.fullImage ==
                                  null
                              ? AstraNetworkImage(
                                  imageUrl: state.images[index].imageUrl,
                                )
                              : Image.file(
                                  state.images[index].cachedImage!.fullImage!,
                                  fit: BoxFit.cover,
                                );
                        },
                      ),
                      Visibility(
                        visible: enableDeleteButton,
                        child: Positioned(
                          bottom: 0,
                          child: AnimatedOpacity(
                            opacity: state.isHideAppbarAndBottomBar ? 0 : 1,
                            duration: const Duration(milliseconds: 100),
                            child: Container(
                              color: const Color.fromRGBO(0, 0, 0, 0.2),
                              height: 44,
                              width: MediaQuery.of(context).size.width,
                              child: state.currentImageIndex > 2
                                  ? IconButton(
                                      onPressed: state.isHideAppbarAndBottomBar
                                          ? null
                                          : () async {
                                              await showDialog(
                                                context: context,
                                                builder: (
                                                  BuildContext
                                                      showDialogContext,
                                                ) {
                                                  return DialogTwoActions(
                                                    content: const Text(
                                                      "Вы точно хотите удалить\nфотографию?",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    action1: DialogActionButton(
                                                      title: 'Отмена',
                                                      onClick: () =>
                                                          showDialogContext
                                                              .popRoute(false),
                                                    ),
                                                    action2: DialogActionButton(
                                                      title: 'Удалить',
                                                      onClick: () {
                                                        context
                                                            .read<
                                                                FullScreenImageBloc>()
                                                            .add(const FullScreenImageEvent
                                                                .imagesDeleted());
                                                        // BlocProvider.of<
                                                        //             MyProfileBloc>(
                                                        //         context)
                                                        //     .add(const MyProfileEvent
                                                        //         .profileLoaded());
                                                        context.router.pop();
                                                      },
                                                      buttonStyle:
                                                          TextButton.styleFrom(
                                                        primary:
                                                            AstraColors.red,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Может удалить куратор',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 8),
                                        SvgIcon(
                                          asset: 'assets/icons/unlock.svg',
                                          height: 25,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedOpacity(
                    opacity: state.isHideAppbarAndBottomBar ? 0 : 1,
                    duration: const Duration(milliseconds: 100),
                    child: SizedBox(
                      height: 110,
                      child: AppBar(
                        centerTitle: true,
                        title: Text(
                          '${state.currentImageIndex + 1} из ${state.images.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          onPressed: () {
                            context.popRoute();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
