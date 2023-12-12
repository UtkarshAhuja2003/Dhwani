import 'package:flutter/material.dart';

import '../../../../model/dhwani.dart';

class DhwaniExampleDetailScreen extends StatefulWidget {
  const DhwaniExampleDetailScreen({Key? key, required this.alphabet}) : super(key: key);

  final DhwaniClass alphabet;

  @override
  State<DhwaniExampleDetailScreen> createState() => _DhwaniExampleDetailScreenState();
}

class _DhwaniExampleDetailScreenState extends State<DhwaniExampleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xffE6F4F1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () {
                        // controller.nextPage(
                        //     duration: const Duration(milliseconds: 500),
                        //     curve: Curves.easeInOut);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2,
                                color: const Color(
                                    0xff04434E)) // Change the color as needed
                        ),
                        padding:
                        const EdgeInsets.all(8), // Adjust padding as needed
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff04434E), // Change the color as needed
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.alphabet.name,
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xff04434E),
              width: screenWidth,
              height: 2,
            ),
            Container(
              width: screenWidth,
              color: const Color(0xff0CC0DF),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28, top: 40),
                    child: Text(
                      widget.alphabet.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          fontFamily: "NotoSansDevanagari",
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    ),
                    child: const Image(image: AssetImage("assets/speaker.png")),
                  ),
                  const SizedBox(height: 20,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 28, right: 28, top: 40),
                      child: Text(
                        "उदाहरण के लिए:",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          fontFamily: "NotoSansDevanagari",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: widget.alphabet.examples.length,
                            itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10), // Adjust the value for the desired roundness
                                      ),
                                    ),
                                    const Positioned.fill(
                                      child: Center(
                                        child: Image(
                                          image: AssetImage("assets/chand2.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("चाँद",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 23,
                                            fontFamily: "NotoSansDevanagari",
                                            color: Colors.white,
                                          ),),
                                        Image(
                                          image: AssetImage("assets/smallSpeaker.png"),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}