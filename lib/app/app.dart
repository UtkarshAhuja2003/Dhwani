import 'package:dhwani/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DhwaniApp extends StatelessWidget {
  const DhwaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhwani',
      theme: ThemeData(
        fontFamily: GoogleFonts.arimo().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}