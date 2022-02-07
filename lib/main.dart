import 'package:astra_app/infrastructure/core/http/dio_interceptor.dart';
import 'package:astra_app/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/core/database/sembast/sembast_database.dart';
import 'presentation/core/routes/app_router.gr.dart';
import 'presentation/core/run_astra_app.dart';

void main() async {
  await _appInitializer();
}

/// Initializes dependencies.
Future<void> _appInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await getIt<SembastDatabase>().init();
  getIt<Dio>()
    ..options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    )
    ..interceptors.add(getIt<DioInterceptor>());
  getIt.registerSingleton<AppRouter>(AppRouter());
  BlocOverrides.runZoned(() => runApp(const AstraApp()),
      blocObserver: SimpleBlocObserver());
}
