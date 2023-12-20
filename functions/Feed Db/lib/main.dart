import 'dart:developer';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';

// void main() {
//   Directory dir = Directory("images");
//   final list = dir.listSync();
//   for (var i = 0; i < list.length; i++) {
//     print(list[i].path.split('images\\').last.split(".svg"));
//   }
// }

void main() async {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('dhwani')
      .setKey(
          'ed9ab1f86f55fad4547678a8c28625afcd702fc9f531914e7951c45839f7de471e7eb08dde49ea7ca8767092d9b1efcd2414eb1ad2424fac9060f19eb9b17f996663a693561e70672014880f35c9c2d01de1864d5c7e3c212468ed11c7527db96781f934f3c908da97a62d8c0d84aca94bd59f4358ecea4c9c475a9c4d2bb3f0');

  final Databases db = Databases(client);
  final storage = Storage(client);
  final databaseId = "dhwani_db";
  final soundCollection = "sounds";
  final alphabetCollection = "alphabets";
  final exampleCollection = "examples";

  final file = File("word_db.csv");
  if (await file.exists()) {
    final List<String> lines = await file.readAsLines();
    late String soundDocumentId;
    late String alphabetDocumentId;
    final List<String> alphabetIds = [];
    final List<String> exampleIds = [];
    for (int i = 0; i < lines.length; i++) {
      final [soundType, description, alpha, exType, exName, alphaDesc] =
          lines[i].split(",");

      if (i != 0 && soundType != lines[i - 1].split(",").first) {
        await db.updateDocument(
            databaseId: databaseId,
            collectionId: soundCollection,
            documentId: soundDocumentId,
            data: {"alphabet_ids": alphabetIds});
        alphabetIds.clear();
        log("Updated Document $soundDocumentId");
      } else {
        soundDocumentId = await db.createDocument(
            databaseId: databaseId,
            collectionId: soundCollection,
            documentId: ID.unique(),
            data: {
              "sound_type": soundType,
              "description": description,
            }).then((value) => value.$id);
        log("Inserted Document $soundDocumentId");
      }

      if (i != 0 && alpha != lines[i - 1].split(",")[2]) {
        await db.updateDocument(
            databaseId: databaseId,
            collectionId: alphabetCollection,
            documentId: alphabetDocumentId,
            data: {"example_ids": exampleIds});
        exampleIds.clear();
        log("Updated Document $alphabetDocumentId");
      } else {
        Directory alphaAudioDir = Directory("alphaAudios");
        String? alphaAudioId;
        if (await alphaAudioDir.exists()) {
          for (var data in alphaAudioDir.listSync()) {
            final fileName = data.path.split('alphaAudios\\').last;
            if (fileName.split(".mp3").first.contains(alpha)) {
              alphaAudioId = await storage
                  .createFile(
                      bucketId: "alphabetsound",
                      fileId: ID.unique(),
                      file: InputFile.fromPath(
                          path: data.path, filename: fileName))
                  .then((value) => value.$id);
            }
          }
        }

        alphabetDocumentId = await db.createDocument(
            databaseId: databaseId,
            collectionId: alphabetCollection,
            documentId: ID.unique(),
            data: {
              "name": alpha,
              "description": alphaDesc,
              "sound_id": alphaAudioId
            }).then((value) => value.$id);
        alphabetIds.add(alphabetDocumentId);
      }
      Directory dir = Directory("images");
      String? imgId;
      if (await dir.exists()) {
        for (var data in dir.listSync()) {
          final fileName = data.path.split('images\\').last;
          if (fileName.split(".svg").first.contains(exName)) {
            imgId = await storage
                .createFile(
                    bucketId: "exampleimage",
                    fileId: ID.unique(),
                    file:
                        InputFile.fromPath(path: data.path, filename: fileName))
                .then((value) => value.$id);
          }
        }
      }

      Directory audioDir = Directory("audio");
      String? audioId;
      if (await audioDir.exists()) {
        for (var data in audioDir.listSync()) {
          final fileName = data.path.split('audio\\').last;
          if (fileName.split(".mp3").first.contains(exName)) {
            audioId = await storage
                .createFile(
                    bucketId: "examplesound",
                    fileId: ID.unique(),
                    file:
                        InputFile.fromPath(path: data.path, filename: fileName))
                .then((value) => value.$id);
          }
        }
      }
      final examplesData = await db.createDocument(
          databaseId: databaseId,
          collectionId: exampleCollection,
          documentId: ID.unique(),
          data: {
            "name": exName,
            "type": exType.toUpperCase(),
            "img_id": imgId,
            "sound_id": audioId
          });
      exampleIds.add(examplesData.$id);
      log("Updated Example Document ${examplesData.$id}");

      // You can log messages to the console
      print('All Done');
      // await Future.delayed(Duration(seconds: 3));
    }

    // res.json() is a handy helper for sending JSON
  } else {
    print("File Doesn't Exists");
  }
}
