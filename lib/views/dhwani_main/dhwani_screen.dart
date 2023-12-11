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
                padding: const EdgeInsets.all(20.0),
                gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 13),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, 4), // Offset the shadow downward
                          spreadRadius: 2, // Increase the spread radius
                          blurRadius: 8, // Increase the blur radius
                        )
                      ],),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, right: 5, top: 6),
                            child: Image(
                              image: AssetImage("assets/uccharan.png"),
                              // width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                    
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: const Color(0xff0CC0DF
                              ), // Button background color
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2), // Adjust the padding as needed
                              child: Text(
                                'उच्चारण के मूल',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
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