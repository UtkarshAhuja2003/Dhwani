import 'package:flutter/material.dart';

import '../../widgets/bottom_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(bottom: false,
          child: Material(
          )
      ),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavbar(screen: "Home"),
    );
  }
}

