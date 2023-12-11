import 'package:flutter/material.dart';

class DhwaniScreen extends StatelessWidget {
  const DhwaniScreen({Key? key}) : super(key: key);

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
              child: 
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "ध्वनि-विज्ञान",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
              ),
            ),
            Container(
              color: const Color(0xff04434E),
              width: screenWidth,
              height: 2,
            ),
            GridView.builder(
              physics: const ScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(32.0),
                gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xff0CC0DF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'प',
                        style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 45,
                                  fontFamily: "NotoSansDevanagari",
                                  color: Colors.white,
                          )
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}