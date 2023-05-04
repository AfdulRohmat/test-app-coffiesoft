import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/auth_feature/view_model/auth_view_model.dart';
import 'package:test_app/features/auth_feature/views/otp_screen.dart';
import 'package:test_app/features/auth_feature/views/register_screen.dart';
import 'package:test_app/res/colors/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TITLE
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: CustomAppColor.mBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // USERNAME ?EMAIL
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Uername / Email",
                      labelStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: CustomAppColor.mBlack,
                          style: BorderStyle.solid,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: CustomAppColor.mBlack,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: "Enter your username/email",
                      hintStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the correct name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // PASSWORD
                  TextFormField(
                    controller: passwordlController,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: CustomAppColor.mBlack,
                          style: BorderStyle.solid,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: CustomAppColor.mBlack,
                          style: BorderStyle.solid,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: showPassword == true
                            ? Icon(
                                Icons.visibility_off,
                                color: CustomAppColor.mdarkGrey,
                              )
                            : Icon(
                                Icons.visibility,
                                color: CustomAppColor.mdarkGrey,
                              ),
                      ),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // BUTTON
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint(
                            "${emailController.text} || ${passwordlController.text}");
                        authViewModel.doLogin(emailController.text,
                            passwordlController.text, context);
                      }
                      // Get.to(() => OTPScreen());
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
                              "Login",
                              style: GoogleFonts.publicSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // GO TO REGISTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: GoogleFonts.poppins(
                          color: CustomAppColor.mBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            color: CustomAppColor.mBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
