// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dart_amqp/dart_amqp.dart' as _i3;
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i35;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i42;

import 'application/auth/auth/auth_bloc.dart' as _i66;
import 'application/auth/code/code_bloc.dart' as _i5;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i67;
import 'application/auth/password/password_bloc.dart' as _i64;
import 'application/auth/phone/phone_bloc.dart' as _i65;
import 'application/chat/chat_bloc.dart' as _i48;
import 'application/chat/chat_wathcer/chat_watcher_bloc.dart' as _i49;
import 'application/chats/chats_bloc.dart' as _i50;
import 'application/chats/chats_watcher/chats_watcher_bloc.dart' as _i51;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i53;
import 'application/favorite/favorite_bloc.dart' as _i54;
import 'application/promocode/promocode_bloc.dart' as _i37;
import 'application/search/search_action/search_action_bloc.dart' as _i38;
import 'application/search/search_bloc.dart' as _i39;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i55;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i36;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i63;
import 'application/settings/settings/settings_bloc.dart' as _i41;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i43;
import 'application/settings/store/store_bloc.dart' as _i44;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i4;
import 'application/settings/support/support_bloc.dart' as _i45;
import 'application/user/user_cubit.dart' as _i46;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i56;
import 'domain/auth/repositories/i_local_storage.dart' as _i60;
import 'domain/chats/i_chat_repository.dart' as _i11;
import 'domain/chats/i_chats_repository.dart' as _i13;
import 'domain/core/repositories/i_update_user_repository.dart' as _i31;
import 'domain/core/services/i_curator_info_service.dart' as _i15;
import 'domain/core/services/i_ineternet_connection_status.dart' as _i19;
import 'domain/core/services/i_user_unfo_service.dart' as _i33;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i17;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i58;
import 'domain/profile/repositories/i_profile_repository.dart' as _i21;
import 'domain/promocode/i_promocode_repository.dart' as _i23;
import 'domain/search/repositories/i_search_repository.dart' as _i25;
import 'domain/store/repositories/i_store_reposytory.dart' as _i29;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i57;
import 'infrastructure/auth/repositories/authenticator.dart' as _i47;
import 'infrastructure/auth/repositories/local_storage.dart' as _i61;
import 'infrastructure/chats/repositories/chat_repository.dart' as _i12;
import 'infrastructure/chats/repositories/chats_repository.dart' as _i14;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i27;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i28;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i40;
import 'infrastructure/core/di/app_injectable_module.dart' as _i68;
import 'infrastructure/core/http/dio_interceptor.dart' as _i52;
import 'infrastructure/core/repositories/local_repository.dart' as _i62;
import 'infrastructure/core/repositories/update_user_repository.dart' as _i32;
import 'infrastructure/core/services/curator_info_service/curator_info_service.dart'
    as _i16;
import 'infrastructure/core/services/images/cache_image_service.dart' as _i10;
import 'infrastructure/core/services/images/i_chache_image_service.dart' as _i9;
import 'infrastructure/core/services/internt_connection_service/internet_connection.dart'
    as _i20;
import 'infrastructure/core/services/user_info_service.dart/user_info_service.dart'
    as _i34;
import 'infrastructure/favorites/repositories/favorites_repository.dart'
    as _i18;
import 'infrastructure/image_picker/image_picker.dart' as _i59;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i22;
import 'infrastructure/promocode/promocode_repository.dart' as _i24;
import 'infrastructure/search/search_repository.dart' as _i26;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i30; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.IChatRepository>(
      () => _i12.ChatRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i13.IChatsRepository>(
      () => _i14.ChatsRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i15.ICuratorInfoService>(() => _i16.CuratorInfoService());
  gh.lazySingleton<_i17.IFavoritesRepository>(
      () => _i18.FavoritesRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i19.IInternetConnectionService>(
      () => _i20.InternetConnectionService());
  gh.lazySingleton<_i21.IProfileRepository>(() =>
      _i22.ProfileRepository(get<_i7.Dio>(), get<_i9.ICacheImageService>()));
  gh.lazySingleton<_i23.IPromocodeRepository>(
      () => _i24.PromocodeRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i25.ISearchRepository>(() =>
      _i26.SearchRepository(get<_i7.Dio>(), get<_i9.ICacheImageService>()));
  gh.lazySingleton<_i27.ISecureStorage>(
      () => _i28.SecureStorage(get<_i8.FlutterSecureStorage>()));
  gh.lazySingleton<_i29.IStoreReposytory>(
      () => _i30.StoreRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i31.IUpdateUserRepository>(
      () => _i32.UpdateUserRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i33.IUserInfoService>(() => _i34.UserInfoService());
  gh.lazySingleton<_i35.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i36.MyProfileBloc>(() => _i36.MyProfileBloc(
      get<_i21.IProfileRepository>(),
      get<_i29.IStoreReposytory>(),
      get<_i33.IUserInfoService>()));
  gh.factory<_i37.PromocodeBloc>(
      () => _i37.PromocodeBloc(get<_i23.IPromocodeRepository>()));
  gh.factory<_i38.SearchActionBloc>(
      () => _i38.SearchActionBloc(get<_i25.ISearchRepository>()));
  gh.factory<_i39.SearchBloc>(() => _i39.SearchBloc(
      get<_i25.ISearchRepository>(), get<_i33.IUserInfoService>()));
  gh.lazySingleton<_i40.SembastDatabase>(() => appInjectableModule.sembastDb);
  gh.factory<_i41.SettingsBloc>(
      () => _i41.SettingsBloc(get<_i21.IProfileRepository>()));
  await gh.factoryAsync<_i42.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i43.StoreActorBloc>(() => _i43.StoreActorBloc());
  gh.factory<_i44.StoreBloc>(
      () => _i44.StoreBloc(get<_i29.IStoreReposytory>()));
  gh.factory<_i45.SupportBloc>(
      () => _i45.SupportBloc(get<_i21.IProfileRepository>()));
  gh.factory<_i46.UserCubit>(() => _i46.UserCubit(
      get<_i31.IUpdateUserRepository>(),
      get<_i33.IUserInfoService>(),
      get<_i21.IProfileRepository>()));
  gh.lazySingleton<_i47.Authenticator>(
      () => _i47.Authenticator(get<_i27.ISecureStorage>()));
  gh.factory<_i48.ChatBloc>(() => _i48.ChatBloc(get<_i11.IChatRepository>()));
  gh.factory<_i49.ChatWatcherBloc>(() => _i49.ChatWatcherBloc(
      get<_i19.IInternetConnectionService>(), get<_i11.IChatRepository>()));
  gh.factory<_i50.ChatsBloc>(
      () => _i50.ChatsBloc(get<_i13.IChatsRepository>()));
  gh.factory<_i51.ChatsWatcherBloc>(
      () => _i51.ChatsWatcherBloc(get<_i13.IChatsRepository>()));
  gh.lazySingleton<_i52.DioInterceptor>(
      () => _i52.DioInterceptor(get<_i7.Dio>(), get<_i47.Authenticator>()));
  gh.factory<_i53.FavoriteActorBloc>(
      () => _i53.FavoriteActorBloc(get<_i17.IFavoritesRepository>()));
  gh.factory<_i54.FavoriteBloc>(
      () => _i54.FavoriteBloc(get<_i17.IFavoritesRepository>()));
  gh.factory<_i55.FullScreenImageBloc>(
      () => _i55.FullScreenImageBloc(get<_i21.IProfileRepository>()));
  gh.lazySingleton<_i56.IAuthApiService>(() => _i57.AuthApiService(
      get<_i7.Dio>(), get<_i27.ISecureStorage>(), get<_i47.Authenticator>()));
  gh.lazySingleton<_i58.IImagePickerRepository>(
      () => _i59.ImagePickerRepository(get<_i35.ImagePicker>()));
  gh.lazySingleton<_i60.ILocalStorage>(
      () => _i61.LocalStorage(get<_i40.SembastDatabase>()));
  gh.lazySingleton<_i62.LocalRepository>(
      () => _i62.LocalRepository(get<_i42.SharedPreferences>()));
  gh.factory<_i63.MyProfileActorBloc>(() => _i63.MyProfileActorBloc(
      get<_i21.IProfileRepository>(), get<_i58.IImagePickerRepository>()));
  gh.factory<_i64.PasswordBloc>(
      () => _i64.PasswordBloc(get<_i56.IAuthApiService>()));
  gh.factory<_i65.PhoneBloc>(() => _i65.PhoneBloc(get<_i56.IAuthApiService>()));
  gh.factory<_i66.AuthBloc>(() => _i66.AuthBloc(
      get<_i56.IAuthApiService>(),
      get<_i21.IProfileRepository>(),
      get<_i33.IUserInfoService>(),
      get<_i15.ICuratorInfoService>()));
  gh.factory<_i67.ConfirmPasswordBloc>(
      () => _i67.ConfirmPasswordBloc(get<_i56.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i68.AppInjectableModule {}
