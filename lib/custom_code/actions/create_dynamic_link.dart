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

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<String> createDynamicLink(
  LatLng latLong,
  List<String>? superMarkets,
  List<String>? sDuration,
  List<String>? shoppingMalls,
  List<String>? shoppingDuration,
  List<String>? hospitals,
  List<String>? hospitalDuration,
  List<String>? schools,
  List<String>? schoolDuration,
  List<String>? quality,
  List<String>? qualityDuration,
  String? address,
) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://whatnearme.page.link',
    link: Uri.parse(
        'https://www.whatnearme.page.link/?latLong=$latLong&superMarkets=$superMarkets&sDuration=$sDuration&shoppingMalls=$shoppingMalls&shoppingDuration=$shoppingDuration&hospitals=$hospitals&hospitalDuration=$hospitalDuration&schools=$schools&schoolDuration=$schoolDuration&quality=$quality&qualityDuration=$qualityDuration&address=$address'),
    //link: Uri.parse(
    //    'https://www.whatnearme.page.link/?latLong=${Uri.encodeComponent(latLong.toString())}&superMarkets=${Uri.encodeComponent(superMarkets.toString())}&sDuration=${Uri.encodeComponent(sDuration.toString())}&shoppingMalls=${Uri.encodeComponent(shoppingMalls.toString())}&shoppingDuration=${Uri.encodeComponent(shoppingDuration.toString())}&hospitals=${Uri.encodeComponent(hospitals.toString())}&hospitalDuration=${Uri.encodeComponent(hospitalDuration.toString())}&schools=${Uri.encodeComponent(schools.toString())}&schoolDuration=${Uri.encodeComponent(schoolDuration.toString())}&quality=${Uri.encodeComponent(quality.toString())}&qualityDuration=${Uri.encodeComponent(qualityDuration.toString())}&address=${Uri.encodeComponent(address ?? '')}'),

    androidParameters: AndroidParameters(
      packageName: 'com.mycompany.whatnearme',
      minimumVersion: 0,
    ),
    iosParameters: IOSParameters(
      bundleId: 'com.mycompany.whatnearme',
      minimumVersion: '0',
    ),
  );

  final ShortLink =
      await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  try {
    return ShortLink.toString();
  } catch (e) {
    print("Error creating dynamic link: $e");
    return '$ShortLink';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
