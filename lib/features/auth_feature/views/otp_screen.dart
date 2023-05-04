import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/res/colors/app_color.dart';

import '../view_model/auth_view_model.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String otpValue = "";

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TITLE
                Text(
                  "OTP Verification",
                  style: GoogleFonts.poppins(
                    color: CustomAppColor.mBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 32),

                // OTP TEXFIELD
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: CustomAppColor.mBlue,
                  showFieldAsBox: true,
                  fieldWidth: 50,
                  onSubmit: (String verificationCode) {
                    setState(() {
                      otpValue = verificationCode;
                    });
                  }, // end onSubmit
                ),

                const SizedBox(height: 32),

                // BUTTON
                ElevatedButton(
                  onPressed: () {
                    debugPrint("otp: $otpValue");
                    authViewModel.sendOTP(otpValue, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomAppColor.mBlue,
                    fixedSize: Size(Get.width, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: authViewModel.isLoading
                        ? Transform.scale(
                            scale: 0.7,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Send OTP",
                            style: GoogleFonts.publicSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),

                // send otp again
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Send OTP code again',
                    style: GoogleFonts.poppins(
                      color: CustomAppColor.mBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
