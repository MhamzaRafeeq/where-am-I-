import '/backend/api_requests/api_calls.dart';
import '/components/desktop_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  Local state fields for this page.

  bool pageLoaded = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for desktopSideBar component.
  late DesktopSideBarModel desktopSideBarModel;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchNearby)] action in TextField widget.
  ApiCallResponse? apiSuperMarkets;
  // Stores action output result for [Backend Call - API (searchNearby)] action in TextField widget.
  ApiCallResponse? apiShopping;
  // Stores action output result for [Backend Call - API (searchNearby)] action in TextField widget.
  ApiCallResponse? apiHealth;
  // Stores action output result for [Backend Call - API (searchNearby)] action in TextField widget.
  ApiCallResponse? apiSchool;
  // Stores action output result for [Backend Call - API (searchNearby)] action in TextField widget.
  ApiCallResponse? apiQualityOfLife;
  // Stores action output result for [Backend Call - API (getDistanceAndTime)] action in TextField widget.
  ApiCallResponse? apisuperMarketDistance;
  // Stores action output result for [Backend Call - API (getDistanceAndTime)] action in TextField widget.
  ApiCallResponse? apisuperShoppingDistance;
  // Stores action output result for [Backend Call - API (getDistanceAndTime)] action in TextField widget.
  ApiCallResponse? apiHealthDistance;
  // Stores action output result for [Backend Call - API (getDistanceAndTime)] action in TextField widget.
  ApiCallResponse? apiSchoolDistance;
  // Stores action output result for [Backend Call - API (getDistanceAndTime)] action in TextField widget.
  ApiCallResponse? apiQualityDistance;

  @override
  void initState(BuildContext context) {
    desktopSideBarModel = createModel(context, () => DesktopSideBarModel());
  }

  @override
  void dispose() {
    desktopSideBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
