import 'package:astra_app/application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart';
import 'package:astra_app/domain/image_picker/models/image.dart';
import 'package:astra_app/presentation/core/theming/icons/svg_icon.dart';
import 'package:astra_app/presentation/core/widgets/images/astra_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/custom_dialog.dart';

///  Defines FullImageScreen.
class ShowImageFullScreen extends StatelessWidget {
  /// Images.
  final List<ImageModel> images;
  const ShowImageFullScreen({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FullScreenImageBloc>()
        ..add(FullScreenImageEvent.initialized(images)),
      child: BlocBuilder<FullScreenImageBloc, FullScreenImageState>(
        builder: (context, state) {
          return Container(
            color: Colors.transparent,
            child: GestureDetector(
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
                                FullScreenImageEvent.curentImageIndexSet(value),
                              ),
                          itemCount: state.images.length,
                          itemBuilder: (context, index) {
                            return AstraNetworkImage(
                                imageUrl: state.images[index].imageUrl);
                          },
                        ),
                        Positioned(
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
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (BuildContext
                                                showDilogcontext) {
                                              return CustomDialog(
                                                title: const Text(
                                                  "Вы точно хотите удалить фотографию?",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                action1: TextButton(
                                                  onPressed: () => Navigator.of(
                                                          showDilogcontext)
                                                      .pop(false),
                                                  child: const Text(
                                                    "Отмена",
                                                    style: TextStyle(
                                                        color:
                                                            AstraColors.black),
                                                  ),
                                                ),
                                                action2: TextButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                FullScreenImageBloc>(
                                                            context)
                                                        .add(const FullScreenImageEvent
                                                            .imagesDeleted());
                                                    context.router.pop();
                                                  },
                                                  child: const Text(
                                                    "Удалить",
                                                    style: TextStyle(
                                                        color: Colors.red),
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
                                            'Может удолить куратор',
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
                                      )),
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
                              Navigator.of(context).pop();
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
            ),
          );
        },
      ),
    );
  }
}
