// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'application/auth/auth/auth_bloc.dart' as _i13;
import 'application/auth/code/code_bloc.dart' as _i3;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i14;
import 'application/auth/password/password_bloc.dart' as _i11;
import 'application/auth/phone/phone_bloc.dart' as _i12;
import 'domain/auth/i_auth_api_service.dart' as _i9;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i10;
import 'infrastructure/auth/repositories/i_local_storage.dart' as _i6;
import 'infrastructure/auth/repositories/local_storage.dart' as _i7;
import 'infrastructure/core/database/sembast_database.dart' as _i4;
import 'infrastructure/core/di/app_injectable_module.dart' as _i15;
import 'infrastructure/core/repositories/local_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appInjectableModule = _$AppInjectableModule();
  gh.factory<_i3.CodeBloc>(() => _i3.CodeBloc());
  gh.lazySingleton<_i4.SembastDatabase>(() => appInjectableModule.sembastDb);
  await gh.factoryAsync<_i5.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i6.ILocalStorage>(
      () => _i7.LocalStorage(get<_i4.SembastDatabase>()));
  gh.lazySingleton<_i8.LocalRepository>(
      () => _i8.LocalRepository(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i9.IAuthApiService>(
      () => _i10.AuthApiService(get<_i6.ILocalStorage>()));
  gh.factory<_i11.PasswordBloc>(
      () => _i11.PasswordBloc(get<_i9.IAuthApiService>()));
  gh.factory<_i12.PhoneBloc>(() => _i12.PhoneBloc(get<_i9.IAuthApiService>()));
  gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(get<_i9.IAuthApiService>()));
  gh.factory<_i14.ConfirmPasswordBloc>(
      () => _i14.ConfirmPasswordBloc(get<_i9.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i15.AppInjectableModule {}
