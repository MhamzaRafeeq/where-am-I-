import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchNearbyCall {
  static Future<ApiCallResponse> call({
    double? latitude = 31.4504,
    double? longitude = 73.1350,
    List<String>? includedTypesList,
    int? radius = 5000,
    int? maxResultcount = 20,
  }) async {
    final includedTypes = _serializeList(includedTypesList);

    final ffApiRequestBody = '''
{
  "includedTypes": ${includedTypes},
  "maxResultCount": ${maxResultcount},
  "locationRestriction": {
    "circle": {
      "center": {
        "latitude": ${latitude},
        "longitude": ${longitude}
      },
      "radius": ${radius}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchNearby',
      apiUrl: 'https://places.googleapis.com/v1/places:searchNearby',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-FieldMask': '*',
        'X-Goog-Api-Key': 'AIzaSyAUiTJnq3Tme_Op3bVWyVyAf8VwANRC4QY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? placesTypes(dynamic response) => getJsonField(
        response,
        r'''$.places[:].types''',
        true,
      ) as List?;
  static List<String>? placesFormattedAddress(dynamic response) =>
      (getJsonField(
        response,
        r'''$.places[:].formattedAddress''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? placesLatitudes(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].location.latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? placesLongitudes(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].location.longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? placesNames(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].displayName.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placesPrimaryDisplayNames(dynamic response) =>
      (getJsonField(
        response,
        r'''$.places[:].primaryTypeDisplayName.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? places(dynamic response) => getJsonField(
        response,
        r'''$.places''',
        true,
      ) as List?;
}

class GetDistanceAndTimeCall {
  static Future<ApiCallResponse> call({
    String? origins = 'faisalabad',
    List<String>? destinationsList,
  }) async {
    final destinations = _serializeList(destinationsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetDistanceAndTimeCall',
        'variables': {
          'origins': origins,
          'destinations': destinations,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? destinationAddress(dynamic response) => (getJsonField(
        response,
        r'''$.destination_addresses''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? distances(dynamic response) => (getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? durations(dynamic response) => (getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AutocompleteCall {
  static Future<ApiCallResponse> call({
    String? input = '',
    String? sessionid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'autocomplete',
      apiUrl: 'https://proxy-server-kohl-eta.vercel.app/${input}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.predictions''',
        true,
      ) as List?;
  static List<String>? addresses(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
