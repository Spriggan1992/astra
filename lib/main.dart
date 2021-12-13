import 'package:astra_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'run_astra_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  BlocOverrides.runZoned(() => runApp(const AstraApp()),
      blocObserver: SimpleBlocObserver());
}
