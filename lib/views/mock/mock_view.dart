import 'package:flutter/material.dart';

import '../../widgets/bottom_navbar.dart';

class MockView extends StatelessWidget {
  const MockView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(bottom: false,
          child: Material(
          )
      ),
      backgroundColor: Colors.orange,
      bottomNavigationBar: BottomNavbar(screen: "Mock"),
    );
  }
}
