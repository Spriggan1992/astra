import 'dart:convert';

import 'package:astra_app/model/base_response.dart';
import 'package:astra_app/model/failure.dart';

class AuthRepository {
  // Future<BaseResponse<UserData>?> getUserDataByPhone(
  //     {required String phone, required String mobileType}) async {
  //   Map<String, dynamic> _body = {
  //     'phone': phone,
  //     'mobile_type': mobileType,
  //     'api_key': HttpHelpers.apiKey,
  //   };

  //   try {
  //     final response = await HttpHelpers.postLogin(body: json.encode(_body));
  //     return BaseResponse.fromJson(response.body);
  //   } catch (error) {
  //     throw Exception('Failed to load user login data');
  //   }
  // }

  Future<void> logout() async {}
}
