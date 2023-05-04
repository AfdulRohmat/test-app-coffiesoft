import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../common/app_url.dart';

class HomeViewModel with ChangeNotifier {
  final localStorage = GetStorage();
  bool isLoading = false;
  Map dataUser = {};

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getDataUser() async {
    setLoading(true);
    final userId = localStorage.read('userId');
    final token = localStorage.read('token');
    try {
      final response = await http.get(
          Uri.parse('${Appurl.baseUrl}users/$userId'),
          headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        debugPrint("data $data");
        dataUser = data;
        setLoading(false);
      }
    } catch (e) {
      debugPrint("error : $e");
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }
}
