import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/utils/show_one_action_dialog.dart';
import 'package:astra_app/favorites/domain/match_status.dart';
import 'package:astra_app/settings/domain/profile/models/profile_model.dart';
import 'package:astra_app/settings/presentation/my_form/widgets/my_form_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

const _dialogMessage =
    'Ваш партнёр тоже выбрал вас, но, к сожалению, пока не может перейти к общению, потому что пока его баланс\nмэтчей пуст. Когда ваши балансы будут положительны, ваш диалог начнётся автоматически';

const _btnTitle = 'Спасибо, я буду ждать';

/// Defines user form screen.
class UsersFormScreen extends StatefulWidget {
  final MatchStatus matchStatus;

  /// Users profile information.
  final ProfileModel profile;

  const UsersFormScreen({
    Key? key,
    this.matchStatus = MatchStatus.initial,
    required this.profile,
  }) : super(key: key);

  @override
  State<UsersFormScreen> createState() => _UsersFormScreenState();
}

class _UsersFormScreenState extends State<UsersFormScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        if (widget.matchStatus == MatchStatus.awaiting) {
          _showAlertDialog();
        }
      },
    );
    super.initState();
  }

  Future<void> _showAlertDialog() async {
    showOneActionDialog(
      context: context,
      dialogTitle: _dialogMessage,
      btnTitle: _btnTitle,
      onClick: (dialogContext) => dialogContext.router.pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
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
      body: MyFormCard(
        onTap: () {
          context.router.push(
            FavoritesUserInfoRouter(
              applicant: widget.profile,
            ),
          );
        },
        profile: widget.profile,
      ),
    );
  }
}
