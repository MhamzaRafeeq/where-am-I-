import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _locationType = prefs.getString('ff_locationType') ?? _locationType;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _locationPriorities = [
    'Proximity to Work',
    'Good Schools',
    'Shopping & Retail',
    'Dining & Restaurants',
    'Public Transportation',
    'Parks & Recreation',
    'Healthcare Facilities',
    'Entertainment & Cultural Venues',
    'Safety',
    'Community Vibe'
  ];
  List<String> get locationPriorities => _locationPriorities;
  set locationPriorities(List<String> value) {
    _locationPriorities = value;
  }

  void addToLocationPriorities(String value) {
    locationPriorities.add(value);
  }

  void removeFromLocationPriorities(String value) {
    locationPriorities.remove(value);
  }

  void removeAtIndexFromLocationPriorities(int index) {
    locationPriorities.removeAt(index);
  }

  void updateLocationPrioritiesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    locationPriorities[index] = updateFn(_locationPriorities[index]);
  }

  void insertAtIndexInLocationPriorities(int index, String value) {
    locationPriorities.insert(index, value);
  }

  List<String> _prioriteisSelected = [];
  List<String> get prioriteisSelected => _prioriteisSelected;
  set prioriteisSelected(List<String> value) {
    _prioriteisSelected = value;
  }

  void addToPrioriteisSelected(String value) {
    prioriteisSelected.add(value);
  }

  void removeFromPrioriteisSelected(String value) {
    prioriteisSelected.remove(value);
  }

  void removeAtIndexFromPrioriteisSelected(int index) {
    prioriteisSelected.removeAt(index);
  }

  void updatePrioriteisSelectedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    prioriteisSelected[index] = updateFn(_prioriteisSelected[index]);
  }

  void insertAtIndexInPrioriteisSelected(int index, String value) {
    prioriteisSelected.insert(index, value);
  }

  List<String> _diningOptions = [
    'Casual',
    '  Fine Dining',
    ' Fast Food',
    'Coffee Shops',
    ' Diverse Cuisines',
    'Specific Cuisine'
  ];
  List<String> get diningOptions => _diningOptions;
  set diningOptions(List<String> value) {
    _diningOptions = value;
  }

  void addToDiningOptions(String value) {
    diningOptions.add(value);
  }

  void removeFromDiningOptions(String value) {
    diningOptions.remove(value);
  }

  void removeAtIndexFromDiningOptions(int index) {
    diningOptions.removeAt(index);
  }

  void updateDiningOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    diningOptions[index] = updateFn(_diningOptions[index]);
  }

  void insertAtIndexInDiningOptions(int index, String value) {
    diningOptions.insert(index, value);
  }

  List<String> _diningOptionsSelected = [];
  List<String> get diningOptionsSelected => _diningOptionsSelected;
  set diningOptionsSelected(List<String> value) {
    _diningOptionsSelected = value;
  }

  void addToDiningOptionsSelected(String value) {
    diningOptionsSelected.add(value);
  }

  void removeFromDiningOptionsSelected(String value) {
    diningOptionsSelected.remove(value);
  }

  void removeAtIndexFromDiningOptionsSelected(int index) {
    diningOptionsSelected.removeAt(index);
  }

  void updateDiningOptionsSelectedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    diningOptionsSelected[index] = updateFn(_diningOptionsSelected[index]);
  }

  void insertAtIndexInDiningOptionsSelected(int index, String value) {
    diningOptionsSelected.insert(index, value);
  }

  List<String> _entertainmentOptions = [
    ' Theaters',
    ' Museums',
    'Live Music',
    ' Sports',
    'Cultural Events',
    ' Nightlife'
  ];
  List<String> get entertainmentOptions => _entertainmentOptions;
  set entertainmentOptions(List<String> value) {
    _entertainmentOptions = value;
  }

  void addToEntertainmentOptions(String value) {
    entertainmentOptions.add(value);
  }

  void removeFromEntertainmentOptions(String value) {
    entertainmentOptions.remove(value);
  }

  void removeAtIndexFromEntertainmentOptions(int index) {
    entertainmentOptions.removeAt(index);
  }

  void updateEntertainmentOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    entertainmentOptions[index] = updateFn(_entertainmentOptions[index]);
  }

  void insertAtIndexInEntertainmentOptions(int index, String value) {
    entertainmentOptions.insert(index, value);
  }

  List<String> _entertainmentOptionsSelected = [];
  List<String> get entertainmentOptionsSelected =>
      _entertainmentOptionsSelected;
  set entertainmentOptionsSelected(List<String> value) {
    _entertainmentOptionsSelected = value;
  }

  void addToEntertainmentOptionsSelected(String value) {
    entertainmentOptionsSelected.add(value);
  }

  void removeFromEntertainmentOptionsSelected(String value) {
    entertainmentOptionsSelected.remove(value);
  }

  void removeAtIndexFromEntertainmentOptionsSelected(int index) {
    entertainmentOptionsSelected.removeAt(index);
  }

  void updateEntertainmentOptionsSelectedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    entertainmentOptionsSelected[index] =
        updateFn(_entertainmentOptionsSelected[index]);
  }

  void insertAtIndexInEntertainmentOptionsSelected(int index, String value) {
    entertainmentOptionsSelected.insert(index, value);
  }

  String _locationType = '';
  String get locationType => _locationType;
  set locationType(String value) {
    _locationType = value;
    prefs.setString('ff_locationType', value);
  }

  bool _userFirstTime = true;
  bool get userFirstTime => _userFirstTime;
  set userFirstTime(bool value) {
    _userFirstTime = value;
  }

  String _homePageLocation = '';
  String get homePageLocation => _homePageLocation;
  set homePageLocation(String value) {
    _homePageLocation = value;
  }

  LatLng? _locationFromAddress = LatLng(34.0151366, 71.5249154);
  LatLng? get locationFromAddress => _locationFromAddress;
  set locationFromAddress(LatLng? value) {
    _locationFromAddress = value;
  }

  List<SearchNearbyResultsStruct> _ListSearchApiResults = [];
  List<SearchNearbyResultsStruct> get ListSearchApiResults =>
      _ListSearchApiResults;
  set ListSearchApiResults(List<SearchNearbyResultsStruct> value) {
    _ListSearchApiResults = value;
  }

  void addToListSearchApiResults(SearchNearbyResultsStruct value) {
    ListSearchApiResults.add(value);
  }

  void removeFromListSearchApiResults(SearchNearbyResultsStruct value) {
    ListSearchApiResults.remove(value);
  }

  void removeAtIndexFromListSearchApiResults(int index) {
    ListSearchApiResults.removeAt(index);
  }

  void updateListSearchApiResultsAtIndex(
    int index,
    SearchNearbyResultsStruct Function(SearchNearbyResultsStruct) updateFn,
  ) {
    ListSearchApiResults[index] = updateFn(_ListSearchApiResults[index]);
  }

  void insertAtIndexInListSearchApiResults(
      int index, SearchNearbyResultsStruct value) {
    ListSearchApiResults.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
