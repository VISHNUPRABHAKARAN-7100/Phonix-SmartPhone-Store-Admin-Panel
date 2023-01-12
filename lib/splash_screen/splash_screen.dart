import 'dart:async';

import 'package:admin_panel_of_phonix/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'PHONIX',
              style: GoogleFonts.poppins(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
