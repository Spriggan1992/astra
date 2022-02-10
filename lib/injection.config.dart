// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i32;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i39;

import 'application/auth/auth/auth_bloc.dart' as _i63;
import 'application/auth/code/code_bloc.dart' as _i4;
import 'application/auth/confirm_password/confirm_password_bloc.dart' as _i65;
import 'application/auth/password/password_bloc.dart' as _i61;
import 'application/auth/phone/phone_bloc.dart' as _i62;
import 'application/chat/chat_bloc.dart' as _i64;
import 'application/chats/chats_bloc.dart' as _i44;
import 'application/favorite/favorite_actor/favorite_actor_bloc.dart' as _i46;
import 'application/favorite/favorite_bloc.dart' as _i47;
import 'application/promocode/promocode_bloc.dart' as _i34;
import 'application/search/search_action/search_action_bloc.dart' as _i35;
import 'application/search/search_bloc.dart' as _i36;
import 'application/settings/my_profile/full_screen_image.dart/full_screen_image_bloc.dart'
    as _i48;
import 'application/settings/my_profile/my_profile/my_profile_bloc.dart'
    as _i33;
import 'application/settings/my_profile/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i60;
import 'application/settings/settings/settings_bloc.dart' as _i38;
import 'application/settings/store/store_actor/store_actor_bloc.dart' as _i40;
import 'application/settings/store/store_bloc.dart' as _i41;
import 'application/settings/support/clip_board/clip_board_cubit.dart' as _i3;
import 'application/settings/support/support_bloc.dart' as _i42;
import 'domain/auth/repositories/i_auth_api_service.dart' as _i49;
import 'domain/auth/repositories/i_local_storage.dart' as _i57;
import 'domain/chats/i_chat_repository.dart' as _i10;
import 'domain/chats/i_chat_service.dart' as _i53;
import 'domain/chats/i_chats_repository.dart' as _i12;
import 'domain/core/services/i_curator_info_service.dart' as _i14;
import 'domain/core/services/i_ineternet_connection_status.dart' as _i18;
import 'domain/core/services/i_user_unfo_service.dart' as _i30;
import 'domain/favorites/repositories/i_favorites_repository.dart' as _i16;
import 'domain/image_picker/reopositories/i_image_picker.dart' as _i55;
import 'domain/profile/repositories/i_profile_repository.dart' as _i20;
import 'domain/promocode/i_promocode_repository.dart' as _i22;
import 'domain/search/repositories/i_search_repository.dart' as _i24;
import 'domain/store/repositories/i_store_reposytory.dart' as _i28;
import 'infrastructure/auth/repositories/auth_api_service.dart' as _i50;
import 'infrastructure/auth/repositories/authenticator.dart' as _i43;
import 'infrastructure/auth/repositories/local_storage.dart' as _i58;
import 'infrastructure/chats/repositories/chat_local_storage.dart' as _i52;
import 'infrastructure/chats/repositories/chat_repository.dart' as _i11;
import 'infrastructure/chats/repositories/chats_repository.dart' as _i13;
import 'infrastructure/chats/repositories/i_chat_local_storage.dart' as _i51;
import 'infrastructure/chats/services/chat_service.dart' as _i54;
import 'infrastructure/core/database/secure_strorage/i_secure_storage.dart'
    as _i26;
import 'infrastructure/core/database/secure_strorage/secure_storage.dart'
    as _i27;
import 'infrastructure/core/database/sembast/sembast_database.dart' as _i37;
import 'infrastructure/core/di/app_injectable_module.dart' as _i66;
import 'infrastructure/core/http/dio_interceptor.dart' as _i45;
import 'infrastructure/core/repositories/local_repository.dart' as _i59;
import 'infrastructure/core/services/curator_info_service/curator_info_service.dart'
    as _i15;
import 'infrastructure/core/services/images/cache_image_service.dart' as _i9;
import 'infrastructure/core/services/images/i_chache_image_service.dart' as _i8;
import 'infrastructure/core/services/internt_connection_service/internet_connection.dart'
    as _i19;
import 'infrastructure/core/services/user_info_service.dart/user_info_service.dart'
    as _i31;
import 'infrastructure/favorites/repositories/favorites_repository.dart'
    as _i17;
import 'infrastructure/image_picker/image_picker.dart' as _i56;
import 'infrastructure/profile/repositories/profile_repository.dart' as _i21;
import 'infrastructure/promocode/promocode_repository.dart' as _i23;
import 'infrastructure/search/search_repository.dart' as _i25;
import 'infrastructure/store/repositories/store_repository.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.ICuratorInfoService>(() => _i15.CuratorInfoService());
  gh.lazySingleton<_i16.IFavoritesRepository>(
      () => _i17.FavoritesRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i18.IInternetConnectionService>(
      () => _i19.InternetConnectionService());
  gh.lazySingleton<_i20.IProfileRepository>(() =>
      _i21.ProfileRepository(get<_i6.Dio>(), get<_i8.ICacheImageService>()));
  gh.lazySingleton<_i22.IPromocodeRepository>(
      () => _i23.PromocodeRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i24.ISearchRepository>(() =>
      _i25.SearchRepository(get<_i6.Dio>(), get<_i8.ICacheImageService>()));
  gh.lazySingleton<_i26.ISecureStorage>(
      () => _i27.SecureStorage(get<_i7.FlutterSecureStorage>()));
  gh.lazySingleton<_i28.IStoreReposytory>(
      () => _i29.StoreRepository(get<_i6.Dio>()));
  gh.lazySingleton<_i30.IUserInfoService>(() => _i31.UserInfoService());
  gh.lazySingleton<_i32.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i33.MyProfileBloc>(() => _i33.MyProfileBloc(
      get<_i20.IProfileRepository>(),
      get<_i28.IStoreReposytory>(),
      get<_i30.IUserInfoService>()));
  gh.factory<_i34.PromocodeBloc>(
      () => _i34.PromocodeBloc(get<_i22.IPromocodeRepository>()));
  gh.factory<_i35.SearchActionBloc>(
      () => _i35.SearchActionBloc(get<_i24.ISearchRepository>()));
  gh.factory<_i36.SearchBloc>(() => _i36.SearchBloc(
      get<_i24.ISearchRepository>(), get<_i30.IUserInfoService>()));
  gh.lazySingleton<_i37.SembastDatabase>(() => appInjectableModule.sembastDb);
  gh.factory<_i38.SettingsBloc>(
      () => _i38.SettingsBloc(get<_i20.IProfileRepository>()));
  await gh.factoryAsync<_i39.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i40.StoreActorBloc>(() => _i40.StoreActorBloc());
  gh.factory<_i41.StoreBloc>(
      () => _i41.StoreBloc(get<_i28.IStoreReposytory>()));
  gh.factory<_i42.SupportBloc>(
      () => _i42.SupportBloc(get<_i20.IProfileRepository>()));
  gh.lazySingleton<_i43.Authenticator>(
      () => _i43.Authenticator(get<_i26.ISecureStorage>()));
  gh.factory<_i44.ChatsBloc>(
      () => _i44.ChatsBloc(get<_i12.IChatsRepository>()));
  gh.lazySingleton<_i45.DioInterceptor>(
      () => _i45.DioInterceptor(get<_i6.Dio>(), get<_i43.Authenticator>()));
  gh.factory<_i46.FavoriteActorBloc>(
      () => _i46.FavoriteActorBloc(get<_i16.IFavoritesRepository>()));
  gh.factory<_i47.FavoriteBloc>(
      () => _i47.FavoriteBloc(get<_i16.IFavoritesRepository>()));
  gh.factory<_i48.FullScreenImageBloc>(
      () => _i48.FullScreenImageBloc(get<_i20.IProfileRepository>()));
  gh.lazySingleton<_i49.IAuthApiService>(() => _i50.AuthApiService(
      get<_i6.Dio>(), get<_i26.ISecureStorage>(), get<_i43.Authenticator>()));
  gh.lazySingleton<_i51.IChatLocalStorage>(
      () => _i52.ChatLocalStorage(get<_i37.SembastDatabase>()));
  gh.lazySingleton<_i53.IChatService>(
      () => _i54.ChatService(get<_i43.Authenticator>()));
  gh.lazySingleton<_i55.IImagePickerRepository>(
      () => _i56.ImagePickerRepository(get<_i32.ImagePicker>()));
  gh.lazySingleton<_i57.ILocalStorage>(
      () => _i58.LocalStorage(get<_i37.SembastDatabase>()));
  gh.lazySingleton<_i59.LocalRepository>(
      () => _i59.LocalRepository(get<_i39.SharedPreferences>()));
  gh.factory<_i60.MyProfileActorBloc>(() => _i60.MyProfileActorBloc(
      get<_i20.IProfileRepository>(), get<_i55.IImagePickerRepository>()));
  gh.factory<_i61.PasswordBloc>(
      () => _i61.PasswordBloc(get<_i49.IAuthApiService>()));
  gh.factory<_i62.PhoneBloc>(() => _i62.PhoneBloc(get<_i49.IAuthApiService>()));
  gh.factory<_i63.AuthBloc>(() => _i63.AuthBloc(
      get<_i49.IAuthApiService>(),
      get<_i20.IProfileRepository>(),
      get<_i30.IUserInfoService>(),
      get<_i14.ICuratorInfoService>()));
  gh.factory<_i64.ChatBloc>(() => _i64.ChatBloc(get<_i10.IChatRepository>(),
      get<_i53.IChatService>(), get<_i18.IInternetConnectionService>()));
  gh.factory<_i65.ConfirmPasswordBloc>(
      () => _i65.ConfirmPasswordBloc(get<_i49.IAuthApiService>()));
  return get;
}

class _$AppInjectableModule extends _i66.AppInjectableModule {}
