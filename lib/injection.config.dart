// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i24;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i28;

import 'application/auth/auth/auth_bloc.dart' as _i52;
import 'application/auth/code/code_bloc.dart' as _i4;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i53;
import 'application/auth/password/password_bloc.dart' as _i48;
import 'application/auth/phone/phone_bloc.dart' as _i49;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i33;
import 'application/favorite/favorite_bloc.dart' as _i34;
import 'application/promocode/promocode_bloc.dart' as _i25;
import 'application/search/search_bloc.dart' as _i26;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i54;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i47;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i46;
import 'application/settings/settings/settings_bloc.dart' as _i50;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i29;
import 'application/settings/store/store_bloc.dart' as _i30;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i3;
import 'application/settings/support/support_bloc.dart' as _i51;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i35;
import 'domain/auth/repositories/i_local_storage.dart' as _i41;
import 'domain/core/user_info_service/i_user_unfo_service.dart' as _i22;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i10;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i39;
import 'domain/profile/repositories/i_profile_repository.dart' as _i43;
import 'domain/promocode/i_promocode_repository.dart' as _i12;
import 'domain/search/repositories/i_search_repository.dart' as _i16;
import 'domain/store/repositories/i_store_reposytory.dart' as _i20;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i36;
import 'infrastructure/auth/repositories/authenticator.dart' as _i31;
import 'infrastructure/auth/repositories/local_storage.dart' as _i42;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i18;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i19;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i27;
import 'infrastructure/core/di/app_injectable_module.dart' as _i55;
import 'infrastructure/core/http/dio_interceptor.dart' as _i32;
import 'infrastructure/core/repositories/local_repository.dart' as _i45;
import 'infrastructure/core/services/images/cache_image_service.dart' as _i38;
import 'infrastructure/core/services/images/compress_image_service.dart' as _i9;
import 'infrastructure/core/services/images/i_chache_image_service.dart'
    as _i37;
import 'infrastructure/core/services/images/i_compress_image_service.dart'
    as _i8;
import 'infrastructure/core/services/save_files_service/i_save_file_service.dart'
    as _i14;
import 'infrastructure/core/services/save_files_service/save_file_service.dart'
    as _i15;
import 'infrastructure/core/services/user_info_service.dart/user_info_service.dart'
    as _i23;
import 'infrastructure/favorites/repositories/favorites_repository.dart'
    as _i11;
import 'infrastructure/image_picker/repositories/image_picker.dart' as _i40;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i44;
import 'infrastructure/promocode/promocode_repository.dart' as _i13;
import 'infrastructure/search/search_repository.dart' as _i17;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i16.ISearchRepository>(
      () => _i17.SearchRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i18.ISecureStorage>(
      () => _i19.SecureStorage(get<_i7.FlutterSecureStorage>()));
  gh.lazySingleton<_i20.IStoreReposytory>(
      () => _i21.StoreRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i22.IUserInfoService>(() => _i23.UserInfoService());
  gh.lazySingleton<_i24.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i25.PromocodeBloc>(
      () => _i25.PromocodeBloc(get<_i12.IPromocodeRepository>()));
  gh.factory<_i26.SearchBloc>(
      () => _i26.SearchBloc(get<_i16.ISearchRepository>()));
  gh.lazySingleton<_i27.SembastDatabase>(() => appInjectableModule.sembastDb);
  await gh.factoryAsync<_i28.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i29.StoreActorBloc>(() => _i29.StoreActorBloc());
  gh.factory<_i30.StoreBloc>(
      () => _i30.StoreBloc(get<_i20.IStoreReposytory>()));
  gh.lazySingleton<_i31.Authenticator>(
      () => _i31.Authenticator(get<_i18.ISecureStorage>()));
  gh.lazySingleton<_i32.DioInterceptor>(
      () => _i32.DioInterceptor(get<_i6.Dio>(), get<_i31.Authenticator>()));
  gh.factory<_i33.FavoriteActorBloc>(
      () => _i33.FavoriteActorBloc(get<_i10.IFavoritesRepository>()));
  gh.factory<_i34.FavoriteBloc>(
      () => _i34.FavoriteBloc(get<_i10.IFavoritesRepository>()));
  gh.lazySingleton<_i35.IAuthApiService>(() => _i36.AuthApiService(
      get<_i6.Dio>(), get<_i18.ISecureStorage>(), get<_i31.Authenticator>()));
  gh.lazySingleton<_i37.ICacheImageService>(() => _i38.CacheImageService(
      get<_i6.Dio>(),
      get<_i14.ISaveFileService>(),
      get<_i8.ICompressImageService>()));
  gh.lazySingleton<_i39.IImagePickerRepository>(
      () => _i40.ImagePickerRepository(get<_i24.ImagePicker>()));
  gh.lazySingleton<_i41.ILocalStorage>(
      () => _i42.LocalStorage(get<_i27.SembastDatabase>()));
  gh.lazySingleton<_i43.IProfileRepository>(() =>
      _i44.ProfileRepository(get<_i6.Dio>(), get<_i37.ICacheImageService>()));
  gh.lazySingleton<_i45.LocalRepository>(
      () => _i45.LocalRepository(get<_i28.SharedPreferences>()));
  gh.factory<_i46.MyProfileActorBloc>(() => _i46.MyProfileActorBloc(
      get<_i43.IProfileRepository>(), get<_i39.IImagePickerRepository>()));
  gh.factory<_i47.MyProfileBloc>(() => _i47.MyProfileBloc(
      get<_i43.IProfileRepository>(),
      get<_i20.IStoreReposytory>(),
      get<_i22.IUserInfoService>()));
  gh.factory<_i48.PasswordBloc>(
      () => _i48.PasswordBloc(get<_i35.IAuthApiService>()));
  gh.factory<_i49.PhoneBloc>(() => _i49.PhoneBloc(get<_i35.IAuthApiService>()));
  gh.factory<_i50.SettingsBloc>(
      () => _i50.SettingsBloc(get<_i43.IProfileRepository>()));
  gh.factory<_i51.SupportBloc>(
      () => _i51.SupportBloc(get<_i43.IProfileRepository>()));
  gh.factory<_i52.AuthBloc>(() => _i52.AuthBloc(get<_i35.IAuthApiService>(),
      get<_i43.IProfileRepository>(), get<_i22.IUserInfoService>()));
  gh.factory<_i53.ConfirmPasswordBloc>(
      () => _i53.ConfirmPasswordBloc(get<_i35.IAuthApiService>()));
  gh.factory<_i54.FullScreenImageBloc>(
      () => _i54.FullScreenImageBloc(get<_i43.IProfileRepository>()));
  return get;
}

class _$AppInjectableModule extends _i55.AppInjectableModule {}
