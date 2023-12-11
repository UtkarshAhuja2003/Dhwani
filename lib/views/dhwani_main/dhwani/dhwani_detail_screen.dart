import 'package:flutter/material.dart';

class DhwaniDetailScreen extends StatelessWidget {
  const DhwaniDetailScreen({Key? key});

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "अगला खंड",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 23,
                              fontFamily: "NotoSansDevanagari",
                              color: Color(0xff04434E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "ओष्ठय ध्वनियाँ",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
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
             Padding(
               padding: const EdgeInsets.only(left: 30, right: 30),
               child: Image(
                image: const AssetImage("assets/speech-mechanism-new.png"),
                width: screenWidth,
                fit: BoxFit.fill,
                           ),
             ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text("ओष्ठय-ध्वनियाँ वे होती हैं, जो हमारे होंठों को मिलाकर निकलती हैं।",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 23,
                  fontFamily: "NotoSansDevanagari",
                  color: Color(0xff04434E),
                ),),
            ),
            const Text("हिंदी में 5 मुख्य ओष्ठय ध्वनियाँ हैं :",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 23,
                  fontFamily: "NotoSansDevanagari",
                  color: Color(0xff04434E),
                ),),
            GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(32.0),
              gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Text("प",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                    fontFamily: "NotoSansDevanagari",
                    color: Color(0xff04434E),
                  ),);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 10, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xff0CC0DF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: const Icon(Icons.arrow_forward, color: Colors.white,),
                    )
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
