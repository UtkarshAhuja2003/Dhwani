import 'package:dhwani/views/auth/login_view.dart';
import 'package:dhwani/views/auth/signup_view.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, this.authType});
  final String? authType;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Image(
        image: const AssetImage("assets/auth_header_back.png"),
        width: screenWidth, // Set the width to the screen width
        fit: BoxFit
            .cover, // You can use different BoxFit values based on your needs
      ),
      Positioned(
        top: 130,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 65, right: 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (authType == "SignIn") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupView()));
                  }
                },
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.transparent,
                      shadows: const [
                        Shadow(offset: Offset(0, -8), color: Colors.white)
                      ],
                      decoration: authType == "SignUp"
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      letterSpacing: 2,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              InkWell(
                onTap: () {
                  if (authType == "SignUp") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  }
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.transparent,
                      shadows: const [
                        Shadow(offset: Offset(0, -8), color: Colors.white)
                      ],
                      decoration: authType == "SignIn"
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      letterSpacing: 2,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
