import '/components/create_account_o_n_report_page_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'report_page_widget.dart' show ReportPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ReportPageModel extends FlutterFlowModel<ReportPageWidget> {
  ///  Local state fields for this page.

  String? dynamicLInk = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Model for CreateAccountONReportPage component.
  late CreateAccountONReportPageModel createAccountONReportPageModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for CreateAccountONReportPage component.
  late CreateAccountONReportPageModel createAccountONReportPageModel2;
  // Stores action output result for [Custom Action - generateMapImage] action in Icon widget.
  FFUploadedFile? image3;
  // Stores action output result for [Custom Action - generateMapImage] action in Icon widget.
  FFUploadedFile? image4;
  // Stores action output result for [Custom Action - createDynamicLink] action in Icon widget.
  String? link;
  // Stores action output result for [Custom Action - generateMapImage] action in Column widget.
  FFUploadedFile? image2;

  @override
  void initState(BuildContext context) {
    createAccountONReportPageModel1 =
        createModel(context, () => CreateAccountONReportPageModel());
    createAccountONReportPageModel2 =
        createModel(context, () => CreateAccountONReportPageModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    createAccountONReportPageModel1.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    expandableExpandableController6.dispose();
    createAccountONReportPageModel2.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
