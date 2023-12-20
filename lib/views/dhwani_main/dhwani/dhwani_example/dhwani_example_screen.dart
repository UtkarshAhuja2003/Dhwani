import 'package:dhwani/services/db_service.dart';
import 'package:dhwani/views/dhwani_main/dhwani/dhwani_example/dhwani_ex_detail_screen.dart';
import 'package:dhwani/views/dhwani_main/dhwani/dhwani_example/dhwani_mock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../model/dhwani.dart';
import '../../dhwani_screen.dart';

class DhwaniExampleScreen extends ConsumerWidget {
  const DhwaniExampleScreen({super.key, required this.alphabetIds});

  final List<String> alphabetIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: const Color(
                                    0xff04434E), // Change the color as needed
                              ),
                            ),
                            padding: const EdgeInsets.all(
                                8), // Adjust padding as needed
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(
                                  0xff04434E), // Change the color as needed
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DhwaniScreen()));
                          },
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
            GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(32.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
              ),
              itemCount: alphabetIds.length,
              itemBuilder: (BuildContext context, int index) {
                return ref.watch(alphabetProvider(alphabetIds[index])).when(
                    data: (data) {
                      return Button(data: data);
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.data});

  final Alphabets data;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  DhwaniExampleDetailScreen(
                        alphabet: data)));
      },
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: const Color(0xff0CC0DF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
            data.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              fontFamily: "NotoSansDevanagari",
              color: Colors.white,
            )),
      ),
    );
  }
}
