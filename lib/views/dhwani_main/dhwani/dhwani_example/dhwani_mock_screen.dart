import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DhwaniMockScreen extends StatefulWidget {
  const DhwaniMockScreen({super.key});

  @override
  State<DhwaniMockScreen> createState() => _DhwaniMockScreenState();
}

class _DhwaniMockScreenState extends State<DhwaniMockScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Center(
                child: Text(
                  "1/20",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                child: const LinearProgressIndicator(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  value: 0.1,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff319F43)),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image(
                image: const AssetImage("assets/chand2.png"),
                width: screenWidth - 130,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "चाँद",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      fontFamily: "NotoSansDevanagari",
                      color: Color(0xff04434E),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff04434E),
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: const Icon(CupertinoIcons.speaker_2_fill,
                        color: Color(0xff093955), size: 37),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xff00CAED),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff04434E),
                    offset: Offset(4, 4),
                    spreadRadius: 1,
                  )
                ],
              ),
              child:
                  const Icon(CupertinoIcons.mic_solid,
                  color: Colors.white, size: 75),
                  // const Icon(CupertinoIcons.play_fill,
                  //     color: Colors.white, size: 75),
                  // const Icon(CupertinoIcons.waveform,
                  //     color: Colors.white, size: 75),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xffE33629),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:
                    const Icon(CupertinoIcons.restart,
                        color: Colors.white, size: 28),
                  ),
                  Container(
                    width: 180,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Color(0xff319F43),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child:
                    const Icon(CupertinoIcons.checkmark_alt,
                        color: Colors.white, size: 47),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
