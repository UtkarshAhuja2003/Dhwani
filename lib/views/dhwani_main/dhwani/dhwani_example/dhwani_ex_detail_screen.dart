import 'dart:developer';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dhwani/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../model/dhwani.dart';

class DhwaniExampleDetailScreen extends ConsumerWidget {
  DhwaniExampleDetailScreen({super.key, required this.alphabet});

  final Alphabets alphabet;

  final audioPlayer = AudioPlayer()..setPlaybackRate(0.5);

  Future<void> playAudioFromUrl(Uint8List url) async {
    await audioPlayer.play(BytesSource(url));
  }

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
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
                          color:
                              Color(0xff04434E), // Change the color as needed
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      alphabet.name,
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
                    padding:
                        const EdgeInsets.only(left: 28, right: 28, top: 40),
                    child: Text(
                      alphabet.desc,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          fontFamily: "NotoSansDevanagari",
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await playAudioFromUrl(await ref
                          .watch(dbserviceProvider)
                          .getAlphabetSound(id: alphabet.soundId));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                    ),
                    child: const Image(image: AssetImage("assets/speaker.png")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 10),
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0.0),
                          itemCount: alphabet.exampleIds.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ref
                                .watch(
                                    exampleProvider(alphabet.exampleIds[index]))
                                .when(
                                    data: (data) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            ref
                                                .watch(exampleImageProvider(
                                                    data.imageId))
                                                .when(
                                                    data: (data) {
                                                      //   return Stack(
                                                      //     children: [
                                                      //       Container(
                                                      //         width: 80,
                                                      //         height: 80,
                                                      //         decoration:
                                                      //             BoxDecoration(
                                                      //           color:
                                                      //               Colors.white,
                                                      //           borderRadius:
                                                      //               BorderRadius
                                                      //                   .circular(
                                                      //                       10), // Adjust the value for the desired roundness
                                                      //         ),
                                                      //       ),
                                                      //       Positioned.fill(
                                                      //         child: Center(
                                                      //             child: SvgPicture
                                                      //                 .memory(
                                                      //                     data)),
                                                      //       ),
                                                      //     ],
                                                      //   );
                                                      return const SizedBox
                                                          .shrink();
                                                    },
                                                    error: (error, stackTrace) {
                                                      log("Something went wrong",
                                                          error: error,
                                                          stackTrace:
                                                              stackTrace);
                                                      return const SizedBox
                                                          .shrink();
                                                    },
                                                    loading: () =>
                                                        const SizedBox
                                                            .shrink()),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      data.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 23,
                                                        fontFamily:
                                                            "NotoSansDevanagari",
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        await playAudioFromUrl(await ref
                                                            .read(
                                                                dbserviceProvider)
                                                            .getExampleSound(
                                                                id: data
                                                                    .soundId));
                                                      },
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "assets/smallSpeaker.png"),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    error: (error, stackTrace) =>
                                        Text(error.toString()),
                                    loading: () => const SizedBox.shrink());
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
