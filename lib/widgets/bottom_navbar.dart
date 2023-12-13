import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius:  BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
        height: 57,
        color:  Color(0xffE6FAFD),
        elevation: 0, // Optional: Set elevation to 0 to remove shadow
        child: SizedBox(
          height: 50,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                size: 40,
                color: Color(0xff0CC0DF),
              ),
              Icon(
                Icons.home,
                size: 40,
                color: Color(0xff0CC0DF),
              ),
              Icon(
                Icons.home,
                size: 40,
                color: Color(0xff0CC0DF),
              ),
              Icon(
                Icons.home,
                size: 40,
                color: Color(0xff0CC0DF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
