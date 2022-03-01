import 'package:astra_app/domain/core/repositories/i_first_auth_repository.dart';
import 'package:astra_app/infrastructure/core/database/shared_storage/i_shared_storage.dart';
import 'package:astra_app/infrastructure/core/database/shared_storage/shared_storage.dart';
import 'package:injectable/injectable.dart';

/// Describes repository for Shared Preferences interaction
@LazySingleton(as: IFirstAuthRepository)
class FirstAuthRepository implements IFirstAuthRepository {
  // instance of ISharedStorage
  final ISharedStorage _storage = SharedStorage();

  // key what will be written in storage
  final _isFirstAuth = "isFirstAuth";
  final _isSecondAuth = "isSecondAuth";

  @override
  Future<bool> isFirstAuth() async {
    return await _checkAuth(_isFirstAuth);
  }

  @override
  Future<bool> isSecondAuth() async {
    return await _checkAuth(_isSecondAuth);
  }

  @override
  Future<void> setFirstAuth(bool value) async {
    await _storage.set(_isFirstAuth, value);
  }

  @override
  Future<void> setSecondAuth(bool value) async {
    await _storage.set(_isSecondAuth, value);
  }

  Future<bool> _checkAuth(String storageKey) async {
    return await _storage.get(storageKey) == true;
  }

  // @override
  // Future<void> setNotFirstAuth() async {
  //   await _storage.set(_key, false);
  // }
}
