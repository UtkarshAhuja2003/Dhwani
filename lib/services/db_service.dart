import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:dhwani/model/dhwani.dart';
import 'package:dhwani/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbserviceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService(ref.watch(clientProvider));
});


final coverImageProvider =
    FutureProvider.family<Uint8List, String>((ref, id) async {
  final db = ref.watch(dbserviceProvider);
  return db.getCoverImage(id: id);
});

final soundImageProvider =
    FutureProvider.family<Uint8List, String>((ref, id) async {
  final db = ref.watch(dbserviceProvider);
  return db.getSoundImage(id: id);
});

final exampleImageProvider =
    FutureProvider.family<Uint8List, String>((ref, id) async {
  final db = ref.watch(dbserviceProvider);
  return db.getExampleImage(id: id);
});

final alphabetProvider =
    FutureProvider.family<Alphabets, String>((ref, id) async {
  final db = ref.watch(dbserviceProvider);
  return db.getAlphabet(fileId: id);
});


final exampleProvider =
    FutureProvider.family<Example, String>((ref, id) async {
  final db = ref.watch(dbserviceProvider);
  return db.getExample(fileId: id);
});


class DatabaseService {
  final Client _client;
  late final Databases _databases;
  late final Storage _storage;
  DatabaseService(this._client) {
    _databases = Databases(_client);
    _storage = Storage(_client);
  }
  static const databaseId = "dhwani_db";

  Future<Uint8List> getCoverImage({required String id}) {
    return _storage.getFileDownload(bucketId: 'soundcoverimage', fileId: id);
  }

  Future<Uint8List> getSoundImage({required String id}) {
    return _storage.getFileDownload(bucketId: 'soundimage', fileId: id);
  }

  Future<Uint8List> getExampleImage({required String id}) {
    return _storage.getFileDownload(bucketId: 'exampleimage', fileId: id);
  }

  Future<Uint8List> getAlphabetSound({required String id}) {
    return _storage.getFileDownload(bucketId: 'alphabetsound', fileId: id);
  }

  Future<Uint8List> getExampleSound({required String id}) {
    return _storage.getFileDownload(bucketId: 'examplesound', fileId: id);
  }

  Future<List<Sounds>> listSound({required String collectionId}) {
    return _databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.limit(100)
        ]).then(
        (value) => value.documents.map((e) => Sounds.fromMap(e.data)).toList());
  }

  Future<Alphabets> getAlphabet({required String fileId}) {
    return _databases
        .getDocument(
            databaseId: databaseId,
            collectionId: 'alphabets',
            documentId: fileId)
        .then((value) => Alphabets.fromMap(value.data));
  }

   Future<Example> getExample({required String fileId}) {
    return _databases
        .getDocument(
            databaseId: databaseId,
            collectionId: 'examples',
            documentId: fileId)
        .then((value) => Example.fromMap(value.data));
  }

  Future<List<Alphabets>> listAlphabets({required String collectionId}) {
    return _databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.limit(100)
        ]).then((value) =>
        value.documents.map((e) => Alphabets.fromMap(e.data)).toList());
  }

  Future<List<Example>> listExamples({required String collectionId}) {
    return _databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.limit(100)
        ]).then((value) =>
        value.documents.map((e) => Example.fromMap(e.data)).toList());
  }
}
