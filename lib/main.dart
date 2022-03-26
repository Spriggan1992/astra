import 'package:astra_app/core/infrastructure/database/sembast/sembast_database.dart';
import 'package:astra_app/core/infrastructure/http/dio_interceptor.dart';
import 'package:astra_app/core/presentation/routes/app_router.gr.dart';
import 'package:astra_app/core/presentation/run_astra_app.dart';
import 'package:astra_app/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
  BlocOverrides.runZoned(() => runApp(const AstraApp()));
}
