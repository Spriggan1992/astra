// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'application/auth/auth/auth_bloc.dart' as _i24;
import 'application/auth/code/code_bloc.dart' as _i3;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i25;
import 'application/auth/password/password_bloc.dart' as _i22;
import 'application/auth/phone/phone_bloc.dart' as _i23;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i13;
import 'application/settings/store/store_bloc.dart' as _i14;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i17;
import 'domain/auth/repositories/i_local_storage.dart' as _i19;
import 'domain/store/repositories/i_store_reposytory.dart' as _i8;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i18;
import 'infrastructure/auth/repositories/authenticator.dart' as _i15;
import 'infrastructure/auth/repositories/local_storage.dart' as _i20;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i6;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i7;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i11;
import 'infrastructure/core/di/app_injectable_module.dart' as _i26;
import 'infrastructure/core/http/dio_interceptor.dart' as _i16;
import 'infrastructure/core/repositories/local_repository.dart' as _i21;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appInjectableModule = _$AppInjectableModule();
  gh.factory<_i3.CodeBloc>(() => _i3.CodeBloc());
  gh.lazySingleton<_i4.Dio>(() => appInjectableModule.dio);
  gh.lazySingleton<_i5.FlutterSecureStorage>(
      () => appInjectableModule.secureStorage);
  gh.lazySingleton<_i6.ISecureStorage>(
      () => _i7.SecureStorage(get<_i5.FlutterSecureStorage>()));
  gh.lazySingleton<_i8.IStoreReposytory>(
      () => _i9.StoreRepository(get<_i4.Dio>()));
  gh.lazySingleton<_i10.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.lazySingleton<_i11.SembastDatabase>(() => appInjectableModule.sembastDb);
  await gh.factoryAsync<_i12.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i13.StoreActorBloc>(() => _i13.StoreActorBloc());
  gh.factory<_i14.StoreBloc>(() => _i14.StoreBloc(get<_i8.IStoreReposytory>()));
  gh.lazySingleton<_i15.Authenticator>(
      () => _i15.Authenticator(get<_i4.Dio>(), get<_i6.ISecureStorage>()));
  gh.lazySingleton<_i16.DioInterceptor>(
      () => _i16.DioInterceptor(get<_i4.Dio>(), get<_i15.Authenticator>()));
  gh.lazySingleton<_i17.IAuthApiService>(() => _i18.AuthApiService(
      get<_i4.Dio>(), get<_i6.ISecureStorage>(), get<_i15.Authenticator>()));
  gh.lazySingleton<_i19.ILocalStorage>(
      () => _i20.LocalStorage(get<_i11.SembastDatabase>()));
  gh.lazySingleton<_i21.LocalRepository>(
      () => _i21.LocalRepository(get<_i12.SharedPreferences>()));
  gh.factory<_i22.PasswordBloc>(
      () => _i22.PasswordBloc(get<_i17.IAuthApiService>()));
  gh.factory<_i23.PhoneBloc>(() => _i23.PhoneBloc(get<_i17.IAuthApiService>()));
  gh.factory<_i24.AuthBloc>(() => _i24.AuthBloc(get<_i17.IAuthApiService>()));
  gh.factory<_i25.ConfirmPasswordBloc>(
      () => _i25.ConfirmPasswordBloc(get<_i17.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i26.AppInjectableModule {}
