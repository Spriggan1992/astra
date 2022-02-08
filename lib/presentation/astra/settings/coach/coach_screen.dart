import 'package:astra_app/domain/core/user_info_service/i_user_unfo_service.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/injection.dart';
import 'package:astra_app/presentation/astra/favorite/favorite_info_card.dart';
import 'package:astra_app/presentation/astra/favorite/info_button.dart';
import 'package:astra_app/presentation/astra/settings/coach/coach_tile.dart';
import 'package:astra_app/presentation/core/theming/colors.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_app/presentation/core/widgets/dialogs/snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Main coach screen.
class CoachScreen extends StatefulWidget {
  const CoachScreen({Key? key, required this.size}) : super(key: key);

  /// Size of the screen.
  final Size size;

  @override
  _CoachScreenState createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  Profile profile = Profile.empty();
  ImageProvider<Object>? _fullImage;
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();
  GlobalKey key5 = GlobalKey();

  @override
  void initState() {
    profile = getIt<IUserInfoService>().userProfile;

    _fullImage = Image.file(profile.profilePhotos.first.fileImage!).image;

    _initCoachTargets();
    _initCoachMark();

    WidgetsBinding.instance?.addPostFrameCallback(_showCoachDialog);
    super.initState();
  }

  void _showCoachDialog(_) async {
    Future.delayed(const Duration(milliseconds: 500));

    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DialogTwoActions(
          content: const Text(
            'Хотите пройти быстрое обучение?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AstraColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          action1: TextButton(
            child: const Text(
              'Пропустить',
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
          action2: TextButton(
            child: const Text(
              'Начать',
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
        );
      },
    );

    /// If result == true, [Пропустить], go back.
    /// If result == false [Начать] , show coach
    if (result) {
      AutoRouter.of(context).pop();
    } else {
      showTutorial();
    }
  }

  void _showEndCoachDialog() async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DialogOneAction(
          content: const Text(
            'Поздравляем вы прошли обучение!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AstraColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          action: TextButton(
            child: const Text(
              'ОК',
              maxLines: 2,
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

    /// If result == true, [ОК], go to settings screen.
    if (result) {
      AutoRouter.of(context).pop();
    }
  }

  void showTutorial() {
    tutorialCoachMark.show();
  }

  void _initCoachTargets() {
    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: key1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: const CoachTile(
              title: 'Кнопка <<Отклонить>>',
              subtitle:
                  "(При нажатии переносит \nпользователя в <<Избранное -\nСтоп лист>>)",
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 80),
            ),
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: key2,
        alignSkip: Alignment.topRight,
        enableOverlayTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachTile(
                title: 'Кнопка <<Нравитcя>>',
                subtitle:
                    "(При нажатии переносит\n пользователя в раздель \n<<Избранное - Ваши лайки>>",
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(bottom: widget.size.height / 2),
              );
            },
          ),
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachTile(
                title:
                    'Как только вы понравитесь другому \nпользователю, появиться взаимная \nсимпатия, и вы сможете начать \nобщение.',
                subtitle:
                    "(Пользователь перенесется в раздел \n <<Избранное - Лайки вас>>)",
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: widget.size.height / 5),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 3",
        keyTarget: key3,
        alignSkip: Alignment.topRight,
        enableOverlayTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachTile(
                title: 'Кнопка <<Подумать>>',
                subtitle:
                    "(При нажатии переносит пользователя в \nраздел <<Избранное Подумать>>)",
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: widget.size.height / 5),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 5",
        keyTarget: key4,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        paddingFocus: 0,
        radius: 10,
        enableOverlayTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachTile(
                title:
                    'Здесь находится краткая \nинформация вашей будущей пары. \nПри нажатии на окно, вам откроется \nподробная информация.',
                subtitle: "",
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: widget.size.height / 5),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 6",
        keyTarget: key5,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.Circle,
        enableOverlayTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachTile(
                title:
                    'При нажатии на фотографию вам \n откроются окно с остальными \n  фотографиями пользователя.',
                subtitle: "",
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: widget.size.height / 6),
              );
            },
          ),
        ],
      ),
    );
  }

  void _initCoachMark() {
    tutorialCoachMark = TutorialCoachMark(context,
        targets: targets,
        colorShadow: AstraColors.darkGrey,
        textSkip: "X",
        paddingFocus: 0,
        opacityShadow: 0.8, onSkip: () {
      AutoRouter.of(context).pop();
    }, onFinish: () async {
      _showEndCoachDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (_fullImage == null)
                        ? Image.asset('assets/girl.png').image
                        : _fullImage!,
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kToolbarHeight),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FavoriteInfoCard(
                          key: key4,
                          name: profile.firstname,
                          location: profile.userLocation,
                          description: profile.profileInfo,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoButton(
                                key: key1,
                                onTap: () {},
                                icon: Icons.close,
                              ),
                              InfoButton(
                                key: key3,
                                onTap: () {},
                                icon: CupertinoIcons.question,
                                iconSize: 30,
                                height: 52,
                                width: 90,
                              ),
                              InfoButton(
                                key: key2,
                                onTap: () {},
                                icon: Icons.check,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  key: key5,
                  alignment: Alignment.center,
                  height: (widget.size.height / 3) - 60,
                  width: (widget.size.width / 2) - 20,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              centerTitle: true,
              title: TextButton(
                onPressed: () {
                  tutorialCoachMark.show();
                },
                child: const Text(
                  'Обучение',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
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
        ],
      ),
    );
  }
}
