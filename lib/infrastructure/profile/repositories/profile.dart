import 'package:astra_app/infrastructure/core/helpers/endpoints.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class Profile {
  final _dio = Dio();

  Future getProfile(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.get(Endpoints.user.account);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.getProfile");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.getProfile");
      return e.response?.data;
    }
  }

  Future hideAccount(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.hideAccount);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.hide");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.hide");
      return e.response?.data;
    }
  }

  Future showAccount(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.showAccount);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.show");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.show");
      return e.response?.data;
    }
  }

  Future hideAccountInfo(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.hideAccountInfo);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.hideInfo");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.show");
      return e.response?.data;
    }
  }

  Future showAccountInfo(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.showAccountInfo);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.showInfo");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.showInfo");
      return e.response?.data;
    }
  }

  Future addPhoto(String token, String path) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      var data = FormData.fromMap({
        "image": MultipartFile.fromFile(path, filename: path.split("/").last),
      });
      res = await _dio.post(Endpoints.user.addPhoto, data: data);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.addPhoto");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.addPhoto");
      return e.response?.data;
    }
  }

  Future updatePhoto(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.updatePhoto);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.updatePhoto");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.updatePhoto");
      return e.response?.data;
    }
  }

  Future deletePhoto(String token, int imageId) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.delete(Endpoints.user.deletePhoto, data: {"image_id": imageId});
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.deletePhoto");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.deletePhoto");
      return e.response?.data;
    }
  }

  Future updateShortInfo(String token, String info) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.updateShortInfo, data: {"info": info});
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.updateShortInfo");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.updateShrotInfo");
      return e.response?.data;
    }
  }

  Future updateStatus(String token, int status) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.updateStatus, data: {"status": status});
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.UpdateStatus");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.updateStatus");
      return e.response?.data;
    }
  }

  Future getStatuses(String token) async {
    Response<dynamic> res;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      res = await _dio.post(Endpoints.user.getStatuses);
      log("${res.statusCode}: ${res.requestOptions.path}\n${res.data}",
          time: DateTime.now(), name: "Profile.getStatuses");
      return res;
    } on DioError catch (e) {
      log("${e.response?.statusCode}: ${e.response?.data}",
          name: "Profile.getStatuses");
      return e.response?.data;
    }
  }
}