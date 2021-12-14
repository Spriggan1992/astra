import 'package:astra_app/infrastructure/auth/DTOs/auth_info_dto.dart';
import 'package:astra_app/infrastructure/core/database/sembast_database.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

import 'i_local_storage.dart';

const _storeName = 'phoneNumber';

/// Defines local storage methods.
@LazySingleton(as: ILocalStorage)
class LocalStorage implements ILocalStorage {
  /// Sembast database.
  final SembastDatabase _sembastDatabase;

  ///Store factory with key as int and value as Map
  final _store = intMapStoreFactory.store(_storeName);
  LocalStorage(this._sembastDatabase);

  @override
  Future<void> putAuthInfo(AuthInfoDTO authIndfo) async {
    await _store.record(1).put(_sembastDatabase.instance, authIndfo.toJson());
  }

  @override
  Future<AuthInfoDTO> getAuthInfoByPhone(String phoneNumber) async {
    try {
      final response = await _store.find(_sembastDatabase.instance);
      return response
          .map((e) => AuthInfoDTO.fromJson(e.value))
          .toList()
          .firstWhere((element) => element.phoneNumber == phoneNumber);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<AuthInfoDTO?> getAuthInfo() async {
    final response = await _store.findFirst(_sembastDatabase.instance);
    if (response != null) {
      return AuthInfoDTO.fromJson(response.value);
    } else {
      return null;
    }
  }

  @override
  Future<void> removeAuthInfo() async {
    final response = await _store.findFirst(_sembastDatabase.instance);
    final authInfo = AuthInfoDTO.fromJson(response!.value);
    final newAuthInfo = AuthInfoDTO(
        phoneNumber: authInfo.phoneNumber,
        password: authInfo.password,
        isSignIn: false);
    await _store.delete(_sembastDatabase.instance);
    await _store.record(1).put(_sembastDatabase.instance, newAuthInfo.toJson());
  }
}
