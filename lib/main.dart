import 'package:astra_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'api/auth/infrastructure/sembast_database.dart';
import 'run_astra_app.dart';

void main() async {
  await _appInitializer();
}

/// Initializes dependencies.
Future<void> _appInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await getIt<SembastDatabase>().init();
  BlocOverrides.runZoned(() => runApp(const AstraApp()),
      blocObserver: SimpleBlocObserver());
}
