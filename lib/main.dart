import 'package:astra_app/infrastructure/core/http/dio_interceptor.dart';
import 'package:astra_app/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/core/database/sembast/sembast_database.dart';
import 'presentation/core/run_astra_app.dart';

void main() async {
  await _appInitializer();
}

/// Initializes dependencies.
Future<void> _appInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await getIt<SembastDatabase>().init();
  getIt<Dio>().interceptors.add(getIt<DioInterceptor>());
  BlocOverrides.runZoned(() => runApp(const AstraApp()),
      blocObserver: SimpleBlocObserver());
}
