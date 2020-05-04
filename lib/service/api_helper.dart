import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:providerplay/service/z_imports_services.dart';
import 'dart:convert';
import 'dart:async';

import 'package:providerplay/utils/strings.dart';

class ApiBaseHelper {
  Future<dynamic> get(BuildContext context, String url) async {
    var responseJson;
    var response;

    try {
      print(Strings.baseURL + url);
      response = await http.get(Strings.baseURL + url);
      responseJson = _returnResponse(context, response);
    } on SocketException {}
    return responseJson;
  }

  Future<dynamic> post(BuildContext context, String url, dynamic body) async {
    var responseJson;
    var response;

    try {
      response = await http.post(
        Strings.baseURL + url,
        body: body,
      );

      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException(Strings.internetError);
    }

    return responseJson;
  }
}

dynamic _returnResponse(BuildContext context, http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
