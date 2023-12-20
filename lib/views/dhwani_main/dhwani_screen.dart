import 'package:dhwani/services/db_service.dart';
import 'package:dhwani/views/dhwani_main/dhwani/dhwani_detail_screen.dart';
import 'package:dhwani/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:dhwani/model/dhwani.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DhwaniScreen extends ConsumerWidget {
  static const routename = '/dhwani';
  const DhwaniScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xffE6F4F1),
              ),
              child: const Align(
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
            FutureBuilder<List<Sounds>>(
                future: ref
                    .watch(dbserviceProvider)
                    .listSound(collectionId: "sounds"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final dhwaniData = snapshot.data;
                      return GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                        ),
                        itemCount: dhwaniData!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dhwani = dhwaniData[index];
                          return Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200)),
                              child: Container(
                                // padding: EdgeInsets.all(10),
                            
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: const Offset(
                                          0, 4), // Offset the shadow downward
                                      spreadRadius:
                                          2, // Increase the spread radius
                                      blurRadius: 8, // Increase the blur radius
                                    )
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DhwaniDetailScreen(
                                                    dhwani: dhwani)));
                                  },
                                  child: Flexible(
                                    child: Column(
                                      children: [
                                        ref
                                            .watch(coverImageProvider(
                                                dhwani.coverImage))
                                            .when(
                                                data: (bytes) {
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5,
                                                              top: 6),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), // Adjust the radius as needed
                                                        child: Image.memory(bytes),
                                                      ));
                                                },
                                                loading: () {
                                                  return const SizedBox.shrink();
                                                },
                                                error: (e, _) => const Text(
                                                    "Something went wrong")),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DhwaniDetailScreen(
                                                            dhwani: dhwani)));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: const Color(
                                                0xff0CC0DF), // Button background color
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                2), // Adjust the padding as needed
                                            child: Text(
                                              dhwani.name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Text("Loading");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
