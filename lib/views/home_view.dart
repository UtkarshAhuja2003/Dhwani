// import 'package:dhwani/views/auth/signup_view.dart';
import 'package:dhwani/views/dhwani_main/dhwani_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(bottom:false,child: DhwaniScreen()),
    );
  }
}