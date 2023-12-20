import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingScreen extends ConsumerWidget {
  static const routename = '/landing';
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Image(
              image: const AssetImage("assets/auth_header_back.png"),
              width: screenWidth, // Set the width to the screen width
              fit: BoxFit
                  .cover, // You can use different BoxFit values based on your needs
            ),
            Positioned(
              top: 130,
              width: screenWidth,
              child: const Center(
                // padding: const EdgeInsets.only(left: 100, right: 65),
                child: Text(
                  "वीडियो थेरेपी",
                  style: TextStyle(
                      color: Colors.transparent,
                      shadows: [
                        Shadow(offset: Offset(0, -8), color: Colors.white)
                      ],
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          Box(
            path: "sinasan",
            screenWidth: screenWidth,
            url: "",
            title: "सिंह आसन",
          ),
          Box(
            path: "jeebmajbut",
            screenWidth: screenWidth,
            url: "",
            title: "जीभ मजबूत",
          ),
          Box(
            path: "jeebkheechna",
            screenWidth: screenWidth,
            url: "",
            title: "जीभ को खींचना",
          ),
          Box(
            path: "jeebdabana",
            screenWidth: screenWidth,
            url: "",
            title: "जीभ दबाना",
          ),
          Box(
            path: "jabdakholna",
            screenWidth: screenWidth,
            url: "",
            title: "जबड़े का खोलना",
          )
        ],
      ),
    ));
  }
}

class Box extends StatelessWidget {
  const Box(
      {super.key,
      required this.screenWidth,
      required this.url,
      required this.title,
      required this.path});

  final double screenWidth;
  final String url;
  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 280,
        width: screenWidth - 70,
        decoration: BoxDecoration(
            color: const Color(0xffB1DCED),
            borderRadius: BorderRadius.circular(15)),
        // color: const Color(0xffB1DCED),
        child: InkWell(
          onTap: () async {
            await launchUrl(Uri.parse('https://youtu.be/zVme4ubcQBw'));
          },
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/$path.jpg"),
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
