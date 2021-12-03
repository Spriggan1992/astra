import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'run_astra_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(() => runApp(const AstraApp()),
      blocObserver: SimpleBlocObserver());
}
