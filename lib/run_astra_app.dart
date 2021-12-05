import 'package:astra_app/bloc/login/login_cubit.dart';
import 'package:astra_app/bloc/password/password_cubit.dart';
import 'package:astra_app/ui/astra/home_screen.dart';
import 'package:astra_app/ui/config/route.dart';
import 'package:astra_app/ui/glodal/themes/app_theme.dart';
import 'package:astra_app/ui/signin/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'repositories/auth_repository.dart';
import 'repositories/local_repository.dart';

class AstraApp extends StatelessWidget {
  const AstraApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => LocalRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                localRepository: context.read<LocalRepository>())
              ..add(AuthAppStartEvent()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<PasswordCubit>(
            create: (context) =>
                PasswordCubit(localRepository: context.read<LocalRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Astra app',
          theme: AppTheme.lightTheme,
          home: Container(),
          initialRoute: HomeScreen.routeName, //SplashScreen.routeName,
          onGenerateRoute: AstraRouter.onGenerateRoute,
        ),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('created $bloc');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    print('closed $bloc');
    super.onClose(bloc);
  }
}
