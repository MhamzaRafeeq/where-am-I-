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

import 'package:geocoding/geocoding.dart';

Future<LatLng> getLatLngFromAddress(String? address) async {
  // get latlng from provided address using geocoding package

  if (address == null || address == '') {
    return LatLng(31.582045, 74.329376);
  }
  List<Location> locations = await locationFromAddress('lahore, pakistan');

  if (locations.isNotEmpty) {
    double latitude = locations.first.latitude;
    double longitude = locations.first.longitude;
    return LatLng(latitude, longitude);
  } else {
    return LatLng(31.418715, 73.079109);
  }
}
