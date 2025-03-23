import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'custome_report_page_widget.dart' show CustomeReportPageWidget;
import 'package:flutter/material.dart';

class CustomeReportPageModel extends FlutterFlowModel<CustomeReportPageWidget> {
  ///  Local state fields for this page.

  int iLoop = 0;

  List<PlacesStruct> listOfPlacesApi = [];
  void addToListOfPlacesApi(PlacesStruct item) => listOfPlacesApi.add(item);
  void removeFromListOfPlacesApi(PlacesStruct item) =>
      listOfPlacesApi.remove(item);
  void removeAtIndexFromListOfPlacesApi(int index) =>
      listOfPlacesApi.removeAt(index);
  void insertAtIndexInListOfPlacesApi(int index, PlacesStruct item) =>
      listOfPlacesApi.insert(index, item);
  void updateListOfPlacesApiAtIndex(
          int index, Function(PlacesStruct) updateFn) =>
      listOfPlacesApi[index] = updateFn(listOfPlacesApi[index]);

  List<ListOfDistanceAndDurationsStruct> listOfDistanceAndApiDurations = [];
  void addToListOfDistanceAndApiDurations(
          ListOfDistanceAndDurationsStruct item) =>
      listOfDistanceAndApiDurations.add(item);
  void removeFromListOfDistanceAndApiDurations(
          ListOfDistanceAndDurationsStruct item) =>
      listOfDistanceAndApiDurations.remove(item);
  void removeAtIndexFromListOfDistanceAndApiDurations(int index) =>
      listOfDistanceAndApiDurations.removeAt(index);
  void insertAtIndexInListOfDistanceAndApiDurations(
          int index, ListOfDistanceAndDurationsStruct item) =>
      listOfDistanceAndApiDurations.insert(index, item);
  void updateListOfDistanceAndApiDurationsAtIndex(
          int index, Function(ListOfDistanceAndDurationsStruct) updateFn) =>
      listOfDistanceAndApiDurations[index] =
          updateFn(listOfDistanceAndApiDurations[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (searchNearby)] action in customeReportPage widget.
  ApiCallResponse? apiResult1gz;
  // Stores action output result for [Backend Call - API (getDistanceAndTime)] action in customeReportPage widget.
  ApiCallResponse? apiResultgl6;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
