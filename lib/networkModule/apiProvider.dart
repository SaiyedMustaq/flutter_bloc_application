import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../blocStructure/login/model/loginResponse.dart';
import 'CustomException.dart';

class ApiProvider {
  Future<ModelLoginResponse> loginCall(
      {String? url, String? email, String? password}) async {
    ModelLoginResponse? _loginResponse;
    try {
      var request = <String, dynamic>{};
      request["email"] = email!.trim();
      request["password"] = password!.trim();
      var response = await http.post(
        Uri.parse(url!),
        body: request,
        headers: {"Accept": "application/json"},
      );
      debugPrint("Response   ${response.statusCode}");
      _loginResponse = ModelLoginResponse.fromJson(json.decode(response.body));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      debugPrint('ERROR $e');
    }
    return _loginResponse!;
  }

  Future<dynamic> posCallApi() async {
    dynamic dynamicResponse;

    return dynamicResponse;
  }

  Future<dynamic> getFutureCall(
    String url,
  ) async {
    var responseJson;
    debugPrint('Url Was $url');
    http.Response response = await http.get(Uri.parse(url));
    try {
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      debugPrint('ERROR $e');
    }
    return responseJson;
  }
}

dynamic _response(http.Response response) {
  debugPrint('Response Code ${response.statusCode}');
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    default:
      throw FetchDataException(
          'Error occurred while communication with server with statusCode : ${response.statusCode}');
  }
}
