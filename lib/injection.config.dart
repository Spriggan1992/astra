// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import 'application/auth/auth/auth_bloc.dart' as _i38;
import 'application/auth/code/code_bloc.dart' as _i4;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i39;
import 'application/auth/password/password_bloc.dart' as _i36;
import 'application/auth/phone/phone_bloc.dart' as _i37;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i25;
import 'application/favorite/favorite_bloc.dart' as _i26;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i27;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i16;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i35;
import 'application/settings/settings/settings_bloc.dart' as _i18;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i20;
import 'application/settings/store/store_bloc.dart' as _i21;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i3;
import 'application/settings/support/support_bloc.dart' as _i22;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i28;
import 'domain/auth/repositories/i_local_storage.dart' as _i32;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i7;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i30;
import 'domain/profile/repositories/i_profile_repository.dart' as _i9;
import 'domain/store/repositories/i_store_reposytory.dart' as _i13;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i29;
import 'infrastructure/auth/repositories/authenticator.dart' as _i23;
import 'infrastructure/auth/repositories/local_storage.dart' as _i33;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i11;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i12;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i17;
import 'infrastructure/core/di/app_injectable_module.dart' as _i40;
import 'infrastructure/core/http/dio_interceptor.dart' as _i24;
import 'infrastructure/core/repositories/local_repository.dart' as _i34;
import 'infrastructure/favorites/repositories/favorites_repository.dart' as _i8;
import 'infrastructure/image_picker/repositories/image_picker.dart' as _i31;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i10;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appInjectableModule = _$AppInjectableModule();
  gh.factory<_i3.ClipBoardCubit>(() => _i3.ClipBoardCubit());
  gh.factory<_i4.CodeBloc>(() => _i4.CodeBloc());
  gh.lazySingleton<_i5.Dio>(() => appInjectableModule.dio);
  gh.lazySingleton<_i6.FlutterSecureStorage>(
      () => appInjectableModule.secureStorage);
  gh.lazySingleton<_i7.IFavoritesRepository>(
      () => _i8.FavoritesRepository(get<_i5.Dio>()));
  gh.lazySingleton<_i9.IProfileRepository>(
      () => _i10.ProfileRepository(get<_i5.Dio>()));
  gh.lazySingleton<_i11.ISecureStorage>(
      () => _i12.SecureStorage(get<_i6.FlutterSecureStorage>()));
  gh.lazySingleton<_i13.IStoreReposytory>(
      () => _i14.StoreRepository(get<_i5.Dio>()));
  gh.lazySingleton<_i15.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i16.MyProfileBloc>(() => _i16.MyProfileBloc(
      get<_i9.IProfileRepository>(), get<_i13.IStoreReposytory>()));
  gh.lazySingleton<_i17.SembastDatabase>(() => appInjectableModule.sembastDb);
  gh.factory<_i18.SettingsBloc>(
      () => _i18.SettingsBloc(get<_i9.IProfileRepository>()));
  await gh.factoryAsync<_i19.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i20.StoreActorBloc>(() => _i20.StoreActorBloc());
  gh.factory<_i21.StoreBloc>(
      () => _i21.StoreBloc(get<_i13.IStoreReposytory>()));
  gh.factory<_i22.SupportBloc>(
      () => _i22.SupportBloc(get<_i9.IProfileRepository>()));
  gh.lazySingleton<_i23.Authenticator>(
      () => _i23.Authenticator(get<_i5.Dio>(), get<_i11.ISecureStorage>()));
  gh.lazySingleton<_i24.DioInterceptor>(
      () => _i24.DioInterceptor(get<_i5.Dio>(), get<_i23.Authenticator>()));
  gh.factory<_i25.FavoriteActorBloc>(
      () => _i25.FavoriteActorBloc(get<_i7.IFavoritesRepository>()));
  gh.factory<_i26.FavoriteBloc>(
      () => _i26.FavoriteBloc(get<_i7.IFavoritesRepository>()));
  gh.factory<_i27.FullScreenImageBloc>(
      () => _i27.FullScreenImageBloc(get<_i9.IProfileRepository>()));
  gh.lazySingleton<_i28.IAuthApiService>(() => _i29.AuthApiService(
      get<_i5.Dio>(), get<_i11.ISecureStorage>(), get<_i23.Authenticator>()));
  gh.lazySingleton<_i30.IImagePickerRepository>(
      () => _i31.ImagePickerRepository(get<_i15.ImagePicker>()));
  gh.lazySingleton<_i32.ILocalStorage>(
      () => _i33.LocalStorage(get<_i17.SembastDatabase>()));
  gh.lazySingleton<_i34.LocalRepository>(
      () => _i34.LocalRepository(get<_i19.SharedPreferences>()));
  gh.factory<_i35.MyProfileActorBloc>(() => _i35.MyProfileActorBloc(
      get<_i9.IProfileRepository>(), get<_i30.IImagePickerRepository>()));
  gh.factory<_i36.PasswordBloc>(
      () => _i36.PasswordBloc(get<_i28.IAuthApiService>()));
  gh.factory<_i37.PhoneBloc>(() => _i37.PhoneBloc(get<_i28.IAuthApiService>()));
  gh.factory<_i38.AuthBloc>(() => _i38.AuthBloc(get<_i28.IAuthApiService>()));
  gh.factory<_i39.ConfirmPasswordBloc>(
      () => _i39.ConfirmPasswordBloc(get<_i28.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i40.AppInjectableModule {}
