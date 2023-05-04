import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/auth_feature/view_model/auth_view_model.dart';

import '../../../res/colors/app_color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();
  TextEditingController kelaminController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  TextEditingController repeatPasswordlController = TextEditingController();
  bool showPassword = false;
  var dateFormat = DateFormat('yyyy-MM-d');
  bool showRepeatPassword = false;
  final formKey = GlobalKey<FormState>();
  final jenisKelamin = ["Laki-Laki", "Perempuan"];

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // REGISTER
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                        color: CustomAppColor.mBlack,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // EMAIL
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
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
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Enter the correct email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // HP
                  TextFormField(
                    controller: hpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Phone",
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
                      hintText: "Enter your phone number",
                      hintStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                              .hasMatch(value)) {
                        return "Enter the correct phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // FIRSTNAME
                  TextFormField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                      labelText: "Firstname",
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
                      hintText: "Enter your firstname",
                      hintStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "Enter the correct name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // LASTNAME
                  TextFormField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                      labelText: "Lastname",
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
                      hintText: "Enter your lastname",
                      hintStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "Enter the correct name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // TGL LAHIR
                  TextFormField(
                    controller: tglLahirController,
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      tglLahirController.text =
                          dateFormat.format(date!).toString();
                    },
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      labelStyle: TextStyle(
                        color: CustomAppColor.mBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: CustomAppColor.mdarkGrey,
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
                      hintText: "Enter your Date of birth",
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
                        return "Enter your Date of birth";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // JENIS KELAMIN
                  DropdownSearch<String>(
                    mode: Mode.DIALOG,
                    showSelectedItems: true,
                    items: jenisKelamin,
                    validator: (value) {
                      if (value == null) {
                        return 'Input cant be empty';
                      }
                    },
                    onChanged: (value) {
                      value == "Laki-Laki"
                          ? setState(() {
                              kelaminController.text = "1";
                            })
                          : setState(() {
                              kelaminController.text = "2";
                            });
                    },
                    dropdownSearchDecoration: InputDecoration(
                      isDense: true,
                      labelText: "Genre",
                      labelStyle: TextStyle(
                          color: CustomAppColor.mBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      hintText: "Input Genre Information",
                      hintStyle: TextStyle(color: CustomAppColor.mBlack),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          color: CustomAppColor.mBlack,
                          style: BorderStyle.solid,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          color: CustomAppColor.mBlack,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // PASSWORD
                  TextFormField(
                    controller: passwordlController,
                    obscureText: !showPassword,
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
                  const SizedBox(height: 24),

                  // REPEAT PASSWORD
                  TextFormField(
                    controller: repeatPasswordlController,
                    obscureText: !showRepeatPassword,
                    decoration: InputDecoration(
                      labelText: "Repeat Password",
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
                            showRepeatPassword = !showRepeatPassword;
                          });
                        },
                        icon: showRepeatPassword == true
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
                  const SizedBox(height: 24),

                  // BUTTON
                  ElevatedButton(
                    onPressed: () {
                      if (passwordlController.text !=
                          repeatPasswordlController.text) {
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red[400],
                            content: const Text("Enter the correct password"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        return;
                      }

                      if (formKey.currentState!.validate()) {
                        authViewModel.doRegister(
                            emailController.text,
                            hpController.text,
                            firstnameController.text,
                            lastnameController.text,
                            tglLahirController.text,
                            int.parse(kelaminController.text),
                            passwordlController.text,
                            context);
                        debugPrint(
                            "data: ${emailController.text} || ${hpController.text} || ${firstnameController.text} || ${lastnameController.text} || ${tglLahirController.text} || ${kelaminController.text} || ${passwordlController.text}");
                        return;
                      }
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
                              "Register",
                              style: GoogleFonts.publicSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // GO TO LOGIN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: GoogleFonts.poppins(
                          color: CustomAppColor.mBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
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
