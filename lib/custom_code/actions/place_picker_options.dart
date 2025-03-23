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
import 'package:uuid/uuid.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For HTTP requests

Future<String> placePickerOptions() async {
  // Initialize the list to store place names
  //List<String> _placesList = [];

  // Generate a unique session token using UUID
  Uuid uuid = Uuid();
  return uuid.v4();

  // // Google Places API key (ensure it's secure and not hardcoded in production)
  // String google_places_api_key = 'AIzaSyAUiTJnq3Tme_Op3bVWyVyAf8VwANRC4QY';

  // // Base URL for the Google Places API
  // String baseURL =
  //     'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  // // Construct the request URL with input and session token
  // String request =
  //     '$baseURL?input=$input&key=$google_places_api_key&sessiontoken=$_sessionToken';

  // try {
  //   // Make the GET request to the API
  //   var response = await http.get(Uri.parse(request));

  //   if (response.statusCode == 200) {
  //     // Parse the response if the status code is 200 (success)
  //     var data = jsonDecode(response.body.toString());
  //     List<dynamic> predictions = data['predictions'];

  //     // Extract the place names from the predictions and store in _placesList
  //     _placesList = predictions
  //         .map((prediction) => prediction['description'] as String)
  //         .toList();

  //     return _placesList;
  //   } else {
  //     // If the response status is not 200, return an empty list or handle as needed
  //     return _placesList;
  //   }
  // } catch (e) {
  //   // If an error occurs, return an empty list or handle the error
  //   print('Error occurred: $e');
  //   return _placesList;
  // }
}
