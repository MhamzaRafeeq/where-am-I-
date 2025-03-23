import '';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'survey_model.dart';
export 'survey_model.dart';

/// for Asking different questions from users
class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  static String routeName = 'Survey';
  static String routePath = '/survey';

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  late SurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: PageView(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 570.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 1',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            ' Are you looking to rent or own?',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: FlutterFlowRadioButton(
                                                  options:
                                                      ['Rent', 'Own'].toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() {}),
                                                  controller: _model
                                                          .lookingForValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  optionHeight: 32.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.horizontal,
                                                  radioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                  inactiveRadioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.spaceEvenly,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (_model.lookingForValue == 'Own')
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' What\'s your budget range for own home?',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .budgetminValueController1 ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.budgetminValue1 ??=
                                                        'No min',
                                                  ),
                                                  options: [
                                                    'No min',
                                                    '\$50k',
                                                    '\$100k',
                                                    '\$150k',
                                                    '\$175k',
                                                    '\$200k',
                                                    '\$225k',
                                                    '\$250k',
                                                    '\$275k',
                                                    '\$300k',
                                                    '\$325k',
                                                    '\$350k',
                                                    '\$375k',
                                                    '\$400k',
                                                    '\$425k',
                                                    '\$450k',
                                                    '\$500k',
                                                    '\$525k',
                                                    '\$550k',
                                                    '\$575k',
                                                    '\$600k',
                                                    '\$625k',
                                                    '\$650k',
                                                    '\$675k',
                                                    '\$700k',
                                                    '\$725k',
                                                    '\$750k',
                                                    '\$800k',
                                                    '\$825k',
                                                    '\$850k',
                                                    '\$875kk',
                                                    '\$900k',
                                                    '\$925k',
                                                    '\$950k',
                                                    '\$975k',
                                                    '\$1M',
                                                    '\$1.5M',
                                                    '\$2M',
                                                    '\$2.5M',
                                                    '\$3M',
                                                    '\$3.5M',
                                                    '\$4M',
                                                    '\$4.5M',
                                                    '\$5M'
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .budgetminValue1 =
                                                          val),
                                                  width: 250.0,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .budgetmaxValueController1 ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.budgetmaxValue1 ??=
                                                        'No max',
                                                  ),
                                                  options: [
                                                    '\$50k',
                                                    '\$100k',
                                                    '\$150k',
                                                    '\$175k',
                                                    '\$200k',
                                                    '\$225k',
                                                    '\$250k',
                                                    '\$275k',
                                                    '\$300k',
                                                    '\$325k',
                                                    '\$350k',
                                                    '\$375k',
                                                    '\$400k',
                                                    '\$425k',
                                                    '\$450k',
                                                    '\$500k',
                                                    '\$525k',
                                                    '\$550k',
                                                    '\$575k',
                                                    '\$600k',
                                                    '\$625k',
                                                    '\$650k',
                                                    '\$675k',
                                                    '\$700k',
                                                    '\$725k',
                                                    '\$750k',
                                                    '\$800k',
                                                    '\$825k',
                                                    '\$850k',
                                                    '\$875kk',
                                                    '\$900k',
                                                    '\$925k',
                                                    '\$950k',
                                                    '\$975k',
                                                    '\$1M',
                                                    '\$1.5M',
                                                    '\$2M',
                                                    '\$2.5M',
                                                    '\$3M',
                                                    '\$3.5M',
                                                    '\$4M',
                                                    '\$4.5M',
                                                    '\$5M',
                                                    'No max'
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .budgetmaxValue1 =
                                                          val),
                                                  width: 250.0,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          if (_model.lookingForValue == 'Rent')
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' What\'s your budget range for rent?',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .budgetminValueController2 ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.budgetminValue2 ??=
                                                        'No min',
                                                  ),
                                                  options: [
                                                    'No min',
                                                    '\$500',
                                                    '\$1000',
                                                    '\$1500',
                                                    '\$1750',
                                                    '\$2000',
                                                    '\$2250',
                                                    '\$2500',
                                                    '\$2750',
                                                    '\$3000',
                                                    '\$3250',
                                                    '\$3500',
                                                    '\$3750',
                                                    '\$4000',
                                                    '\$4250',
                                                    '\$4500',
                                                    '\$5000'
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .budgetminValue2 =
                                                          val),
                                                  width: 250.0,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .budgetmaxValueController2 ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.budgetmaxValue2 ??=
                                                        'No max',
                                                  ),
                                                  options: [
                                                    '\$500',
                                                    '\$1000',
                                                    '\$1750',
                                                    '\$2000',
                                                    '\$2250',
                                                    '\$2500',
                                                    '\$2750',
                                                    '\$3000',
                                                    '\$3250',
                                                    '\$3500',
                                                    '\$3750',
                                                    '\$4000',
                                                    '\$4250',
                                                    '\$4500',
                                                    '\$5000',
                                                    'No max'
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .budgetmaxValue2 =
                                                          val),
                                                  width: 250.0,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 2',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'What\'s your timeline to move?',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowRadioButton(
                                                options: [
                                                  'Immediately (1-3 months)',
                                                  'Soon (4-6 Months)',
                                                  'Browsing (6+ months)'
                                                ].toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() {}),
                                                controller: _model
                                                        .timelineValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                optionHeight: 32.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                selectedTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.vertical,
                                                radioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                inactiveRadioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.start,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              'Question 3',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'Tell us your household size',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Adults',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child:
                                                    FlutterFlowCountController(
                                                  decrementIconBuilder:
                                                      (enabled) => Icon(
                                                    Icons.remove_rounded,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 20.0,
                                                  ),
                                                  incrementIconBuilder:
                                                      (enabled) => Icon(
                                                    Icons.add_rounded,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .success
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 20.0,
                                                  ),
                                                  countBuilder: (count) => Text(
                                                    count.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  count: _model
                                                      .numberOfAdultsValue ??= 0,
                                                  updateCount: (count) =>
                                                      safeSetState(() => _model
                                                              .numberOfAdultsValue =
                                                          count),
                                                  stepSize: 1,
                                                  minimum: 0,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              12.0, 0.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Children',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child:
                                                    FlutterFlowCountController(
                                                  decrementIconBuilder:
                                                      (enabled) => Icon(
                                                    Icons.remove_rounded,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 20.0,
                                                  ),
                                                  incrementIconBuilder:
                                                      (enabled) => Icon(
                                                    Icons.add_rounded,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .success
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 20.0,
                                                  ),
                                                  countBuilder: (count) => Text(
                                                    count.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  count: _model
                                                      .numberOfChildrenValue ??= 0,
                                                  updateCount: (count) =>
                                                      safeSetState(() => _model
                                                              .numberOfChildrenValue =
                                                          count),
                                                  stepSize: 1,
                                                  minimum: 0,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              12.0, 0.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Dogs?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowRadioButton(
                                                options: ['Yes', 'No'].toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() {}),
                                                controller: _model
                                                        .dogsValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                optionHeight: 32.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                selectedTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.horizontal,
                                                radioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                inactiveRadioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.start,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ].divide(SizedBox(width: 25.0)),
                                          ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              'Question 4',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'Please connect me with the following professionals:',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          FlutterFlowCheckboxGroup(
                                            options: [
                                              'Real Estate Agents',
                                              'Mortgage brokers',
                                              'Handymen',
                                              'Movers',
                                              'Packers',
                                              'Plumbers',
                                              'Painters',
                                              'Electricians',
                                              'Landscapers',
                                              'Cleaners',
                                              'Title Companies',
                                              'Utility Companies',
                                              'Water Purification Experts',
                                              'Home Inspectors'
                                            ],
                                            onChanged: (val) => safeSetState(() =>
                                                _model.lookingForProfessionalsValues =
                                                    val),
                                            controller: _model
                                                    .lookingForProfessionalsValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [],
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            checkboxBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      letterSpacing: 0.0,
                                                    ),
                                            checkboxBorderRadius:
                                                BorderRadius.circular(4.0),
                                            initialized: _model
                                                    .lookingForProfessionalsValues !=
                                                null,
                                          ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 20.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text: 'Next',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 570.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 5.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'What are you looking for in your new home? Click all that apply:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          FlutterFlowCheckboxGroup(
                                            options: [
                                              'More Bedrooms',
                                              'More Baths',
                                              'More Square Footage',
                                              'Less Square Footage',
                                              'Closer to Schools',
                                              'Shorter Commute to Work'
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .lookingForInNewHomeValues =
                                                  val);
                                              safeSetState(() {});
                                            },
                                            controller: _model
                                                    .lookingForInNewHomeValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [],
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            checkboxBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      letterSpacing: 0.0,
                                                    ),
                                            checkboxBorderRadius:
                                                BorderRadius.circular(4.0),
                                            initialized: _model
                                                    .lookingForInNewHomeValues !=
                                                null,
                                          ),
                                          if (_model.lookingForInNewHomeValues
                                                      ?.where((e) =>
                                                          e ==
                                                          'Shorter Commute to Work')
                                                      .toList() !=
                                                  null &&
                                              (_model.lookingForInNewHomeValues
                                                      ?.where((e) =>
                                                          e ==
                                                          'Shorter Commute to Work')
                                                      .toList())!
                                                  .isNotEmpty)
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  constraints: BoxConstraints(
                                                    minHeight: 40.0,
                                                    maxWidth: 300.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .currentAddressValue2
                                                            .address,
                                                        'Current Home Address',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowPlacePicker(
                                                  iOSGoogleMapsApiKey:
                                                      'AIzaSyDnhKWlooPoEpOTtFPUm1V0opynFKclyFA',
                                                  androidGoogleMapsApiKey:
                                                      'AIzaSyAUiTJnq3Tme_Op3bVWyVyAf8VwANRC4QY',
                                                  webGoogleMapsApiKey:
                                                      'AIzaSyAfq-rekYBmMog4QjF6Q_pjEjpTRT51SKQ',
                                                  onSelect: (place) async {
                                                    safeSetState(() => _model
                                                            .currentAddressValue1 =
                                                        place);
                                                  },
                                                  defaultText: '',
                                                  buttonOptions:
                                                      FFButtonOptions(
                                                    width: 300.0,
                                                    height: 40.0,
                                                    color: Color(0x003A81FF),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0x00FFFFFF),
                                                          fontSize: 0.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (_model.lookingForInNewHomeValues
                                                      ?.where((e) =>
                                                          e ==
                                                          'Shorter Commute to Work')
                                                      .toList() !=
                                                  null &&
                                              (_model.lookingForInNewHomeValues
                                                      ?.where((e) =>
                                                          e ==
                                                          'Shorter Commute to Work')
                                                      .toList())!
                                                  .isNotEmpty)
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  constraints: BoxConstraints(
                                                    minHeight: 40.0,
                                                    maxWidth: 300.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .currentAddressValue2
                                                            .address,
                                                        'Work Address...',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowPlacePicker(
                                                  iOSGoogleMapsApiKey:
                                                      'AIzaSyDnhKWlooPoEpOTtFPUm1V0opynFKclyFA',
                                                  androidGoogleMapsApiKey:
                                                      'AIzaSyAUiTJnq3Tme_Op3bVWyVyAf8VwANRC4QY',
                                                  webGoogleMapsApiKey:
                                                      'AIzaSyAfq-rekYBmMog4QjF6Q_pjEjpTRT51SKQ',
                                                  onSelect: (place) async {
                                                    safeSetState(() => _model
                                                            .currentAddressValue2 =
                                                        place);
                                                  },
                                                  defaultText: '',
                                                  buttonOptions:
                                                      FFButtonOptions(
                                                    width: 300.0,
                                                    height: 40.0,
                                                    color: Color(0x003A81FF),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0x00FFFFFF),
                                                          fontSize: 0.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Please rate your current address on:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'A. Convenience:\nI can easily access most of the places I regularly need to get to in a short time: Public transportation, grocery stores, cafes, casual dining, parks, banks & ATMS, post office, other',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '1',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Container(
                                                width: 300.0,
                                                child: Slider(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                  inactiveColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  min: 1.0,
                                                  max: 5.0,
                                                  value: _model
                                                      .sliderValue1 ??= 3.0,
                                                  divisions: 4,
                                                  onChanged: (newValue) {
                                                    safeSetState(() =>
                                                        _model.sliderValue1 =
                                                            newValue);
                                                  },
                                                ),
                                              ),
                                              Text(
                                                '5',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'B. Health & Safety: \nI have access to the right mix of businesses that help me feel secure: schools, emergency services, hospitals, low crime, Other____\n',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '1',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Container(
                                                width: 300.0,
                                                child: Slider(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                  inactiveColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  min: 1.0,
                                                  max: 5.0,
                                                  value: _model
                                                      .sliderValue2 ??= 3.0,
                                                  divisions: 4,
                                                  onChanged: (newValue) {
                                                    safeSetState(() =>
                                                        _model.sliderValue2 =
                                                            newValue);
                                                  },
                                                ),
                                              ),
                                              Text(
                                                '5',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'C. Quality of life: \nI can easily access most of the places that improve my sense of happiness.  Libraries, museums, theaters, movies, fine dining, cultural experiences,  festivals, and music venues.\n',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '1',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Container(
                                                width: 300.0,
                                                child: Slider(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                  inactiveColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  min: 1.0,
                                                  max: 5.0,
                                                  value: _model
                                                      .sliderValue3 ??= 3.0,
                                                  divisions: 4,
                                                  onChanged: (newValue) {
                                                    safeSetState(() =>
                                                        _model.sliderValue3 =
                                                            newValue);
                                                  },
                                                ),
                                              ),
                                              Text(
                                                '5',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 6.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'Please rank these ten amenities in order of importance to you',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          FlutterFlowCheckboxGroup(
                                            options: functions
                                                .arrangedList(
                                                    FFAppState()
                                                        .locationPriorities
                                                        .toList(),
                                                    FFAppState()
                                                        .prioriteisSelected
                                                        .toList())
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.amenitiesValues = val);
                                              FFAppState().prioriteisSelected =
                                                  _model.amenitiesValues!
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                            },
                                            controller: _model
                                                    .amenitiesValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [],
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            checkboxBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      letterSpacing: 0.0,
                                                    ),
                                            checkboxBorderRadius:
                                                BorderRadius.circular(4.0),
                                            initialized:
                                                _model.amenitiesValues != null,
                                          ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 7.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'Please select your ideal type of neighborhood: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowRadioButton(
                                                options: [
                                                  'Urban',
                                                  'Suburban',
                                                  'Rural',
                                                  'Remote'
                                                ].toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() {}),
                                                controller: _model
                                                        .neighbhourhoodTypeValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                optionHeight: 32.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                selectedTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.vertical,
                                                radioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                inactiveRadioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.start,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 20.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var surveysRecordReference =
                                              SurveysRecord.collection.doc();
                                          await surveysRecordReference.set({
                                            ...createSurveysRecordData(
                                              lookingFor:
                                                  _model.lookingForValue,
                                              householdSize:
                                                  updateHouseholdSizeStruct(
                                                HouseholdSizeStruct(
                                                  adults: _model
                                                      .numberOfAdultsValue,
                                                  children: _model
                                                      .numberOfChildrenValue,
                                                  dogs: _model.dogsValue,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              currentAddress: _model
                                                  .currentAddressValue2.address,
                                              idealNeighbourhood: _model
                                                  .neighbhourhoodTypeValue,
                                              timeline: _model.timelineValue,
                                              budget: updateBudgetStruct(
                                                BudgetStruct(
                                                  minimum: _model.budgetminValue1 !=
                                                              null &&
                                                          _model.budgetminValue1 !=
                                                              ''
                                                      ? _model.budgetminValue1
                                                      : _model.budgetminValue2,
                                                  maximum: _model.budgetmaxValue1 !=
                                                              null &&
                                                          _model.budgetmaxValue1 !=
                                                              ''
                                                      ? _model.budgetmaxValue1
                                                      : _model.budgetmaxValue2,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'wantedProfessionals': _model
                                                    .lookingForProfessionalsValues,
                                                'thingsWantedInNewHome': _model
                                                    .lookingForInNewHomeValues,
                                                'importantameneties':
                                                    _model.amenitiesValues,
                                              },
                                            ),
                                          });
                                          _model.reportCreated = SurveysRecord
                                              .getDocumentFromData({
                                            ...createSurveysRecordData(
                                              lookingFor:
                                                  _model.lookingForValue,
                                              householdSize:
                                                  updateHouseholdSizeStruct(
                                                HouseholdSizeStruct(
                                                  adults: _model
                                                      .numberOfAdultsValue,
                                                  children: _model
                                                      .numberOfChildrenValue,
                                                  dogs: _model.dogsValue,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              currentAddress: _model
                                                  .currentAddressValue2.address,
                                              idealNeighbourhood: _model
                                                  .neighbhourhoodTypeValue,
                                              timeline: _model.timelineValue,
                                              budget: updateBudgetStruct(
                                                BudgetStruct(
                                                  minimum: _model.budgetminValue1 !=
                                                              null &&
                                                          _model.budgetminValue1 !=
                                                              ''
                                                      ? _model.budgetminValue1
                                                      : _model.budgetminValue2,
                                                  maximum: _model.budgetmaxValue1 !=
                                                              null &&
                                                          _model.budgetmaxValue1 !=
                                                              ''
                                                      ? _model.budgetmaxValue1
                                                      : _model.budgetmaxValue2,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'wantedProfessionals': _model
                                                    .lookingForProfessionalsValues,
                                                'thingsWantedInNewHome': _model
                                                    .lookingForInNewHomeValues,
                                                'importantameneties':
                                                    _model.amenitiesValues,
                                              },
                                            ),
                                          }, surveysRecordReference);

                                          context.pushNamed(
                                              HomePageWidget.routeName);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Report created Sccessfully',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'Submit',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
