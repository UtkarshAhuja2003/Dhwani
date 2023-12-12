// import 'package:dhwani/views/auth/signup_view.dart';
import 'package:dhwani/views/dhwani_main/dhwani/dhwani_detail_screen.dart';
import 'package:dhwani/views/dhwani_main/dhwani/dhwani_example/dhwani_example_screen.dart';
import 'package:dhwani/views/dhwani_main/dhwani_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(bottom: false, child: DhwaniScreen()),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BottomAppBar(
          color: const Color(0xffE6FAFD),
          elevation: 0, // Optional: Set elevation to 0 to remove shadow
          child: Container(
            height: 67,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home,
                  size: 45,
                  color: Color(0xff0CC0DF),
                ),
                Icon(
                  Icons.home,
                  size: 45,
                  color: Color(0xff0CC0DF),
                ),
                Icon(
                  Icons.home,
                  size: 45,
                  color: Color(0xff0CC0DF),
                ),
                Icon(
                  Icons.home,
                  size: 45,
                  color: Color(0xff0CC0DF),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

