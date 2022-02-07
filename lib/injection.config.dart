// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i30;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i37;

import 'application/auth/auth/auth_bloc.dart' as _i61;
import 'application/auth/code/code_bloc.dart' as _i4;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i63;
import 'application/auth/password/password_bloc.dart' as _i59;
import 'application/auth/phone/phone_bloc.dart' as _i60;
import 'application/chat/chat_bloc.dart' as _i62;
import 'application/chats/chats_bloc.dart' as _i42;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i44;
import 'application/favorite/favorite_bloc.dart' as _i45;
import 'application/promocode/promocode_bloc.dart' as _i32;
import 'application/search/search_action/search_action_bloc.dart' as _i33;
import 'application/search/search_bloc.dart' as _i34;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i46;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i31;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i58;
import 'application/settings/settings/settings_bloc.dart' as _i36;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i38;
import 'application/settings/store/store_bloc.dart' as _i39;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i3;
import 'application/settings/support/support_bloc.dart' as _i40;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i47;
import 'domain/auth/repositories/i_local_storage.dart' as _i55;
import 'domain/chats/i_chat_repository.dart' as _i10;
import 'domain/chats/i_chat_service.dart' as _i51;
import 'domain/chats/i_chats_repository.dart' as _i12;
import 'domain/core/services/i_ineternet_connection_status.dart' as _i16;
import 'domain/core/services/i_user_unfo_service.dart' as _i28;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i14;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i53;
import 'domain/profile/repositories/i_profile_repository.dart' as _i18;
import 'domain/promocode/i_promocode_repository.dart' as _i20;
import 'domain/search/repositories/i_search_repository.dart' as _i22;
import 'domain/store/repositories/i_store_reposytory.dart' as _i26;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i48;
import 'infrastructure/auth/repositories/authenticator.dart' as _i41;
import 'infrastructure/auth/repositories/local_storage.dart' as _i56;
import 'infrastructure/chats/repositories/chat_local_storage.dart' as _i50;
import 'infrastructure/chats/repositories/chat_repository.dart' as _i11;
import 'infrastructure/chats/repositories/chats_repository.dart' as _i13;
import 'infrastructure/chats/repositories/i_chat_local_storage.dart' as _i49;
import 'infrastructure/chats/services/chat_service.dart' as _i52;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i24;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i25;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i35;
import 'infrastructure/core/di/app_injectable_module.dart' as _i64;
import 'infrastructure/core/http/dio_interceptor.dart' as _i43;
import 'infrastructure/core/repositories/local_repository.dart' as _i57;
import 'infrastructure/core/services/images/cache_image_service.dart' as _i9;
import 'infrastructure/core/services/images/i_chache_image_service.dart' as _i8;
import 'infrastructure/core/services/internt_connection_service/internet_connection.dart'
    as _i17;
import 'infrastructure/core/services/user_info_service.dart/user_info_service.dart'
    as _i29;
import 'infrastructure/favorites/repositories/favorites_repository.dart'
    as _i15;
import 'infrastructure/image_picker/image_picker.dart' as _i54;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i19;
import 'infrastructure/promocode/promocode_repository.dart' as _i21;
import 'infrastructure/search/search_repository.dart' as _i23;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i27; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i8.ICacheImageService>(
      () => _i9.CacheImageService(get<_i5.DefaultCacheManager>()));
  gh.lazySingleton<_i10.IChatRepository>(
      () => _i11.ChatRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i12.IChatsRepository>(
      () => _i13.ChatsRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i14.IFavoritesRepository>(
      () => _i15.FavoritesRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i16.IInternetConnectionService>(
      () => _i17.InternetConnectionService());
  gh.lazySingleton<_i18.IProfileRepository>(() =>
      _i19.ProfileRepository(get<_i6.Dio>(), get<_i8.ICacheImageService>()));
  gh.lazySingleton<_i20.IPromocodeRepository>(
      () => _i21.PromocodeRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i22.ISearchRepository>(() =>
      _i23.SearchRepository(get<_i6.Dio>(), get<_i8.ICacheImageService>()));
  gh.lazySingleton<_i24.ISecureStorage>(
      () => _i25.SecureStorage(get<_i7.FlutterSecureStorage>()));
  gh.lazySingleton<_i26.IStoreReposytory>(
      () => _i27.StoreRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i28.IUserInfoService>(() => _i29.UserInfoService());
  gh.lazySingleton<_i30.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i31.MyProfileBloc>(() => _i31.MyProfileBloc(
      get<_i18.IProfileRepository>(),
      get<_i26.IStoreReposytory>(),
      get<_i28.IUserInfoService>()));
  gh.factory<_i32.PromocodeBloc>(
      () => _i32.PromocodeBloc(get<_i20.IPromocodeRepository>()));
  gh.factory<_i33.SearchActionBloc>(
      () => _i33.SearchActionBloc(get<_i22.ISearchRepository>()));
  gh.factory<_i34.SearchBloc>(
      () => _i34.SearchBloc(get<_i22.ISearchRepository>()));
  gh.lazySingleton<_i35.SembastDatabase>(() => appInjectableModule.sembastDb);
  gh.factory<_i36.SettingsBloc>(
      () => _i36.SettingsBloc(get<_i18.IProfileRepository>()));
  await gh.factoryAsync<_i37.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i38.StoreActorBloc>(() => _i38.StoreActorBloc());
  gh.factory<_i39.StoreBloc>(
      () => _i39.StoreBloc(get<_i26.IStoreReposytory>()));
  gh.factory<_i40.SupportBloc>(
      () => _i40.SupportBloc(get<_i18.IProfileRepository>()));
  gh.lazySingleton<_i41.Authenticator>(
      () => _i41.Authenticator(get<_i24.ISecureStorage>()));
  gh.factory<_i42.ChatsBloc>(
      () => _i42.ChatsBloc(get<_i12.IChatsRepository>()));
  gh.lazySingleton<_i43.DioInterceptor>(
      () => _i43.DioInterceptor(get<_i6.Dio>(), get<_i41.Authenticator>()));
  gh.factory<_i44.FavoriteActorBloc>(
      () => _i44.FavoriteActorBloc(get<_i14.IFavoritesRepository>()));
  gh.factory<_i45.FavoriteBloc>(
      () => _i45.FavoriteBloc(get<_i14.IFavoritesRepository>()));
  gh.factory<_i46.FullScreenImageBloc>(
      () => _i46.FullScreenImageBloc(get<_i18.IProfileRepository>()));
  gh.lazySingleton<_i47.IAuthApiService>(() => _i48.AuthApiService(
      get<_i6.Dio>(), get<_i24.ISecureStorage>(), get<_i41.Authenticator>()));
  gh.lazySingleton<_i49.IChatLocalStorage>(
      () => _i50.ChatLocalStorage(get<_i35.SembastDatabase>()));
  gh.lazySingleton<_i51.IChatService>(
      () => _i52.ChatService(get<_i41.Authenticator>()));
  gh.lazySingleton<_i53.IImagePickerRepository>(
      () => _i54.ImagePickerRepository(get<_i30.ImagePicker>()));
  gh.lazySingleton<_i55.ILocalStorage>(
      () => _i56.LocalStorage(get<_i35.SembastDatabase>()));
  gh.lazySingleton<_i57.LocalRepository>(
      () => _i57.LocalRepository(get<_i37.SharedPreferences>()));
  gh.factory<_i58.MyProfileActorBloc>(() => _i58.MyProfileActorBloc(
      get<_i18.IProfileRepository>(), get<_i53.IImagePickerRepository>()));
  gh.factory<_i59.PasswordBloc>(
      () => _i59.PasswordBloc(get<_i47.IAuthApiService>()));
  gh.factory<_i60.PhoneBloc>(() => _i60.PhoneBloc(get<_i47.IAuthApiService>()));
  gh.factory<_i61.AuthBloc>(() => _i61.AuthBloc(get<_i47.IAuthApiService>(),
      get<_i18.IProfileRepository>(), get<_i28.IUserInfoService>()));
  gh.factory<_i62.ChatBloc>(() => _i62.ChatBloc(get<_i10.IChatRepository>(),
      get<_i51.IChatService>(), get<_i16.IInternetConnectionService>()));
  gh.factory<_i63.ConfirmPasswordBloc>(
      () => _i63.ConfirmPasswordBloc(get<_i47.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i64.AppInjectableModule {}
