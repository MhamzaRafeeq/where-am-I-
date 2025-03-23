import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'survey_widget.dart' show SurveyWidget;
import 'package:flutter/material.dart';

class SurveyModel extends FlutterFlowModel<SurveyWidget> {
  ///  Local state fields for this page.

  int entertainmentIndex = 0;

  int prioritiesIndex = 0;

  int diningIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for LookingFor widget.
  FormFieldController<String>? lookingForValueController;
  // State field(s) for Budgetmin widget.
  String? budgetminValue1;
  FormFieldController<String>? budgetminValueController1;
  // State field(s) for Budgetmax widget.
  String? budgetmaxValue1;
  FormFieldController<String>? budgetmaxValueController1;
  // State field(s) for Budgetmin widget.
  String? budgetminValue2;
  FormFieldController<String>? budgetminValueController2;
  // State field(s) for Budgetmax widget.
  String? budgetmaxValue2;
  FormFieldController<String>? budgetmaxValueController2;
  // State field(s) for Timeline widget.
  FormFieldController<String>? timelineValueController;
  // State field(s) for numberOfAdults widget.
  int? numberOfAdultsValue;
  // State field(s) for numberOfChildren widget.
  int? numberOfChildrenValue;
  // State field(s) for dogs widget.
  FormFieldController<String>? dogsValueController;
  // State field(s) for LookingForProfessionals widget.
  FormFieldController<List<String>>? lookingForProfessionalsValueController;
  List<String>? get lookingForProfessionalsValues =>
      lookingForProfessionalsValueController?.value;
  set lookingForProfessionalsValues(List<String>? v) =>
      lookingForProfessionalsValueController?.value = v;

  // State field(s) for LookingForInNewHome widget.
  FormFieldController<List<String>>? lookingForInNewHomeValueController;
  List<String>? get lookingForInNewHomeValues =>
      lookingForInNewHomeValueController?.value;
  set lookingForInNewHomeValues(List<String>? v) =>
      lookingForInNewHomeValueController?.value = v;

  // State field(s) for currentAddress widget.
  FFPlace currentAddressValue1 = FFPlace();
  // State field(s) for currentAddress widget.
  FFPlace currentAddressValue2 = FFPlace();
  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for Slider widget.
  double? sliderValue3;
  // State field(s) for Amenities widget.
  FormFieldController<List<String>>? amenitiesValueController;
  List<String>? get amenitiesValues => amenitiesValueController?.value;
  set amenitiesValues(List<String>? v) => amenitiesValueController?.value = v;

  // State field(s) for NeighbhourhoodType widget.
  FormFieldController<String>? neighbhourhoodTypeValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SurveysRecord? reportCreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get lookingForValue => lookingForValueController?.value;
  String? get timelineValue => timelineValueController?.value;
  String? get dogsValue => dogsValueController?.value;
  String? get neighbhourhoodTypeValue =>
      neighbhourhoodTypeValueController?.value;
}
