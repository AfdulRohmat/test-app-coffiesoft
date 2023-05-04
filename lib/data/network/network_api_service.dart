import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:test_app/data/network/base_api_service.dart';

import '../app_exception.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResoponse(String url, Map<String, String>? headers) async {
    dynamic responseBody;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));

      responseBody = returnResponse(response);

      //
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseBody;
  }

  @override
  Future postApiResponse(
      String url, Object? body, Map<String, String>? headers) async {
    dynamic responseBody;
    try {
      final response = await http
          .post(Uri.parse(url), body: body, headers: headers)
          .timeout(const Duration(seconds: 10));

      responseBody = returnResponse(response);

      //
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseBody;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseBody = response.body;
        return responseBody;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(response.body.toString());
    }
  }
}
