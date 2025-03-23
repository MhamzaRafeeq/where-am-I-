// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

Future<FFUploadedFile?> generateMapImage(
  double? longitude,
  double? latitude,
) async {
  // Add your function code here!
  if (latitude == null || longitude == null) {
    print('Invalid latitude or longitude');
    return null;
  }
  String apiKey = 'AIzaSyAfq-rekYBmMog4QjF6Q_pjEjpTRT51SKQ';
  String location = '$latitude,$longitude';
  int zoom = 14;
  int width = 600;
  int height = 600;
  int scale = 2;
  String markers = 'color:red|label:S|$latitude,$longitude';

  String url =
      'https://maps.googleapis.com/maps/api/staticmap?center=$location&zoom=$zoom&size=${width}x${height}&scale=$scale&markers=$markers&key=$apiKey';
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print('Error: ${response.statusCode}, ${response.body}');
      return null;
    }

    String name = 'map_image.png';

    List<int> bytes = response.bodyBytes;
    Uint8List uint8List = Uint8List.fromList(bytes);

    return FFUploadedFile(bytes: uint8List, name: name);
  } catch (e) {
    print('Error generating map image: $e');
    return null;
  }
}
