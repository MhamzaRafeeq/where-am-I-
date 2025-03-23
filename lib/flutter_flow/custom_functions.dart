import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> arrangedList(
  List<String> defaultOptions,
  List<String>? selectedOptios,
) {
  // return list with selectedOptions first from defaultOptions if selected null then return default
  if (selectedOptios == null || selectedOptios.isEmpty) {
    return defaultOptions;
  } else {
    List<String> arrangedList = [];
    for (String option in selectedOptios) {
      if (defaultOptions.contains(option)) {
        arrangedList.add(option);
      }
    }
    for (String option in defaultOptions) {
      if (!arrangedList.contains(option)) {
        arrangedList.add(option);
      }
    }
    return arrangedList;
  }
}

List<AddressAndDurationStruct>? addressesAndDurations2(
  List<String>? listofPlaces,
  List<String>? listOfDurations,
  List<String>? listofPlaces2,
  List<String>? listofDurations2,
) {
  // add place and duration one by one in data type address and Duration
  if (listofPlaces == null ||
      listOfDurations == null ||
      listofPlaces2 == null ||
      listofDurations2 == null) {
    return [];
  }

  if (listofPlaces.length != listOfDurations.length ||
      listofPlaces2.length != listofDurations2.length) {
    return [];
  }

  final List<AddressAndDurationStruct> result = [];

  for (int i = 0; i < listofPlaces.length; i++) {
    final String place = listofPlaces[i];
    final String duration = listOfDurations[i];

    final AddressAndDurationStruct addressAndDuration =
        AddressAndDurationStruct(
      name: place,
      travelDuration: duration,
    );

    result.add(addressAndDuration);
  }
  for (int i = 0; i < listofPlaces2.length; i++) {
    final String place = listofPlaces2[i];
    final String duration = listofDurations2[i];

    final AddressAndDurationStruct addressAndDuration2 =
        AddressAndDurationStruct(
      name: place,
      travelDuration: duration,
    );
    result.add(addressAndDuration2);
  }

  return result;
}

List<double>? getLatitudeAndLongitude(LatLng? latlong) {
  // seperate latitude and longitude in latlong
  if (latlong == null) {
    return null;
  }
  return [latlong.latitude, latlong.longitude];
}

List<String>? convertListOfStringsintoListOfStringwithPipeSepertor(
    List<String>? providedStrings) {
  // replace commas between strings with pipe seperators
  if (providedStrings == null) {
    return null;
  }
  return providedStrings.map((str) => str + '|').toList();
}

List<Color> generateGrades2(
  List<String>? list1,
  Color unselectedColor,
  String locationType,
) {
  List<Color>? grades = [unselectedColor, Colors.orange];

  List<int> minutesList = [];

  if (list1 == null || list1.isEmpty) {
    return [unselectedColor, Colors.orange];
  }

  List<String> times = [];

  for (String list in list1 ?? []) {
    times.add(list);
  }

  for (String timeString in times) {
    List<String> parts = timeString.split(' ');
    int minutes = 0;

    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == 'hour' || parts[i] == 'hours') {
        int hours = int.parse(parts[i - 1]);
        minutes += hours * 60;
      } else if (parts[i] == 'minute' ||
          parts[i] == 'minutes' ||
          parts[i] == 'min' ||
          parts[i] == 'mins') {
        int mins = int.parse(parts[i - 1]);
        minutes += mins;
      }
    }

    minutesList.add(minutes);
  }
  int totalCounts = minutesList.length;
  if (locationType == 'urban') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes <= 15).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, Colors.orange];
    }
  }

  if (locationType == 'suburban') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes <= 30).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, Colors.orange];
    }
  }

  if (locationType == 'rural') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes <= 45).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, unselectedColor, unselectedColor, Colors.red];
    }
  }

  if (locationType == 'remote') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes > 60).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, Colors.orange];
    }
  }
  return grades;
}

List<String>? listOfJsonToListOfString(List<LocationStruct>? latlong) {
  // conver this list of lat long into list of string with pipe seperator as seperator
  if (latlong == null) return null;
  List<String> result = [];
  for (var location in latlong) {
    result.add('${location.latitude}');
    result.add('${location.longitude}');
  }
  return result.join('|').split('|');
}

List<Color> generateGrades(
  List<String>? list1,
  List<String>? list2,
  Color unselectedColor,
  String locationType,
) {
  List<Color>? grades = [
    unselectedColor,
    Colors.orange,
  ];

  List<int> minutesList = [];
  if (list1 == null && list2 == null) {
    return [unselectedColor, Colors.orange];
  }
  List<String> times = [];

  for (String list in list1 ?? []) {
    times.add(list);
  }

  for (String list in list2 ?? []) {
    times.add(list);
  }

  for (String timeString in times) {
    List<String> parts = timeString.split(' ');
    int minutes = 0;

    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == 'hour' || parts[i] == 'hours') {
        int hours = int.parse(parts[i - 1]);
        minutes += hours * 60;
      } else if (parts[i] == 'minute' ||
          parts[i] == 'minutes' ||
          parts[i] == 'min' ||
          parts[i] == 'mins') {
        int mins = int.parse(parts[i - 1]);
        minutes += mins;
      }
    }

    minutesList.add(minutes);
  }
  int totalCounts = minutesList.length;
  if (locationType == 'urban') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes <= 15).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [
        unselectedColor,
        Colors.orange,
      ];
    }
  }

  if (locationType == 'suburban') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes <= 30).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, Colors.orange];
    }
  }

  if (locationType == 'rural') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes <= 45).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, Colors.orange];
    }
  }

  if (locationType == 'remote') {
    int countLessThanFifteen =
        minutesList.where((minutes) => minutes > 45).length;
    double percentage1 = (countLessThanFifteen / totalCounts) * 100;
    if (percentage1 >= 70) {
      grades = [
        Colors.green,
        unselectedColor,
      ];
    } else {
      grades = [unselectedColor, Colors.orange];
    }
  }

  return grades;
}

List<Color>? generateResults(
  List<Color>? convenience,
  List<Color>? safety,
  List<Color>? qualityOfLife,
  Color nonSelectedColor,
) {
  List<int> points = [];

  List<Color> finalColor = [nonSelectedColor, Colors.orange];

  if (convenience == null && safety == null && qualityOfLife == null) {
    return [nonSelectedColor, Colors.orange];
  }

  if (convenience != null) {
    if (convenience.contains(Colors.green)) {
      points.add(1);
    }

    if (convenience.contains(Colors.orange)) {
      points.add(2);
    }
  }

  if (safety != null) {
    if (safety.contains(Colors.green)) {
      points.add(1);
    }

    if (safety.contains(Colors.orange)) {
      points.add(2);
    }
  }

  if (qualityOfLife != null) {
    if (qualityOfLife.contains(Colors.green)) {
      points.add(1);
    }

    if (qualityOfLife.contains(Colors.orange)) {
      points.add(2);
    }
  }
  int totalPoints = 0;

  for (int point in points) {
    totalPoints += point;
  }
  int averagePoint = (totalPoints / 3).round();
  if (averagePoint == 1) {
    finalColor = [
      Colors.green,
      nonSelectedColor,
    ];
  }
  if (averagePoint == 2) {
    finalColor = [
      nonSelectedColor,
      Colors.orange,
    ];
  }

  return finalColor;
}

List<AddressAndDurationStruct> addressesAndDurations(
  List<String>? listofPlaces,
  List<String>? listOfDurations,
) {
  // add place and duration one by one in data type address and Duration
  if (listofPlaces == null || listOfDurations == null) {
    return [];
  }

  if (listofPlaces.length != listOfDurations.length) {
    return [];
  }

  final List<AddressAndDurationStruct> result = [];

  for (int i = 0; i < listofPlaces.length; i++) {
    final String place = listofPlaces[i];
    final String duration = listOfDurations[i];

    final AddressAndDurationStruct addressAndDuration =
        AddressAndDurationStruct(
      name: place,
      travelDuration: duration,
    );

    result.add(addressAndDuration);
  }

  return result;
}

List<String> generateCustomList(List<String>? prioritizedList) {
  List<String> newList = [];
  if (prioritizedList == null || prioritizedList.isEmpty) {
    return [];
  }
  for (String item in prioritizedList) {
    if (item == 'Good Schools') {
      newList.add('school');
    }
    if (item == 'Shopping & Retail') {
      newList.add('shopping_mall');
    }
    if (item == 'Dining & Restaurants') {
      newList.add('restaurant');
    }
    if (item == 'Parks & Recreation') {
      newList.add('park');
    }
    if (item == 'Entertainment & Cultural Venues') {
      newList.add('cultural_center');
    }
    if (item == 'Safety') {
      newList.add('police');
    }
    if (item == 'Public Transportation') {
      newList.add('bus_stop');
    }
    if (item == 'Healthcare Facilities') {
      newList.add('hospital');
    }
    if (item == 'Community Vibe') {
      newList.add('lodging');
    }
    if (item == 'Proximity to Work') {
      newList.add('farm');
    }
  }
  return newList;
}

String? generateSingleDoubleFromList(List<double>? listProvided) {
  // convert list double into single but seperate list items with comma
  if (listProvided == null || listProvided.isEmpty) {
    return null;
  }

  return listProvided.join(',');
}

List<int> getClosestPlacesIndex(List<String>? durationsList) {
  List<int> minutesList = [];
  List<String> times = [];

  for (String list in durationsList ?? []) {
    times.add(list);
  }

  for (String timeString in times) {
    List<String> parts = timeString.split(' ');
    int minutes = 0;

    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == 'hour' || parts[i] == 'hours') {
        int hours = int.parse(parts[i - 1]);
        minutes += hours * 60;
      } else if (parts[i] == 'minute' ||
          parts[i] == 'minutes' ||
          parts[i] == 'min' ||
          parts[i] == 'mins') {
        int mins = int.parse(parts[i - 1]);
        minutes += mins;
      }
    }

    minutesList.add(minutes);
  }

  // Create a list of indexes paired with the numbers
  List<MapEntry<int, int>> indexedNumbers =
      minutesList.asMap().entries.toList();

  // Sort the indexed numbers in descending order based on their values
  indexedNumbers.sort((a, b) => a.value.compareTo(b.value));

  // Get the indexes of the top 3 largest numbers
  List<int> topThreeIndexes =
      indexedNumbers.take(3).map((entry) => entry.key).toList();

  // Print the result
  print(topThreeIndexes); // Output: [5, 2, 4]

  return topThreeIndexes;

  // List<int> arrangedIndexes = [];
  // for (int i = 0; i < minutesList.length; i++) {
  //   int onevalue = minutesList[i]
  // }
}

List<ClosestPlacesStruct> closestPlaces(
  List<int>? listOfIndexes,
  List<String>? listOfPlaces,
  List<String>? listOfDurations,
) {
  // i want to get places and durations at indexes of listofIndexes and add them to closestPlaces
  if (listOfIndexes == null ||
      listOfPlaces == null ||
      listOfDurations == null) {
    return [];
  }

  List<ClosestPlacesStruct> closestPlaces = [];

  for (int index in listOfIndexes) {
    // if (index < 0 ||
    //     index >= listOfPlaces.length ||
    //     index >= listOfDurations.length) {
    //   continue;
    // }

    String place = listOfPlaces[index];
    String duration = listOfDurations[index];

    closestPlaces.add(ClosestPlacesStruct(place: place, duration: duration));
  }

  return closestPlaces;
}

String generateSingleStringFromList(List<String>? listProvided) {
  // join all list itmes into single strings with comma seperator between provided list items
  if (listProvided == null || listProvided.isEmpty) {
    return '';
  }

  return listProvided.join(',');
}
