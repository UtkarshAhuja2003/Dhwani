import 'package:dhwani/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(bottom: false,
          child: Material(
            color: Colors.blue,
          )
      ),
      backgroundColor: Colors.yellowAccent,
      bottomNavigationBar: BottomNavbar(screen: "Profile"),
    );
  }
}
