// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dart_amqp/dart_amqp.dart' as _i3;
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i25;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i30;

import 'auth/code/application/code_bloc.dart' as _i5;
import 'auth/confim_password/application/confirm_password_bloc.dart' as _i72;
import 'auth/core/application/auth_bloc.dart' as _i69;
import 'auth/core/domain/i_auth_api_service.dart' as _i35;
import 'auth/core/domain/i_local_storage.dart' as _i45;
import 'auth/core/infrastructure/auth_api_service.dart' as _i36;
import 'auth/core/infrastructure/authenticator.dart' as _i33;
import 'auth/core/infrastructure/dio_interceptor.dart' as _i34;
import 'auth/core/infrastructure/local_storage.dart' as _i46;
import 'auth/core/infrastructure/secure_strorage/i_secure_storage.dart' as _i21;
import 'auth/core/infrastructure/secure_strorage/secure_storage.dart' as _i22;
import 'auth/password/application/password_bloc.dart' as _i60;
import 'auth/phone/application/phone_bloc.dart' as _i61;
import 'chats/chat/application/chat_bloc.dart' as _i70;
import 'chats/chat/domain/i_chat_repository.dart' as _i37;
import 'chats/chat/infrastructure/chat_repository.dart' as _i38;
import 'chats/chats/application/chats_bloc.dart' as _i71;
import 'chats/chats/domain/i_chats_repository.dart' as _i39;
import 'chats/chats/infrastructure/chats_repository.dart' as _i40;
import 'core/domain/repositories/i_first_auth_repository.dart' as _i15;
import 'core/domain/repositories/i_update_user_repository.dart' as _i55;
import 'core/domain/services/i_cache_user_service.dart' as _i11;
import 'core/domain/services/i_curator_info_service.dart' as _i13;
import 'core/domain/services/i_image_picker_service.dart' as _i43;
import 'core/domain/services/i_ineternet_connection_status.dart' as _i17;
import 'core/infrastructure/database/sembast/sembast_database.dart' as _i29;
import 'core/infrastructure/database/shared_storage/i_shared_storage.dart'
    as _i23;
import 'core/infrastructure/database/shared_storage/shared_storage.dart'
    as _i24;
import 'core/infrastructure/di/app_injectable_module.dart' as _i76;
import 'core/infrastructure/http/api_client.dart' as _i32;
import 'core/infrastructure/repositories/first_auth_repository.dart' as _i16;
import 'core/infrastructure/repositories/local_repository.dart' as _i57;
import 'core/infrastructure/repositories/update_user_repository.dart' as _i56;
import 'core/infrastructure/services/cache_user_service.dart/cache_user_service.dart'
    as _i12;
import 'core/infrastructure/services/curator_info_service/curator_info_service.dart'
    as _i14;
import 'core/infrastructure/services/image_picker_service/image_picker_service.dart'
    as _i44;
import 'core/infrastructure/services/images/cache_image_service.dart' as _i10;
import 'core/infrastructure/services/images/i_cache_image_service.dart' as _i9;
import 'core/infrastructure/services/internt_connection_service/internet_connection.dart'
    as _i18;
import 'favorites/application/favorite_actor/favorite_actor_bloc.dart' as _i73;
import 'favorites/application/favorite_bloc.dart' as _i74;
import 'favorites/domain/i_favorites_repository.dart' as _i41;
import 'favorites/infrastructure/favorites_repository.dart' as _i42;
import 'search/search/application/search_action/search_action_bloc.dart'
    as _i63;
import 'search/search/application/search_bloc.dart' as _i64;
import 'search/search/domain/i_search_repository.dart' as _i51;
import 'search/search/infrastructure/search_repository.dart' as _i52;
import 'settings/core/application/logout/logout_cubit.dart' as _i26;
import 'settings/my_form/application/my_form_cubit.dart' as _i27;
import 'settings/my_profile/application/my_profile/my_profile_bloc.dart'
    as _i59;
import 'settings/my_profile/application/my_profile_actor.dart/my_profile_actor_bloc.dart'
    as _i58;
import 'settings/my_profile/domain/repositories/i_profile_repository.dart'
    as _i49;
import 'settings/my_profile/infrastructure/repositories/profile_repository.dart'
    as _i50;
import 'settings/promocode/application/promocode_bloc.dart' as _i28;
import 'settings/promocode/domain/i_promocode_repository.dart' as _i19;
import 'settings/promocode/infrastructure/promocode_repository.dart' as _i20;
import 'settings/settings/application/settings_bloc.dart' as _i65;
import 'settings/support/application/clip_board/clip_board_cubit.dart' as _i4;
import 'settings/support/application/support_bloc.dart' as _i67;
import 'shared/features/full_screen_image.dart/application/full_screen_image_bloc.dart'
    as _i75;
import 'shared/features/store/application/store/store_actor/store_actor_bloc.dart'
    as _i31;
import 'shared/features/store/application/store/store_bloc.dart' as _i66;
import 'shared/features/store/domain/repositories/i_store_reposytory.dart'
    as _i53;
import 'shared/features/store/infrastructure/repositories/store_repository.dart'
    as _i54;
import 'shared/features/user_info/user_detailed_info/application/profile_properties_bloc.dart'
    as _i62;
import 'shared/features/user_info/user_detailed_info/domain/i_profile_properties_repository.dart'
    as _i47;
import 'shared/features/user_info/user_detailed_info/infrastructure/profile_properties_repository.dart'
    as _i48;
import 'shared/features/user_subscription/application/user_bloc.dart'
    as _i68; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i13.ICuratorInfoService>(() => _i14.CuratorInfoService());
  gh.lazySingleton<_i15.IFirstAuthRepository>(() => _i16.FirstAuthRepository());
  gh.lazySingleton<_i17.IInternetConnectionService>(
      () => _i18.InternetConnectionService());
  gh.lazySingleton<_i19.IPromocodeRepository>(
      () => _i20.PromocodeRepository(get<_i7.Dio>()));
  gh.lazySingleton<_i21.ISecureStorage>(
      () => _i22.SecureStorage(get<_i8.FlutterSecureStorage>()));
  gh.lazySingleton<_i23.ISharedStorage>(() => _i24.SharedStorage());
  gh.lazySingleton<_i25.ImagePicker>(() => appInjectableModule.imagePicker);
  gh.factory<_i26.LogoutCubit>(() => _i26.LogoutCubit());
  gh.factory<_i26.LogoutState>(() => _i26.LogoutState(canLogout: get<bool>()));
  gh.factory<_i27.MyFormCubit>(
      () => _i27.MyFormCubit(get<_i11.ICacheUserService>()));
  gh.factory<_i28.PromocodeBloc>(
      () => _i28.PromocodeBloc(get<_i19.IPromocodeRepository>()));
  gh.lazySingleton<_i29.SembastDatabase>(() => appInjectableModule.sembastDb);
  await gh.factoryAsync<_i30.SharedPreferences>(() => appInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i31.StoreActorBloc>(() => _i31.StoreActorBloc());
  gh.lazySingleton<_i32.ApiClient>(() => _i32.ApiClient(get<_i7.Dio>()));
  gh.lazySingleton<_i33.Authenticator>(
      () => _i33.Authenticator(get<_i21.ISecureStorage>()));
  gh.lazySingleton<_i34.DioInterceptor>(
      () => _i34.DioInterceptor(get<_i7.Dio>(), get<_i33.Authenticator>()));
  gh.lazySingleton<_i35.IAuthApiService>(() => _i36.AuthApiService(
      get<_i7.Dio>(), get<_i21.ISecureStorage>(), get<_i33.Authenticator>()));
  gh.lazySingleton<_i37.IChatRepository>(
      () => _i38.ChatRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i39.IChatsRepository>(
      () => _i40.ChatsRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i41.IFavoritesRepository>(
      () => _i42.FavoritesRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i43.IImagePickerService>(
      () => _i44.ImagePickerService(get<_i25.ImagePicker>()));
  gh.lazySingleton<_i45.ILocalStorage>(
      () => _i46.LocalStorage(get<_i29.SembastDatabase>()));
  gh.lazySingleton<_i47.IProfilePropertiesRepository>(
      () => _i48.ProfilePropertiesRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i49.IProfileRepository>(() => _i50.ProfileRepository(
      get<_i32.ApiClient>(), get<_i9.ICacheImageService>()));
  gh.lazySingleton<_i51.ISearchRepository>(
      () => _i52.SearchRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i53.IStoreRepository>(
      () => _i54.StoreRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i55.IUpdateUserRepository>(
      () => _i56.UpdateUserRepository(get<_i32.ApiClient>()));
  gh.lazySingleton<_i57.LocalRepository>(
      () => _i57.LocalRepository(get<_i30.SharedPreferences>()));
  gh.factory<_i58.MyProfileActorBloc>(() => _i58.MyProfileActorBloc(
      get<_i49.IProfileRepository>(), get<_i43.IImagePickerService>()));
  gh.factory<_i59.MyProfileBloc>(
      () => _i59.MyProfileBloc(get<_i49.IProfileRepository>()));
  gh.factory<_i60.PasswordBloc>(
      () => _i60.PasswordBloc(get<_i35.IAuthApiService>()));
  gh.factory<_i61.PhoneBloc>(() => _i61.PhoneBloc(get<_i35.IAuthApiService>()));
  gh.factory<_i62.ProfilePropertiesBloc>(() =>
      _i62.ProfilePropertiesBloc(get<_i47.IProfilePropertiesRepository>()));
  gh.factory<_i63.SearchActionBloc>(
      () => _i63.SearchActionBloc(get<_i51.ISearchRepository>()));
  gh.factory<_i64.SearchBloc>(() => _i64.SearchBloc(
      get<_i51.ISearchRepository>(), get<_i11.ICacheUserService>()));
  gh.factory<_i65.SettingsBloc>(
      () => _i65.SettingsBloc(get<_i49.IProfileRepository>()));
  gh.factory<_i66.StoreBloc>(
      () => _i66.StoreBloc(get<_i53.IStoreRepository>()));
  gh.factory<_i67.SupportBloc>(
      () => _i67.SupportBloc(get<_i49.IProfileRepository>()));
  gh.factory<_i68.UserBloc>(() => _i68.UserBloc(
      get<_i55.IUpdateUserRepository>(),
      get<_i49.IProfileRepository>(),
      get<_i11.ICacheUserService>()));
  gh.factory<_i69.AuthBloc>(() => _i69.AuthBloc(
      get<_i35.IAuthApiService>(),
      get<_i49.IProfileRepository>(),
      get<_i11.ICacheUserService>(),
      get<_i13.ICuratorInfoService>(),
      get<_i15.IFirstAuthRepository>(),
      get<_i53.IStoreRepository>()));
  gh.factory<_i70.ChatBloc>(() => _i70.ChatBloc(
      get<_i17.IInternetConnectionService>(), get<_i37.IChatRepository>()));
  gh.factory<_i71.ChatsBloc>(
      () => _i71.ChatsBloc(get<_i39.IChatsRepository>()));
  gh.factory<_i72.ConfirmPasswordBloc>(
      () => _i72.ConfirmPasswordBloc(get<_i35.IAuthApiService>()));
  gh.factory<_i73.FavoriteActorBloc>(
      () => _i73.FavoriteActorBloc(get<_i41.IFavoritesRepository>()));
  gh.factory<_i74.FavoriteBloc>(() => _i74.FavoriteBloc(
      get<_i41.IFavoritesRepository>(), get<_i11.ICacheUserService>()));
  gh.factory<_i75.FullScreenImageBloc>(
      () => _i75.FullScreenImageBloc(get<_i49.IProfileRepository>()));
  return get;
}

class _$AppInjectableModule extends _i76.AppInjectableModule {}
