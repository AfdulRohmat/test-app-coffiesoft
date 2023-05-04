import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/auth_feature/view_model/auth_view_model.dart';
import 'package:test_app/features/home_feature/view_model/home_view_model.dart';
import '../../../res/colors/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    homeViewModel.getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(8),
          child: homeViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Hello.. Welcome back",
                        style: GoogleFonts.publicSans(
                          color: CustomAppColor.mdarkGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        homeViewModel.dataUser['data']['email'],
                        style: GoogleFonts.publicSans(
                          color: CustomAppColor.mBlack,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        authViewModel.logout();
                      },
                      child: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          color: CustomAppColor.mBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                )),
    );
    ;
  }
}
