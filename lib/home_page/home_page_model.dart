import '/backend/schema/structs/index.dart';
import '/components/desktop_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool pageLoaded = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for desktopSideBar component.
  late DesktopSideBarModel desktopSideBarModel;
  // Stores action output result for [Action Block - generateReportActions] action in PlacePicker widget.
  List<SearchNearbyResultsStruct>? block;

  @override
  void initState(BuildContext context) {
    desktopSideBarModel = createModel(context, () => DesktopSideBarModel());
  }

  @override
  void dispose() {
    desktopSideBarModel.dispose();
  }
}
