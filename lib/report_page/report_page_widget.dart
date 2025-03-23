import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_account_o_n_report_page_widget.dart';
import '/components/options_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'report_page_model.dart';
export 'report_page_model.dart';

class ReportPageWidget extends StatefulWidget {
  const ReportPageWidget({
    super.key,
    required this.latLong,
    required this.superMarkets,
    required this.sDuration,
    required this.shoppingMalls,
    required this.shoppingDuration,
    required this.hospitals,
    required this.hospitalDuration,
    required this.schools,
    required this.schoolDuration,
    required this.quality,
    required this.qualityDuration,
    required this.address,
    this.superMarketsPlaceTypes,
    this.shoppingMallsPlaceTypes,
    this.hospitalPlaceTypes,
    this.schoolsPlaceTypes,
    this.qualityPlacesTypes,
  });

  final LatLng? latLong;
  final List<String>? superMarkets;
  final List<String>? sDuration;
  final List<String>? shoppingMalls;
  final List<String>? shoppingDuration;
  final List<String>? hospitals;
  final List<String>? hospitalDuration;
  final List<String>? schools;
  final List<String>? schoolDuration;
  final List<String>? quality;
  final List<String>? qualityDuration;
  final String? address;
  final List<PlacesTypesStruct>? superMarketsPlaceTypes;
  final List<PlacesTypesStruct>? shoppingMallsPlaceTypes;
  final List<PlacesTypesStruct>? hospitalPlaceTypes;
  final List<PlacesTypesStruct>? schoolsPlaceTypes;
  final List<PlacesTypesStruct>? qualityPlacesTypes;

  static String routeName = 'ReportPage';
  static String routePath = '/reportPage';

  @override
  State<ReportPageWidget> createState() => _ReportPageWidgetState();
}

class _ReportPageWidgetState extends State<ReportPageWidget> {
  late ReportPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportPageModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: true);
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
        resizeToAvoidBottomInset: false,
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
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  decoration: BoxDecoration(),
                  child: Text(
                    valueOrDefault<String>(
                      widget.address,
                      'Please select a place first',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showAlignedDialog(
                          context: context,
                          isGlobal: false,
                          avoidOverflow: false,
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(1.0, -1.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: OptionsWidget(
                                  convenienceData:
                                      functions.addressesAndDurations2(
                                          widget.superMarkets?.toList(),
                                          widget.sDuration?.toList(),
                                          widget.shoppingMalls?.toList(),
                                          widget.shoppingDuration?.toList())!,
                                  convenienceResult: functions.generateGrades(
                                      widget.sDuration?.toList(),
                                      widget.shoppingDuration?.toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      valueOrDefault<String>(
                                        FFAppState().locationType,
                                        'urban',
                                      )),
                                  safetyData: functions.addressesAndDurations2(
                                      widget.hospitals?.toList(),
                                      widget.hospitalDuration?.toList(),
                                      widget.schools?.toList(),
                                      widget.schoolDuration?.toList())!,
                                  safetyResults: functions.generateGrades(
                                      widget.hospitalDuration?.toList(),
                                      widget.schoolDuration?.toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      valueOrDefault<String>(
                                        FFAppState().locationType,
                                        'urban',
                                      )),
                                  qualityData: functions.addressesAndDurations(
                                      widget.quality?.toList(),
                                      widget.qualityDuration?.toList()),
                                  qualityResult: functions.generateGrades2(
                                      widget.qualityDuration?.toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      valueOrDefault<String>(
                                        FFAppState().locationType,
                                        'urban',
                                      )),
                                  totalResult: functions.generateResults(
                                      functions
                                          .generateGrades(
                                              widget.sDuration?.toList(),
                                              widget.shoppingDuration
                                                  ?.toList(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              valueOrDefault<String>(
                                                FFAppState().locationType,
                                                'urban',
                                              ))
                                          .toList(),
                                      functions
                                          .generateGrades(
                                              widget.hospitalDuration
                                                  ?.toList(),
                                              widget.schoolDuration?.toList(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              valueOrDefault<String>(
                                                FFAppState().locationType,
                                                'urban',
                                              ))
                                          .toList(),
                                      functions
                                          .generateGrades2(
                                              widget.qualityDuration?.toList(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              valueOrDefault<String>(
                                                FFAppState().locationType,
                                                'urban',
                                              ))
                                          .toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground)!,
                                  resultsLocation: widget.latLong!,
                                  resultAdrress: widget.address!,
                                  shareAction: () async {
                                    _model.image3 =
                                        await actions.generateMapImage(
                                      functions
                                          .getLatitudeAndLongitude(
                                              widget.latLong)
                                          ?.lastOrNull,
                                      functions
                                          .getLatitudeAndLongitude(
                                              widget.latLong)
                                          ?.firstOrNull,
                                    );
                                    await actions.exportPDF(
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .sDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.superMarkets?.toList(),
                                              widget.sDuration?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .sDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.superMarkets?.toList(),
                                              widget.sDuration?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .shoppingDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.shoppingMalls?.toList(),
                                              widget.shoppingDuration
                                                  ?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .shoppingDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.shoppingMalls?.toList(),
                                              widget.shoppingDuration
                                                  ?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .hospitalDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.hospitals?.toList(),
                                              widget.hospitalDuration
                                                  ?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .hospitalDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.hospitals?.toList(),
                                              widget.hospitalDuration
                                                  ?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .schoolDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.schools?.toList(),
                                              widget.schoolDuration?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .schoolDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.schools?.toList(),
                                              widget.schoolDuration?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .qualityDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.quality?.toList(),
                                              widget.qualityDuration?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .qualityDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.quality?.toList(),
                                              widget.qualityDuration?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      true,
                                      isWeb,
                                      _model.image3,
                                    );
                                  },
                                  printAction: () async {
                                    _model.image4 =
                                        await actions.generateMapImage(
                                      functions
                                          .getLatitudeAndLongitude(
                                              widget.latLong)
                                          ?.lastOrNull,
                                      functions
                                          .getLatitudeAndLongitude(
                                              widget.latLong)
                                          ?.firstOrNull,
                                    );
                                    await actions.exportPDF(
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .sDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.superMarkets?.toList(),
                                              widget.sDuration?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .sDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.superMarkets?.toList(),
                                              widget.sDuration?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .shoppingDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.shoppingMalls?.toList(),
                                              widget.shoppingDuration
                                                  ?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .shoppingDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.shoppingMalls?.toList(),
                                              widget.shoppingDuration
                                                  ?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .hospitalDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.hospitals?.toList(),
                                              widget.hospitalDuration
                                                  ?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .hospitalDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.hospitals?.toList(),
                                              widget.hospitalDuration
                                                  ?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .schoolDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.schools?.toList(),
                                              widget.schoolDuration?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .schoolDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.schools?.toList(),
                                              widget.schoolDuration?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .qualityDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.quality?.toList(),
                                              widget.qualityDuration?.toList())
                                          .map((e) => e.place)
                                          .toList(),
                                      functions
                                          .closestPlaces(
                                              functions
                                                  .getClosestPlacesIndex(widget
                                                      .qualityDuration
                                                      ?.toList())
                                                  .toList(),
                                              widget.quality?.toList(),
                                              widget.qualityDuration?.toList())
                                          .map((e) => e.duration)
                                          .toList(),
                                      false,
                                      isWeb,
                                      _model.image4,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );

                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (loggedIn) {
                            await AddressReportRecord.collection.doc().set({
                              ...createAddressReportRecordData(
                                reportPlace: widget.latLong,
                                reportplaceAddress: widget.address,
                                uid: currentUserUid,
                              ),
                              ...mapToFirestore(
                                {
                                  'convenience':
                                      getAddressAndDurationListFirestoreData(
                                    functions.addressesAndDurations2(
                                        widget.superMarkets?.toList(),
                                        widget.sDuration?.toList(),
                                        widget.shoppingMalls?.toList(),
                                        widget.shoppingDuration?.toList()),
                                  ),
                                  'Safety':
                                      getAddressAndDurationListFirestoreData(
                                    functions.addressesAndDurations2(
                                        widget.hospitals?.toList(),
                                        widget.hospitalDuration?.toList(),
                                        widget.schools?.toList(),
                                        widget.schoolDuration?.toList()),
                                  ),
                                  'QualityOfLIfe':
                                      getAddressAndDurationListFirestoreData(
                                    functions.addressesAndDurations(
                                        widget.quality?.toList(),
                                        widget.qualityDuration?.toList()),
                                  ),
                                  'convenienceResult': functions.generateGrades(
                                      widget.sDuration?.toList(),
                                      widget.shoppingDuration?.toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      valueOrDefault<String>(
                                        FFAppState().locationType,
                                        'urban',
                                      )),
                                  'safetyResult': functions.generateGrades(
                                      widget.hospitalDuration?.toList(),
                                      widget.schoolDuration?.toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      valueOrDefault<String>(
                                        FFAppState().locationType,
                                        'urban',
                                      )),
                                  'qualityResult': functions.generateGrades2(
                                      widget.qualityDuration?.toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      valueOrDefault<String>(
                                        FFAppState().locationType,
                                        'urban',
                                      )),
                                  'finalResult': functions.generateResults(
                                      functions
                                          .generateGrades(
                                              widget.sDuration?.toList(),
                                              widget.shoppingDuration
                                                  ?.toList(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              valueOrDefault<String>(
                                                FFAppState().locationType,
                                                'urban',
                                              ))
                                          .toList(),
                                      functions
                                          .generateGrades(
                                              widget.hospitalDuration
                                                  ?.toList(),
                                              widget.schoolDuration?.toList(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              valueOrDefault<String>(
                                                FFAppState().locationType,
                                                'urban',
                                              ))
                                          .toList(),
                                      functions
                                          .generateGrades2(
                                              widget.qualityDuration?.toList(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              valueOrDefault<String>(
                                                FFAppState().locationType,
                                                'urban',
                                              ))
                                          .toList(),
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'report saved successfully',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            context.pushNamed(LoginWidget.routeName);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'For Saving Report you has to login first',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.save,
                          color: FlutterFlowTheme.of(context).success,
                          size: 36.0,
                        ),
                      ),
                    ],
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.link = await actions.createDynamicLink(
                            widget.latLong!,
                            widget.superMarkets?.toList(),
                            widget.sDuration?.toList(),
                            widget.shoppingMalls?.toList(),
                            widget.shoppingDuration?.toList(),
                            widget.hospitals?.toList(),
                            widget.hospitalDuration?.toList(),
                            widget.schools?.toList(),
                            widget.schoolDuration?.toList(),
                            widget.quality?.toList(),
                            widget.qualityDuration?.toList(),
                            widget.address,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _model.link!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          await launchURL(_model.link!);

                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.share_outlined,
                          color: FlutterFlowTheme.of(context).success,
                          size: 36.0,
                        ),
                      ),
                    ],
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.image2 = await actions.generateMapImage(
                        functions
                            .getLatitudeAndLongitude(widget.latLong)
                            ?.lastOrNull,
                        functions
                            .getLatitudeAndLongitude(widget.latLong)
                            ?.firstOrNull,
                      );
                      await actions.exportPDF(
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.sDuration?.toList())
                                    .toList(),
                                widget.superMarkets?.toList(),
                                widget.sDuration?.toList())
                            .map((e) => e.place)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.sDuration?.toList())
                                    .toList(),
                                widget.superMarkets?.toList(),
                                widget.sDuration?.toList())
                            .map((e) => e.duration)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.shoppingDuration?.toList())
                                    .toList(),
                                widget.shoppingMalls?.toList(),
                                widget.shoppingDuration?.toList())
                            .map((e) => e.place)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.shoppingDuration?.toList())
                                    .toList(),
                                widget.shoppingMalls?.toList(),
                                widget.shoppingDuration?.toList())
                            .map((e) => e.duration)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.hospitalDuration?.toList())
                                    .toList(),
                                widget.hospitals?.toList(),
                                widget.hospitalDuration?.toList())
                            .map((e) => e.place)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.hospitalDuration?.toList())
                                    .toList(),
                                widget.hospitals?.toList(),
                                widget.hospitalDuration?.toList())
                            .map((e) => e.duration)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.schoolDuration?.toList())
                                    .toList(),
                                widget.schools?.toList(),
                                widget.schoolDuration?.toList())
                            .map((e) => e.place)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.schoolDuration?.toList())
                                    .toList(),
                                widget.schools?.toList(),
                                widget.schoolDuration?.toList())
                            .map((e) => e.duration)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.qualityDuration?.toList())
                                    .toList(),
                                widget.quality?.toList(),
                                widget.qualityDuration?.toList())
                            .map((e) => e.place)
                            .toList(),
                        functions
                            .closestPlaces(
                                functions
                                    .getClosestPlacesIndex(
                                        widget.qualityDuration?.toList())
                                    .toList(),
                                widget.quality?.toList(),
                                widget.qualityDuration?.toList())
                            .map((e) => e.duration)
                            .toList(),
                        false,
                        isWeb,
                        _model.image2,
                      );

                      safeSetState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.print,
                          color: FlutterFlowTheme.of(context).success,
                          size: 36.0,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2.0,
                      ),
                    ),
                    child: Builder(builder: (context) {
                      final _googleMapMarker = widget.latLong;
                      return FlutterFlowGoogleMap(
                        controller: _model.googleMapsController1,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter1 = latLng,
                        initialLocation: _model.googleMapsCenter1 ??=
                            widget.latLong!,
                        markers: [
                          if (_googleMapMarker != null)
                            FlutterFlowMarker(
                              _googleMapMarker.serialize(),
                              _googleMapMarker,
                            ),
                        ],
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      );
                    }),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 2.0,
                          ),
                        ),
                        child: Builder(builder: (context) {
                          final _googleMapMarker = widget.latLong;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController2,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter2 = latLng,
                            initialLocation: _model.googleMapsCenter2 ??=
                                widget.latLong!,
                            markers: [
                              if (_googleMapMarker != null)
                                FlutterFlowMarker(
                                  _googleMapMarker.serialize(),
                                  _googleMapMarker,
                                ),
                            ],
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          );
                        }),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Expanded(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 350.0,
                                  color: Color(0x00E0E3E7),
                                  child: ExpandableNotifier(
                                    controller:
                                        _model.expandableExpandableController1,
                                    child: ExpandablePanel(
                                      header: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Convenience',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      collapsed: Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                      expanded: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (widget.superMarkets != null &&
                                                (widget.superMarkets)!
                                                    .isNotEmpty)
                                              Builder(
                                                builder: (context) {
                                                  final closestsuperMarkets =
                                                      functions
                                                          .getClosestPlacesIndex(
                                                              widget.sDuration
                                                                  ?.toList())
                                                          .toList();

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        closestsuperMarkets
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        closestsuperMarketsIndex) {
                                                      final closestsuperMarketsItem =
                                                          closestsuperMarkets[
                                                              closestsuperMarketsIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if ((widget.sDuration
                                                                      ?.elementAtOrNull(
                                                                          closestsuperMarketsIndex)) !=
                                                                  null &&
                                                              (widget.sDuration
                                                                      ?.elementAtOrNull(
                                                                          closestsuperMarketsIndex)) !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          22.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.45,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (widget.superMarketsPlaceTypes?.elementAtOrNull(closestsuperMarketsItem))
                                                                            ?.types
                                                                            .firstOrNull,
                                                                        'fds',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if ((widget.sDuration
                                                                      ?.elementAtOrNull(
                                                                          closestsuperMarketsIndex)) !=
                                                                  null &&
                                                              (widget.sDuration
                                                                      ?.elementAtOrNull(
                                                                          closestsuperMarketsIndex)) !=
                                                                  '')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.45,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .superMarkets
                                                                          ?.elementAtOrNull(
                                                                              closestsuperMarketsItem),
                                                                      'No place Found in this category',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    widget
                                                                        .sDuration
                                                                        ?.elementAtOrNull(
                                                                            closestsuperMarketsItem),
                                                                    'Distance Not Found',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            if (widget.shoppingMalls != null &&
                                                (widget.shoppingMalls)!
                                                    .isNotEmpty)
                                              Builder(
                                                builder: (context) {
                                                  final closestshoppingMalls =
                                                      functions
                                                          .getClosestPlacesIndex(
                                                              widget
                                                                  .shoppingDuration
                                                                  ?.toList())
                                                          .toList();

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        closestshoppingMalls
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        closestshoppingMallsIndex) {
                                                      final closestshoppingMallsItem =
                                                          closestshoppingMalls[
                                                              closestshoppingMallsIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.45,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      (widget.shoppingMallsPlaceTypes
                                                                              ?.elementAtOrNull(closestshoppingMallsItem))
                                                                          ?.types
                                                                          .firstOrNull,
                                                                      'fds',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.45,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    widget
                                                                        .shoppingMalls
                                                                        ?.elementAtOrNull(
                                                                            closestshoppingMallsItem),
                                                                    'No Shoppng mall Found around this',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .shoppingDuration
                                                                      ?.elementAtOrNull(
                                                                          closestshoppingMallsItem),
                                                                  'DistanceNot Found',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: Icons.arrow_drop_down,
                                        collapseIcon: Icons.arrow_drop_up,
                                        iconSize: 30.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 350.0,
                                  color: Color(0x00FFFFFF),
                                  child: ExpandableNotifier(
                                    controller:
                                        _model.expandableExpandableController2,
                                    child: ExpandablePanel(
                                      header: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Health & Safety',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.black,
                                                  fontSize: 25.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      collapsed: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      expanded: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (widget.hospitals != null &&
                                              (widget.hospitals)!.isNotEmpty)
                                            Builder(
                                              builder: (context) {
                                                final closesthospitals =
                                                    functions
                                                        .getClosestPlacesIndex(
                                                            widget
                                                                .hospitalDuration
                                                                ?.toList())
                                                        .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      closesthospitals.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      closesthospitalsIndex) {
                                                    final closesthospitalsItem =
                                                        closesthospitals[
                                                            closesthospitalsIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      22.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.45,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    (widget.hospitalPlaceTypes
                                                                            ?.elementAtOrNull(closesthospitalsItem))
                                                                        ?.types
                                                                        .firstOrNull,
                                                                    'fds',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.45,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .hospitals
                                                                      ?.elementAtOrNull(
                                                                          closesthospitalsItem),
                                                                  'No Hospital Found in this region',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .hospitalDuration
                                                                    ?.elementAtOrNull(
                                                                        closesthospitalsItem),
                                                                'Distance Not found',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          if (widget.schools != null &&
                                              (widget.schools)!.isNotEmpty)
                                            Builder(
                                              builder: (context) {
                                                final closestschools = functions
                                                    .getClosestPlacesIndex(
                                                        widget.schoolDuration
                                                            ?.toList())
                                                    .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      closestschools.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      closestschoolsIndex) {
                                                    final closestschoolsItem =
                                                        closestschools[
                                                            closestschoolsIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.45,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    (widget.schoolsPlaceTypes
                                                                            ?.elementAtOrNull(closestschoolsItem))
                                                                        ?.types
                                                                        .firstOrNull,
                                                                    'fds',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.45,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .schools
                                                                      ?.elementAtOrNull(
                                                                          closestschoolsItem),
                                                                  'No School found in this region',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .schoolDuration
                                                                    ?.elementAtOrNull(
                                                                        closestschoolsItem),
                                                                'Distance Not Found',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: Icons.arrow_drop_down,
                                        collapseIcon: Icons.arrow_drop_up,
                                        iconSize: 30.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 350.0,
                                  color: Color(0x00FFFFFF),
                                  child: ExpandableNotifier(
                                    controller:
                                        _model.expandableExpandableController3,
                                    child: ExpandablePanel(
                                      header: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Quality Of Life',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.black,
                                                  fontSize: 25.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      collapsed: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      expanded: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (widget.quality != null &&
                                              (widget.quality)!.isNotEmpty)
                                            Builder(
                                              builder: (context) {
                                                final closestQualityPlaces =
                                                    functions
                                                        .getClosestPlacesIndex(
                                                            widget
                                                                .qualityDuration
                                                                ?.toList())
                                                        .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      closestQualityPlaces
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      closestQualityPlacesIndex) {
                                                    final closestQualityPlacesItem =
                                                        closestQualityPlaces[
                                                            closestQualityPlacesIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      22.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.45,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    (widget.qualityPlacesTypes
                                                                            ?.elementAtOrNull(closestQualityPlacesItem))
                                                                        ?.types
                                                                        .firstOrNull,
                                                                    'fds',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.45,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .quality
                                                                      ?.elementAtOrNull(
                                                                          closestQualityPlacesItem),
                                                                  'No quality place found in this region',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .qualityDuration
                                                                    ?.elementAtOrNull(
                                                                        closestQualityPlacesItem),
                                                                'Not Found',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: Icons.arrow_drop_down,
                                        collapseIcon: Icons.arrow_drop_up,
                                        iconSize: 30.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Score',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                wrapWithModel(
                                  model: _model.createAccountONReportPageModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CreateAccountONReportPageWidget(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    color: Color(0x00E0E3E7),
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .expandableExpandableController4,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Convenience',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 25.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(
                                          width: 0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                        ),
                                        expanded: Container(
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (widget.superMarkets !=
                                                        null &&
                                                    (widget.superMarkets)!
                                                        .isNotEmpty)
                                                  Builder(
                                                    builder: (context) {
                                                      final superMarketsClosest =
                                                          functions
                                                              .getClosestPlacesIndex(
                                                                  widget
                                                                      .sDuration
                                                                      ?.toList())
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            superMarketsClosest
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            superMarketsClosestIndex) {
                                                          final superMarketsClosestItem =
                                                              superMarketsClosest[
                                                                  superMarketsClosestIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if ((widget.sDuration
                                                                          ?.elementAtOrNull(
                                                                              superMarketsClosestIndex)) !=
                                                                      null &&
                                                                  (widget.sDuration
                                                                          ?.elementAtOrNull(
                                                                              superMarketsClosestIndex)) !=
                                                                      '')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.45,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              400.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            (widget.superMarketsPlaceTypes?.elementAtOrNull(superMarketsClosestItem))?.types.firstOrNull,
                                                                            'fds',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if ((widget.sDuration
                                                                          ?.elementAtOrNull(
                                                                              superMarketsClosestIndex)) !=
                                                                      null &&
                                                                  (widget.sDuration
                                                                          ?.elementAtOrNull(
                                                                              superMarketsClosestIndex)) !=
                                                                      '')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.45,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .superMarkets
                                                                              ?.elementAtOrNull(superMarketsClosestItem),
                                                                          'No superMarket Found in this region',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .sDuration
                                                                            ?.elementAtOrNull(superMarketsClosestItem),
                                                                        'Not Found',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (widget.shoppingMalls !=
                                                        null &&
                                                    (widget.shoppingMalls)!
                                                        .isNotEmpty)
                                                  Builder(
                                                    builder: (context) {
                                                      final shoppingMallsClosest =
                                                          functions
                                                              .getClosestPlacesIndex(
                                                                  widget
                                                                      .shoppingDuration
                                                                      ?.toList())
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            shoppingMallsClosest
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            shoppingMallsClosestIndex) {
                                                          final shoppingMallsClosestItem =
                                                              shoppingMallsClosest[
                                                                  shoppingMallsClosestIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.45,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (widget.shoppingMallsPlaceTypes?.elementAtOrNull(shoppingMallsClosestItem))
                                                                              ?.types
                                                                              .firstOrNull,
                                                                          'fds',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.45,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .shoppingMalls
                                                                            ?.elementAtOrNull(shoppingMallsClosestItem),
                                                                        'No Shopping Malls found in this region',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .shoppingDuration
                                                                          ?.elementAtOrNull(
                                                                              shoppingMallsClosestItem),
                                                                      'Not Found',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: Icons.arrow_drop_down,
                                          collapseIcon: Icons.arrow_drop_up,
                                          iconSize: 30.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    color: Color(0x00FFFFFF),
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .expandableExpandableController5,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Safety',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        expanded: Container(
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (widget.hospitals != null &&
                                                    (widget.hospitals)!
                                                        .isNotEmpty)
                                                  Builder(
                                                    builder: (context) {
                                                      final hospitalsClosest = functions
                                                          .getClosestPlacesIndex(
                                                              widget
                                                                  .hospitalDuration
                                                                  ?.toList())
                                                          .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            hospitalsClosest
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            hospitalsClosestIndex) {
                                                          final hospitalsClosestItem =
                                                              hospitalsClosest[
                                                                  hospitalsClosestIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.45,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (widget.hospitalPlaceTypes?.elementAtOrNull(hospitalsClosestItem))
                                                                              ?.types
                                                                              .firstOrNull,
                                                                          'fds',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.45,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .hospitals
                                                                            ?.elementAtOrNull(hospitalsClosestItem),
                                                                        'No Hospitals Found in this region',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .hospitalDuration
                                                                          ?.elementAtOrNull(
                                                                              hospitalsClosestItem),
                                                                      'NOt found',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (widget.schools != null &&
                                                    (widget.schools)!
                                                        .isNotEmpty)
                                                  Builder(
                                                    builder: (context) {
                                                      final schoolsclosest = functions
                                                          .getClosestPlacesIndex(
                                                              widget
                                                                  .schoolDuration
                                                                  ?.toList())
                                                          .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            schoolsclosest
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            schoolsclosestIndex) {
                                                          final schoolsclosestItem =
                                                              schoolsclosest[
                                                                  schoolsclosestIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.45,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (widget.schoolsPlaceTypes?.elementAtOrNull(schoolsclosestItem))
                                                                              ?.types
                                                                              .firstOrNull,
                                                                          'fds',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.45,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .schools
                                                                            ?.elementAtOrNull(schoolsclosestItem),
                                                                        'No Schools Founds in this region',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .schoolDuration
                                                                          ?.elementAtOrNull(
                                                                              schoolsclosestItem),
                                                                      'Not Found',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: Icons.arrow_drop_down,
                                          collapseIcon: Icons.arrow_drop_up,
                                          iconSize: 30.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    color: Color(0x00FFFFFF),
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .expandableExpandableController6,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Quality Of Life',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        expanded: Container(
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (widget.quality != null &&
                                                    (widget.quality)!
                                                        .isNotEmpty)
                                                  Builder(
                                                    builder: (context) {
                                                      final qualityclosest = functions
                                                          .getClosestPlacesIndex(
                                                              widget
                                                                  .qualityDuration
                                                                  ?.toList())
                                                          .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            qualityclosest
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            qualityclosestIndex) {
                                                          final qualityclosestItem =
                                                              qualityclosest[
                                                                  qualityclosestIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.45,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (widget.qualityPlacesTypes?.elementAtOrNull(qualityclosestItem))
                                                                              ?.types
                                                                              .firstOrNull,
                                                                          'fds',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.45,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .quality
                                                                            ?.elementAtOrNull(qualityclosestItem),
                                                                        'No Quality place found in your nearby area',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .qualityDuration
                                                                          ?.elementAtOrNull(
                                                                              qualityclosestItem),
                                                                      'Not Found',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: Icons.arrow_drop_down,
                                          collapseIcon: Icons.arrow_drop_up,
                                          iconSize: 30.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Agree?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 8.0, 5.0),
                                          child: FlutterFlowRadioButton(
                                            options: [
                                              '1',
                                              '2',
                                              '3',
                                              '4',
                                              '5',
                                              '6'
                                            ].toList(),
                                            onChanged: (val) =>
                                                safeSetState(() {}),
                                            controller: _model
                                                    .radioButtonValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            optionHeight: 32.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            selectedTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.horizontal,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            toggleable: false,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  wrapWithModel(
                                    model:
                                        _model.createAccountONReportPageModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CreateAccountONReportPageWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
