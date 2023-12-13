import 'package:dhwani/views/dhwani_main/dhwani_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(bottom: false, child: DhwaniScreen()),
      bottomNavigationBar: ClipRRect(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BottomAppBar(
          color:  Color(0xffE6FAFD),
          elevation: 0, // Optional: Set elevation to 0 to remove shadow
          child: SizedBox(
            height: 67,
            child:  Row(
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

