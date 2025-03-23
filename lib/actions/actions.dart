import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future<List<SearchNearbyResultsStruct>?> generateReportActions(
    BuildContext context) async {
  ApiCallResponse? foodspots;
  ApiCallResponse? transportation;
  ApiCallResponse? shopping;
  ApiCallResponse? finance;
  ApiCallResponse? health;

  await Future.wait([
    Future(() async {
      foodspots = await SearchNearbyCall.call(
        latitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.firstOrNull,
        longitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.lastOrNull,
        includedTypesList: FFAppConstants.Convenience,
      );
    }),
    Future(() async {
      transportation = await SearchNearbyCall.call(
        latitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.firstOrNull,
        longitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.lastOrNull,
        includedTypesList: FFAppConstants.Transportation,
      );
    }),
    Future(() async {
      shopping = await SearchNearbyCall.call(
        latitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.firstOrNull,
        longitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.lastOrNull,
        includedTypesList: FFAppConstants.ShoppingCenters,
      );
    }),
    Future(() async {
      finance = await SearchNearbyCall.call(
        latitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.firstOrNull,
        longitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.lastOrNull,
        includedTypesList: FFAppConstants.FinancialInstitutions,
      );
    }),
    Future(() async {
      health = await SearchNearbyCall.call(
        latitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.firstOrNull,
        longitude: functions
            .getLatitudeAndLongitude(FFAppState().locationFromAddress)
            ?.lastOrNull,
        includedTypesList: FFAppConstants.HealthcareFacilities,
      );
    }),
  ]);
  FFAppState().addToListSearchApiResults(SearchNearbyResultsStruct(
    searchNearbySingleApiCallResult: SearchNearbyCall.places(
      (foodspots?.jsonBody ?? ''),
    )?.map((e) => PlacesTypesStruct.maybeFromMap(e)).withoutNulls.toList(),
  ));
  FFAppState().update(() {});
  FFAppState().addToListSearchApiResults(SearchNearbyResultsStruct(
    searchNearbySingleApiCallResult: SearchNearbyCall.places(
      (transportation?.jsonBody ?? ''),
    )?.map((e) => PlacesTypesStruct.maybeFromMap(e)).withoutNulls.toList(),
  ));
  FFAppState().update(() {});

  return null;
}
