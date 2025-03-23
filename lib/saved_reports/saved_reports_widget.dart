import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/saved_map_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'saved_reports_model.dart';
export 'saved_reports_model.dart';

class SavedReportsWidget extends StatefulWidget {
  const SavedReportsWidget({super.key});

  static String routeName = 'SavedReports';
  static String routePath = '/savedReports';

  @override
  State<SavedReportsWidget> createState() => _SavedReportsWidgetState();
}

class _SavedReportsWidgetState extends State<SavedReportsWidget> {
  late SavedReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavedReportsModel());

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Saved Reports',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: StreamBuilder<List<AddressReportRecord>>(
          stream: queryAddressReportRecord(
            queryBuilder: (addressReportRecord) => addressReportRecord.where(
              'uid',
              isEqualTo: currentUserUid,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<AddressReportRecord> containerAddressReportRecordList =
                snapshot.data!;

            return Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.searchBarTextController,
                                focusNode: _model.searchBarFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchBarTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                        containerAddressReportRecordList
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record, [
                                                record.reportplaceAddress
                                              ]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model
                                              .searchBarTextController.text)
                                          .map((r) => r.object)
                                          .toList();
                                      ;
                                    });
                                  },
                                ),
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Search for your report',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 20.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model
                                    .searchBarTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_model.searchBarTextController.text == '')
                          StreamBuilder<List<AddressReportRecord>>(
                            stream: queryAddressReportRecord(
                              queryBuilder: (addressReportRecord) =>
                                  addressReportRecord.where(
                                'uid',
                                isEqualTo: currentUserUid,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<AddressReportRecord>
                                  listViewAddressReportRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewAddressReportRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewAddressReportRecord =
                                      listViewAddressReportRecordList[
                                          listViewIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 70.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: SavedMapWidget(
                                                            key: Key(
                                                                'Key8ue_${listViewIndex}_of_${listViewAddressReportRecordList.length}'),
                                                          ),
                                                        ),
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 170.0,
                                                            maxHeight: 70.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              listViewAddressReportRecord
                                                                  .reportplaceAddress,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          ReportPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'latLong':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .reportPlace,
                                                              ParamType.LatLng,
                                                            ),
                                                            'superMarkets':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .convenience
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'sDuration':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .convenience
                                                                  .map((e) => e
                                                                      .travelDuration)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'shoppingMalls':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .convenience
                                                                  .where((e) =>
                                                                      e == null)
                                                                  .toList()
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'shoppingDuration':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .convenience
                                                                  .where((e) =>
                                                                      e == null)
                                                                  .toList()
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'hospitals':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .safety
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'hospitalDuration':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .safety
                                                                  .map((e) => e
                                                                      .travelDuration)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'schools':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .convenience
                                                                  .where((e) =>
                                                                      e == null)
                                                                  .toList()
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'schoolDuration':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .convenience
                                                                  .where((e) =>
                                                                      e == null)
                                                                  .toList()
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'quality':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .qualityOfLIfe
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'qualityDuration':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .safety
                                                                  .map((e) => e
                                                                      .travelDuration)
                                                                  .toList(),
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'address':
                                                                serializeParam(
                                                              listViewAddressReportRecord
                                                                  .reportplaceAddress,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: 'view',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (_model.searchBarTextController.text != '')
                          Builder(
                            builder: (context) {
                              final searchResults =
                                  _model.simpleSearchResults.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResults.length,
                                itemBuilder: (context, searchResultsIndex) {
                                  final searchResultsItem =
                                      searchResults[searchResultsIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 70.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: SavedMapWidget(
                                                            key: Key(
                                                                'Keyjlc_${searchResultsIndex}_of_${searchResults.length}'),
                                                          ),
                                                        ),
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 170.0,
                                                            maxHeight: 70.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              searchResultsItem
                                                                  .reportplaceAddress,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        ReportPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'latLong':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .reportPlace,
                                                            ParamType.LatLng,
                                                          ),
                                                          'superMarkets':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .convenience
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'sDuration':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .convenience
                                                                .map((e) => e
                                                                    .travelDuration)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'shoppingMalls':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .convenience
                                                                .where((e) =>
                                                                    e == null)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'shoppingDuration':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .convenience
                                                                .where((e) =>
                                                                    e == null)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'hospitals':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .safety
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'hospitalDuration':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .safety
                                                                .map((e) => e
                                                                    .travelDuration)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'schools':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .convenience
                                                                .where((e) =>
                                                                    e == null)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'schoolDuration':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .convenience
                                                                .where((e) =>
                                                                    e == null)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'quality':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .qualityOfLIfe
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'qualityDuration':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .qualityOfLIfe
                                                                .map((e) => e
                                                                    .travelDuration)
                                                                .toList(),
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'address':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .reportplaceAddress,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: 'view',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
