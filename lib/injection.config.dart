// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i20;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import 'application/auth/auth/auth_bloc.dart' as _i50;
import 'application/auth/code/code_bloc.dart' as _i4;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i51;
import 'application/auth/password/password_bloc.dart' as _i45;
import 'application/auth/phone/phone_bloc.dart' as _i46;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i28;
import 'application/favorite/favorite_bloc.dart' as _i29;
import 'application/promocode/promocode_bloc.dart' as _i21;
import 'application/search/search_bloc.dart' as _i47;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i52;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i44;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i43;
import 'application/settings/settings/settings_bloc.dart' as _i48;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i24;
import 'application/settings/store/store_bloc.dart' as _i25;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i3;
import 'application/settings/support/support_bloc.dart' as _i49;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i30;
import 'domain/auth/repositories/i_local_storage.dart' as _i36;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i10;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i34;
import 'domain/profile/repositories/i_profile_repository.dart' as _i38;
import 'domain/promocode/i_promocode_repository.dart' as _i12;
import 'domain/search/repositories/i_search_repository.dart' as _i40;
import 'domain/store/repositories/i_store_reposytory.dart' as _i18;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i31;
import 'infrastructure/auth/repositories/authenticator.dart' as _i26;
import 'infrastructure/auth/repositories/local_storage.dart' as _i37;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i16;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i17;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i22;
import 'infrastructure/core/di/app_injectable_module.dart' as _i53;
import 'infrastructure/core/http/dio_interceptor.dart' as _i27;
import 'infrastructure/core/repositories/local_repository.dart' as _i42;
import 'infrastructure/core/services/images/cache_image_service.dart' as _i33;
import 'infrastructure/core/services/images/compress_image_service.dart' as _i9;
import 'infrastructure/core/services/images/i_chache_image_service.dart'
    as _i32;
import 'infrastructure/core/services/images/i_compress_image_service.dart'
    as _i8;
import 'infrastructure/core/services/save_files_service/i_save_file_service.dart'
    as _i14;
import 'infrastructure/core/services/save_files_service/save_file_service.dart'
    as _i15;
import 'infrastructure/favorites/repositories/favorites_repository.dart'
    as _i11;
import 'infrastructure/image_picker/repositories/image_picker.dart' as _i35;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i39;
import 'infrastructure/promocode/promocode_repository.dart' as _i13;
import 'infrastructure/search/search_repository.dart' as _i41;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appInjectableModule = _$AppInjectableModule();
  gh.factory<_i3.ClipBoardCubit>(() => _i3.ClipBoardCubit());
  gh.factory<_i4.CodeBloc>(() => _i4.CodeBloc());
  gh.lazySingleton<_i5.DefaultCacheManager>(
      () => appInjectableModule.cacheManager);
  gh.lazySingleton<_i6.Dio>(() => appInjectableModule.dio);
  gh.lazySingleton<_i7.FlutterSecureStorage>(
      () => appInjectableModule.secureStorage);
  gh.lazySingleton<_i8.ICompressImageService>(() => _i9.CompressImageService());
  gh.lazySingleton<_i10.IFavoritesRepository>(
      () => _i11.FavoritesRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i12.IPromocodeRepository>(
      () => _i13.PromocodeRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i14.ISaveFileService>(() => _i15.SaveFileService());
  gh.lazySingleton<_i16.ISecureStorage>(
      () => _i17.SecureStorage(get<_i7.FlutterSecureStorage>()));
  gh.lazySingleton<_i18.IStoreReposytory>(
      () => _i19.StoreRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i20.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i21.PromocodeBloc>(
      () => _i21.PromocodeBloc(get<_i12.IPromocodeRepository>()));
  gh.lazySingleton<_i22.SembastDatabase>(() => appInjectableModule.sembastDb);
  await gh.factoryAsync<_i23.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i24.StoreActorBloc>(() => _i24.StoreActorBloc());
  gh.factory<_i25.StoreBloc>(
      () => _i25.StoreBloc(get<_i18.IStoreReposytory>()));
  gh.lazySingleton<_i26.Authenticator>(
      () => _i26.Authenticator(get<_i16.ISecureStorage>()));
  gh.lazySingleton<_i27.DioInterceptor>(
      () => _i27.DioInterceptor(get<_i6.Dio>(), get<_i26.Authenticator>()));
  gh.factory<_i28.FavoriteActorBloc>(
      () => _i28.FavoriteActorBloc(get<_i10.IFavoritesRepository>()));
  gh.factory<_i29.FavoriteBloc>(
      () => _i29.FavoriteBloc(get<_i10.IFavoritesRepository>()));
  gh.lazySingleton<_i30.IAuthApiService>(() => _i31.AuthApiService(
      get<_i6.Dio>(), get<_i16.ISecureStorage>(), get<_i26.Authenticator>()));
  gh.lazySingleton<_i32.ICacheImageService>(() => _i33.CacheImageService(
      get<_i6.Dio>(),
      get<_i14.ISaveFileService>(),
      get<_i8.ICompressImageService>()));
  gh.lazySingleton<_i34.IImagePickerRepository>(
      () => _i35.ImagePickerRepository(get<_i20.ImagePicker>()));
  gh.lazySingleton<_i36.ILocalStorage>(
      () => _i37.LocalStorage(get<_i22.SembastDatabase>()));
  gh.lazySingleton<_i38.IProfileRepository>(() =>
      _i39.ProfileRepository(get<_i6.Dio>(), get<_i32.ICacheImageService>()));
  gh.lazySingleton<_i40.ISearchRepository>(() =>
      _i41.SearchRepository(get<_i6.Dio>(), get<_i32.ICacheImageService>()));
  gh.lazySingleton<_i42.LocalRepository>(
      () => _i42.LocalRepository(get<_i23.SharedPreferences>()));
  gh.factory<_i43.MyProfileActorBloc>(() => _i43.MyProfileActorBloc(
      get<_i38.IProfileRepository>(), get<_i34.IImagePickerRepository>()));
  gh.factory<_i44.MyProfileBloc>(() => _i44.MyProfileBloc(
      get<_i38.IProfileRepository>(), get<_i18.IStoreReposytory>()));
  gh.factory<_i45.PasswordBloc>(
      () => _i45.PasswordBloc(get<_i30.IAuthApiService>()));
  gh.factory<_i46.PhoneBloc>(() => _i46.PhoneBloc(get<_i30.IAuthApiService>()));
  gh.factory<_i47.SearchBloc>(
      () => _i47.SearchBloc(get<_i40.ISearchRepository>()));
  gh.factory<_i48.SettingsBloc>(
      () => _i48.SettingsBloc(get<_i38.IProfileRepository>()));
  gh.factory<_i49.SupportBloc>(
      () => _i49.SupportBloc(get<_i38.IProfileRepository>()));
  gh.factory<_i50.AuthBloc>(() => _i50.AuthBloc(get<_i30.IAuthApiService>()));
  gh.factory<_i51.ConfirmPasswordBloc>(
      () => _i51.ConfirmPasswordBloc(get<_i30.IAuthApiService>()));
  gh.factory<_i52.FullScreenImageBloc>(
      () => _i52.FullScreenImageBloc(get<_i38.IProfileRepository>()));
  return get;
}

class _$AppInjectableModule extends _i53.AppInjectableModule {}
