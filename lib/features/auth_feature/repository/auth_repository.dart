import 'package:flutter/material.dart';
import 'package:test_app/common/app_url.dart';
import 'package:test_app/data/network/base_api_service.dart';
import 'package:test_app/data/network/network_api_service.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> registerRepository(
    Object? body,
    Map<String, String>? headers,
  ) async {
    try {
      dynamic response = await _apiServices.postApiResponse(
          '${Appurl.baseUrl}users', body, headers);

      debugPrint("response registerRepository :$response");

      return response;
    } catch (e) {
      debugPrint("error registerRepository :$e");
      rethrow;
    }
  }
}
