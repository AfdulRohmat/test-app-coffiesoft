import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/features/auth_feature/views/login_screen.dart';
import 'package:test_app/features/home_feature/views/home_screen.dart';
import 'package:test_app/res/colors/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final localStorage = GetStorage();

  @override
  void initState() {
    final token = localStorage.read('token');

    if (token != null) {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => const HomeScreen());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => const LoginScreen());
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            "SplashScreen",
            style: GoogleFonts.poppins(
              color: CustomAppColor.mBlack,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
