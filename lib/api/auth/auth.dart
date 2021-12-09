import 'package:astra_app/api/api.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class Auth {
  final _dio = Dio();

  Future checkPhone(String phone) async {
    Response<dynamic> res;
    try {
      var body = Map.from({"phone_number": phone});
      res = await _dio.post(Endpoints.auth.checkPhone, data: body);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Auth.checkPhone");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Auth.checkPhone");
      return e.response?.data;
    }
  }

  Future login(String phone, String password) async {
    Response<dynamic> res;
    try {
      var body = Map.from({"phone_number": phone, "password": password});
      res = await _dio.post(Endpoints.auth.login, data: body);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          name: "Auth.login");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}", name: "Auth.login");
      return e.response?.data;
    }
  }

  Future passwordReset(String phone) async {
    Response<dynamic> res;
    try {
      var body = Map.from({"phone_number": phone});
      res = await _dio.post(Endpoints.auth.passwordReset, data: body);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          name: "Auth.passwordReset");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Auth.passwordReset");
      return e.response?.data;
    }
  }

  Future checkResetToken(String phone, String resetToken) async {
    Response<dynamic> res;
    try {
      var body = Map.from({"phone_number": phone, "code": resetToken});
      res = await _dio.post(Endpoints.auth.checkResetToken, data: body);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          name: "Auth.checkResetToken");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Auth.checkResetToken");
      return e.response?.data;
    }
  }

  Future resetPassword(String resetToken, String newPassword) async {
    Response<dynamic> res;
    try {
      var body = Map.from({"code": resetToken, "password": newPassword});
      res = await _dio.post(Endpoints.auth.resetPassword, data: body);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          name: "Auth.resetPass");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Auth.resetPass");
      return e.response?.data;
    }
  }
}
