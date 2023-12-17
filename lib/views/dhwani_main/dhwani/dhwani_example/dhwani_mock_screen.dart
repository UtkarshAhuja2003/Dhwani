import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../model/dhwani.dart';

class DhwaniMockScreen extends StatefulWidget {
  DhwaniMockScreen({super.key, required this.dhwani ,required this.alphabets, required this.mockType});

  final List<DhwaniClass> alphabets;
  final List<DhwaniElement> dhwani;
  final String mockType;

  @override
  State<DhwaniMockScreen> createState() => DhwaniMockScreenState();
}

class DhwaniMockScreenState extends State<DhwaniMockScreen> {
  final recorder = FlutterSoundRecorder();
  final audioPlayer = AudioPlayer();
  int examplesLength = 28;
  bool isRecorded = false;
  bool isPlaying = false;
  int currentExample = 0;
  Color _containerColor = const Color(0xff00CAED);
  List <Example> selectedExamples = [];

  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  void selectExamples() {
    if(widget.mockType == "categorised")
      {
        for (var alphabet in widget.alphabets)
        {
          for(var example in alphabet.examples)
          {
            selectedExamples.add(example);
          }
        }
      }
    else{
      for(var dhwanis in widget.dhwani)
        {
          for (var alphabet in dhwanis.dhwanis)
          {
            for(var example in alphabet.examples)
            {
              selectedExamples.add(example);
            }
          }
        }
    }
    if(widget.mockType == "categorised")
      {
        examplesLength = 15;
      }
    selectedExamples.shuffle(Random());
    if(selectedExamples.length > examplesLength)
      {
        selectedExamples = selectedExamples.sublist(0, examplesLength);
      }
  }

  @override
  void initState() {
    super.initState();
    selectExamples();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future<void> initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "Microphone permission not granted";
    }
  }

  Future record() async {
    await recorder.openRecorder();
    await recorder.startRecorder(toFile: 'audio');
    await Future.delayed(const Duration(seconds: 5));
    await stop();
    setState(() {
      isRecorded = true;
    });
  }

  late File audioFile;
  Future stop() async {
    setState(() {
      _containerColor = const Color(0xff00caed);
    });
    final audioPath = await recorder.stopRecorder();
    audioFile = File(audioPath!);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: Text(
                  "${currentExample+1}/${selectedExamples.length}",
                  style: const TextStyle(
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
                child: LinearProgressIndicator(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  value: ((currentExample+1)/selectedExamples.length),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff319F43)),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image.network(
                selectedExamples[currentExample].image,
                width: screenWidth - 100,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedExamples[currentExample].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      fontFamily: "NotoSansDevanagari",
                      color: Color(0xff04434E),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      playAudioFromUrl(selectedExamples[currentExample].sound);
                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                setState(() {
                  _containerColor = (_containerColor == const Color(0xff00caed))
                      ? const Color(0xff319F43)
                      : const Color(0xff00caed);
                });
                if (isRecorded) {
                  isPlaying = true;
                  setState(() {
                    _containerColor = const Color(0xff319F43);
                  });
                  await audioPlayer.play(UrlSource(audioFile.path));
                  setState(() {
                    _containerColor = const Color(0xff00caed);
                  });
                } else {
                  await record();
                }
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff04434E),
                      offset: Offset(4, 4),
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Icon(
                    (isPlaying == true)
                        ? CupertinoIcons.waveform
                        : (isRecorded)
                            ? CupertinoIcons.play_fill
                            : CupertinoIcons.mic_fill,
                    color: Colors.white,
                    size: 75),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  isRecorded
                      ? InkWell(
                        onTap: (){
                          currentExample+=1;
                          isRecorded = false;
                          isPlaying = false;
                          _containerColor = const Color(0xff00caed);
                          setState(() {});
                        },
                        child: Container(
                            width: 180,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color(0xff319F43),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.white,
                              size: 47,
                            ),
                          ),
                      )
                      : Container(),
                  isPlaying
                      ? InkWell(
                    onTap: (){
                      isRecorded = false;
                      isPlaying = false;
                      _containerColor = const Color(0xff00caed);
                      setState(() {});
                    },
                        child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xffE33629),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(CupertinoIcons.restart,
                                color: Colors.white, size: 28),
                          ),
                      )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
