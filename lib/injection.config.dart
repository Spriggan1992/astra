// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dart_amqp/dart_amqp.dart' as _i3;
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i37;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i46;

import 'application/auth/auth/auth_bloc.dart' as _i72;
import 'application/auth/code/code_bloc.dart' as _i5;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i73;
import 'application/auth/password/password_bloc.dart' as _i70;
import 'application/auth/phone/phone_bloc.dart' as _i71;
import 'application/chat/chat_bloc.dart' as _i52;
import 'application/chat/chat_wathcer/chat_watcher_bloc.dart' as _i53;
import 'application/chats/chats_bloc.dart' as _i54;
import 'application/chats/chats_watcher/chats_watcher_bloc.dart' as _i55;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i57;
import 'application/favorite/favorite_bloc.dart' as _i58;
import 'application/promocode/promocode_bloc.dart' as _i41;
import 'application/search/profile_properties/profile_properties_bloc.dart'
    as _i40;
import 'application/search/search_action/search_action_bloc.dart' as _i42;
import 'application/search/search_bloc.dart' as _i43;
import 'application/settings/logout/logout_cubit.dart' as _i38;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i59;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i39;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i69;
import 'application/settings/settings/settings_bloc.dart' as _i45;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i47;
import 'application/settings/store/store_bloc.dart' as _i48;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i4;
import 'application/settings/support/support_bloc.dart' as _i49;
import 'application/user/user_bloc.dart' as _i50;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i60;
import 'domain/auth/repositories/i_local_storage.dart' as _i64;
import 'domain/chats/repositories/i_chat_repository.dart' as _i13;
import 'domain/chats/repositories/i_chats_repository.dart' as _i15;
import 'domain/core/repositories/i_update_user_repository.dart' as _i35;
import 'domain/core/services/i_cache_user_service.dart' as _i11;
import 'domain/core/services/i_curator_info_service.dart' as _i17;
import 'domain/core/services/i_ineternet_connection_status.dart' as _i21;
import 'domain/core/services/i_user_online_service.dart' as _i66;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i19;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i62;
import 'domain/profile/repositories/i_profile_properties_repository.dart'
    as _i23;
import 'domain/profile/repositories/i_profile_repository.dart' as _i25;
import 'domain/promocode/i_promocode_repository.dart' as _i27;
import 'domain/search/repositories/i_search_repository.dart' as _i29;
import 'domain/store/repositories/i_store_reposytory.dart' as _i33;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i61;
import 'infrastructure/auth/repositories/authenticator.dart' as _i51;
import 'infrastructure/auth/repositories/local_storage.dart' as _i65;
import 'infrastructure/chats/repositories/chat_repository.dart' as _i14;
import 'infrastructure/chats/repositories/chats_repository.dart' as _i16;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i31;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i32;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i44;
import 'infrastructure/core/di/app_injectable_module.dart' as _i74;
import 'infrastructure/core/http/dio_interceptor.dart' as _i56;
import 'infrastructure/core/repositories/local_repository.dart' as _i68;
import 'infrastructure/core/repositories/update_user_repository.dart' as _i36;
import 'infrastructure/core/services/cache_user_service.dart/cache_user_service.dart'
    as _i12;
import 'infrastructure/core/services/curator_info_service/curator_info_service.dart'
    as _i18;
import 'infrastructure/core/services/images/cache_image_service.dart' as _i10;
import 'infrastructure/core/services/images/i_chache_image_service.dart' as _i9;
import 'infrastructure/core/services/internt_connection_service/internet_connection.dart'
    as _i22;
import 'infrastructure/core/services/user_online_status_service/user_online_status_service.dart'
    as _i67;
import 'infrastructure/favorites/repositories/favorites_repository.dart'
    as _i20;
import 'infrastructure/image_picker/image_picker.dart' as _i63;
import 'infrastructure/profile/repositories/profile_properties_repository.dart'
    as _i24;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i26;
import 'infrastructure/promocode/promocode_repository.dart' as _i28;
import 'infrastructure/search/search_repository.dart' as _i30;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i34; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appInjectableModule = _$AppInjectableModule();
  gh.lazySingleton<_i3.Client>(() => appInjectableModule.ampqClient);
  gh.factory<_i4.ClipBoardCubit>(() => _i4.ClipBoardCubit());
  gh.factory<_i5.CodeBloc>(() => _i5.CodeBloc());
  gh.lazySingleton<_i6.DefaultCacheManager>(
      () => appInjectableModule.cacheManager);
  gh.lazySingleton<_i7.Dio>(() => appInjectableModule.dio);
  gh.lazySingleton<_i8.FlutterSecureStorage>(
      () => appInjectableModule.secureStorage);
  gh.lazySingleton<_i9.ICacheImageService>(
      () => _i10.CacheImageService(get<_i6.DefaultCacheManager>()));
  gh.lazySingleton<_i11.ICacheUserService>(() => _i12.CacheUserService());
  gh.lazySingleton<_i13.IChatRepository>(
      () => _i14.ChatRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i15.IChatsRepository>(
      () => _i16.ChatsRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i17.ICuratorInfoService>(() => _i18.CuratorInfoService());
  gh.lazySingleton<_i19.IFavoritesRepository>(
      () => _i20.FavoritesRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i21.IInternetConnectionService>(
      () => _i22.InternetConnectionService());
  gh.lazySingleton<_i23.IProfilePropertiesRepository>(
      () => _i24.ProfilePropertiesRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i25.IProfileRepository>(() =>
      _i26.ProfileRepository(get<_i7.Dio>(), get<_i9.ICacheImageService>()));
  gh.lazySingleton<_i27.IPromocodeRepository>(
      () => _i28.PromocodeRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i29.ISearchRepository>(() =>
      _i30.SearchRepository(get<_i7.Dio>(), get<_i9.ICacheImageService>()));
  gh.lazySingleton<_i31.ISecureStorage>(
      () => _i32.SecureStorage(get<_i8.FlutterSecureStorage>()));
  gh.lazySingleton<_i33.IStoreReposytory>(
      () => _i34.StoreRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i35.IUpdateUserRepository>(
      () => _i36.UpdateUserRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i37.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i38.LogoutCubit>(() => _i38.LogoutCubit());
  gh.factory<_i38.LogoutState>(() => _i38.LogoutState(canLogout: get<bool>()));
  gh.factory<_i39.MyProfileBloc>(() => _i39.MyProfileBloc(
      get<_i25.IProfileRepository>(),
      get<_i33.IStoreReposytory>(),
      get<_i11.ICacheUserService>()));
  gh.factory<_i40.ProfilePropertiesBloc>(() =>
      _i40.ProfilePropertiesBloc(get<_i23.IProfilePropertiesRepository>()));
  gh.factory<_i41.PromocodeBloc>(
      () => _i41.PromocodeBloc(get<_i27.IPromocodeRepository>()));
  gh.factory<_i42.SearchActionBloc>(
      () => _i42.SearchActionBloc(get<_i29.ISearchRepository>()));
  gh.factory<_i43.SearchBloc>(() => _i43.SearchBloc(
      get<_i29.ISearchRepository>(), get<_i11.ICacheUserService>()));
  gh.lazySingleton<_i44.SembastDatabase>(() => appInjectableModule.sembastDb);
  gh.factory<_i45.SettingsBloc>(
      () => _i45.SettingsBloc(get<_i25.IProfileRepository>()));
  await gh.factoryAsync<_i46.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i47.StoreActorBloc>(() => _i47.StoreActorBloc());
  gh.factory<_i48.StoreBloc>(
      () => _i48.StoreBloc(get<_i33.IStoreReposytory>()));
  gh.factory<_i49.SupportBloc>(
      () => _i49.SupportBloc(get<_i25.IProfileRepository>()));
  gh.factory<_i50.UserBloc>(() => _i50.UserBloc(
      get<_i35.IUpdateUserRepository>(),
      get<_i25.IProfileRepository>(),
      get<_i11.ICacheUserService>()));
  gh.lazySingleton<_i51.Authenticator>(
      () => _i51.Authenticator(get<_i31.ISecureStorage>()));
  gh.factory<_i52.ChatBloc>(() => _i52.ChatBloc(get<_i13.IChatRepository>()));
  gh.factory<_i53.ChatWatcherBloc>(() => _i53.ChatWatcherBloc(
      get<_i21.IInternetConnectionService>(), get<_i13.IChatRepository>()));
  gh.factory<_i54.ChatsBloc>(
      () => _i54.ChatsBloc(get<_i15.IChatsRepository>()));
  gh.factory<_i55.ChatsWatcherBloc>(
      () => _i55.ChatsWatcherBloc(get<_i15.IChatsRepository>()));
  gh.lazySingleton<_i56.DioInterceptor>(
      () => _i56.DioInterceptor(get<_i7.Dio>(), get<_i51.Authenticator>()));
  gh.factory<_i57.FavoriteActorBloc>(
      () => _i57.FavoriteActorBloc(get<_i19.IFavoritesRepository>()));
  gh.factory<_i58.FavoriteBloc>(
      () => _i58.FavoriteBloc(get<_i19.IFavoritesRepository>()));
  gh.factory<_i59.FullScreenImageBloc>(
      () => _i59.FullScreenImageBloc(get<_i25.IProfileRepository>()));
  gh.lazySingleton<_i60.IAuthApiService>(() => _i61.AuthApiService(
      get<_i7.Dio>(), get<_i31.ISecureStorage>(), get<_i51.Authenticator>()));
  gh.lazySingleton<_i62.IImagePickerRepository>(
      () => _i63.ImagePickerRepository(get<_i37.ImagePicker>()));
  gh.lazySingleton<_i64.ILocalStorage>(
      () => _i65.LocalStorage(get<_i44.SembastDatabase>()));
  gh.lazySingleton<_i66.IUserOnlineStatusService>(
      () => _i67.UserOnlineStatusService(get<_i51.Authenticator>()));
  gh.lazySingleton<_i68.LocalRepository>(
      () => _i68.LocalRepository(get<_i46.SharedPreferences>()));
  gh.factory<_i69.MyProfileActorBloc>(() => _i69.MyProfileActorBloc(
      get<_i25.IProfileRepository>(), get<_i62.IImagePickerRepository>()));
  gh.factory<_i70.PasswordBloc>(
      () => _i70.PasswordBloc(get<_i60.IAuthApiService>()));
  gh.factory<_i71.PhoneBloc>(() => _i71.PhoneBloc(get<_i60.IAuthApiService>()));
  gh.factory<_i72.AuthBloc>(() => _i72.AuthBloc(
      get<_i60.IAuthApiService>(),
      get<_i25.IProfileRepository>(),
      get<_i11.ICacheUserService>(),
      get<_i17.ICuratorInfoService>()));
  gh.factory<_i73.ConfirmPasswordBloc>(
      () => _i73.ConfirmPasswordBloc(get<_i60.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i74.AppInjectableModule {}
