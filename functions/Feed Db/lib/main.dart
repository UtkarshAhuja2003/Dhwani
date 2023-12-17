import 'dart:async';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';

void main() async {
  final file = File("word_db.csv");
  if (await file.exists()) {
    final lines = await file.readAsLines();
    for (var line in lines) {
      final words = line.split(",");
      print(line);
    }
  }
}

// This is your Appwrite function
// It's executed each time we get a request
Future<dynamic> main(final context) async {
  // Why not try the Appwrite SDK?
  //
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(Platform.environment['APPWRITE_API_KEY']);

  final Databases db = Databases(client);
  
   final file = File("word_db.csv");
  if (await file.exists()) {
    final List<String> lines = await file.readAsLines();
    for (var line in lines) {
      final List<String> words = line.split(",");
      print(line);
    }
  }

  // You can log messages to the console
  context.log('Hello, Logs!');

  // If something goes wrong, log an error
  context.error('Hello, Errors!');

  // The `req` object contains the request data
  if (context.req.method == 'GET') {
    // Send a response with the res object helpers
    // `res.send()` dispatches a string back to the client
    return context.res.send('Hello, World!');
  }

  // `res.json()` is a handy helper for sending JSON
  return context.res.json({
    'motto': 'Build like a team of hundreds_',
    'learn': 'https://appwrite.io/docs',
    'connect': 'https://appwrite.io/discord',
    'getInspired': 'https://builtwith.appwrite.io',
  });
}
