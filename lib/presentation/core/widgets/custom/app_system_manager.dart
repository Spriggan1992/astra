import 'package:astra_app/application/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent widget-wrapper for determine lifecycle states of app.
class AppSystemManager extends StatefulWidget {
  /// Childe that should be passed.
  final Widget child;
  const AppSystemManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _AppSystemManagerState createState() => _AppSystemManagerState();
}

class _AppSystemManagerState extends State<AppSystemManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      context
          .read<UserBloc>()
          .add(const UserEvent.userStatusOnlineUpdated(false));
    }
    if (state == AppLifecycleState.resumed) {
      context
          .read<UserBloc>()
          .add(const UserEvent.userStatusOnlineUpdated(true));
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
