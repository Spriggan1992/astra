import 'package:astra_app/ui/astra/home_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/image_pick_screen.dart';
import 'package:astra_app/ui/astra/profile/my_pofile/photo/show_image_full_screen.dart';
import 'package:astra_app/ui/config/colors.dart';
import 'package:astra_app/ui/glodal/icons/svg_icon.dart';
import 'package:astra_app/ui/glodal/widgets/scaffolds/astra_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_widgets.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/myprofilescreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MyProfileScreen(),
    );
  }

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool _isEditMode = false;

  bool _displayProfile = true;
  bool _hideProfile = false;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text =
        'На свете нет ни одного человека, который бы не мечтал. Я не стала исключением, в моей голове создавались образы прекрасного будущего.dsa..';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AstraAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'Мой профиль',
        actions: [
          TextButton(
            onPressed: () {
              _isEditMode = !_isEditMode;
              setState(() {});
            },
            child: (_isEditMode)
                ? const Icon(Icons.check, color: AstraColors.black)
                : const SvgIcon(asset: 'assets/icons/pencil.svg', height: 20),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileLogoScreen(
              isEditMode: _isEditMode,
              onPickImage: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(ImagePickScreen.routeName);
              },
              onShowImage: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(ShowImageFullScreen.routeName);
              },
            ),
            const SizedBox(height: 8),
            const Text(
              'Август Августин, 30',
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            (_isEditMode)
                ? ProfileTextField(
                    controller: _controller,
                    leftSymbols: _controller.text.length,
                    onChanged: (value) {},
                  )
                : _DescriptionWidget(text: _controller.text),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'На счету:',
                    style: TextStyle(
                      color: AstraColors.black04,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '4 лайка',
                    style: TextStyle(
                      color: AstraColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: AstraColors.black01,
              thickness: 1,
            ),
            ProfileSwitchWidget(
              onChanged: (value) {
                _displayProfile = value;
                setState(() {});
              },
              switchValue: _displayProfile,
              title: 'Отображать подробную анкету',
            ),
            ProfileSwitchWidget(
              onChanged: (value) {
                _hideProfile = value;
                setState(() {});
              },
              switchValue: _hideProfile,
              title: 'Скрыть профиль',
            ),
            const SizedBox(height: 12),
            KuratorListTile(
              leadingRadius: 22,
              trallingRadius: 20,
              name: 'Алексей Муховец',
              backgroundImage: Image.asset('assets/right_girl.png').image,
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
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Краткое описание:',
            style: TextStyle(
              color: AstraColors.black04,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              color: AstraColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
