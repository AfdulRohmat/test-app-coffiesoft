import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/common/app_url.dart';
import 'package:test_app/features/auth_feature/views/login_screen.dart';
import 'package:test_app/features/auth_feature/views/otp_screen.dart';
import 'package:test_app/features/home_feature/views/home_screen.dart';
import 'package:test_app/features/splash_feature/views/splash_screen.dart';
import 'package:test_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class AuthViewModel with ChangeNotifier {
  final localStorage = GetStorage();
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> doRegister(
    String email,
    String hp,
    String firstname,
    String lastname,
    String tglLahir,
    int jenisKelamin,
    String password,
    BuildContext context,
  ) async {
    setLoading(true);
    final body = {
      "email": email,
      "hp": hp,
      "firstname": firstname,
      "lastname": lastname,
      "grup": "member",
      "tgl_lahir": tglLahir,
      "jenis_kelamin": jenisKelamin,
      "password": password,
    };

    try {
      final response = await http.post(Uri.parse('${Appurl.baseUrl}users'),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        debugPrint("response : ${response.statusCode}");
        final data = jsonDecode(response.body);
        setLoading(false);
        // ignore: use_build_context_synchronously
        Utils.flushBarSuccessMessage(
            "${data['status']['keterangan']}", context);
        localStorage.write('email', email);
        Get.to(() => const OTPScreen());
      }
    } catch (e) {
      Utils.flushBarErrorMessage("Register failed. $e", context);
      debugPrint("error : $e");
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  Future<void> doLogin(
      String username, String password, BuildContext context) async {
    setLoading(true);
    final body = {
      "username": username,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse('${Appurl.baseUrl}login'),
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        Utils.flushBarSuccessMessage(
            "${data['status']['keterangan']}", context);
        localStorage.write('token', data['access_token']);
        localStorage.write('userId', data['data']['id']);
        Timer(const Duration(seconds: 2), () {
          Get.offAll(() => const HomeScreen());
        });
        setLoading(false);
      }
    } catch (e) {
      Utils.flushBarErrorMessage("Login failed. $e", context);
      debugPrint("error : $e");
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  Future<void> sendOTP(String otp, BuildContext context) async {
    var email = localStorage.read('email');
    setLoading(true);
    final body = {
      "credential": email,
      "otp": otp,
    };
    try {
      final response = await http.post(
          Uri.parse('${Appurl.baseUrl}users/verifikasi'),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        debugPrint("response : ${response.body}");
        final data = jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        Utils.flushBarSuccessMessage(
            "${data['status']['keterangan']}", context);

        Timer(const Duration(seconds: 3), () {
          Get.offAll(() => const LoginScreen());
        });
        setLoading(false);
      }
    } catch (e) {
      Utils.flushBarErrorMessage("Login failed. $e", context);
      debugPrint("error : $e");
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  Future<void> logout() async {
    localStorage.remove('token');
    localStorage.remove('userId');

    Get.offAll(() => SplashScreen());
  }
}
