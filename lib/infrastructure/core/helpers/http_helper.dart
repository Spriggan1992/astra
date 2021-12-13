import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelpers {
  static const int apiKey = 123456;
  static String baseUrl = 'http://test.mydom.kg//';

  static String register = 'api/v3/profile/register';

  static Future<http.Response> postRegister({required String body}) async {
    try {
      final Uri uri = Uri.parse("$baseUrl$register");
      final response = await http.post(uri,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: body);

      return response;
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  static Future<http.Response> get({required String body}) async {
    try {
      final Uri uri = Uri.parse("$baseUrl$register");
      final response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      return response;
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  static Future<http.Response> post(
      {required String endpoint,
      required int apiKey,
      required String token,
      required Map<String, dynamic> bodyOptions}) async {
    try {
      final Uri uri = Uri.parse("$baseUrl$endpoint");

      final Map<String, dynamic> _bodyData = {
        'api_token': token,
        'api_key': apiKey,
      };

      if (bodyOptions.isNotEmpty) {
        _bodyData.addAll(bodyOptions);
      }

      final _body = json.encode(_bodyData);

      final response = await http.post(uri,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: _body);

      return response;
    } catch (e) {
      if (e is SocketException) {
      } else if (e is TimeoutException) {}

      print('SocetExeption $e');
      throw HttpException(e.toString());
    }
  }
}
