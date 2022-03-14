import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/presentation/core/routes/app_router.gr.dart';
import 'package:astra_app/presentation/core/theming/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth/auth_bloc.dart';
import '../../injection.dart';
import 'widgets/custom/restart_widget.dart';

// This widget is the root of your application.
class AstraApp extends StatelessWidget {
  const AstraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => getIt<SearchBloc>(),
          ),
        ],
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerDelegate: getIt<AppRouter>().delegate(),
          routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
