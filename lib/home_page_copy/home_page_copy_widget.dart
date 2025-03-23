import '';
import '/backend/api_requests/api_calls.dart';
import '/components/desktop_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'home_page_copy_model.dart';
export 'home_page_copy_model.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({super.key});

  static String routeName = 'HomePageCopy';
  static String routePath = '/homePageCopy';

  @override
  State<HomePageCopyWidget> createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget> {
  late HomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pageLoaded = true;
      safeSetState(() {});
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        currentUserLocationValue =
            await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
        await Future.wait([
          Future(() async {
            await Future.wait([
              Future(() async {
                _model.apiSuperMarkets = await SearchNearbyCall.call(
                  latitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.firstOrNull,
                  longitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.lastOrNull,
                  includedTypesList: FFAppConstants.Convenience,
                );
              }),
              Future(() async {}),
              Future(() async {
                _model.apiShopping = await SearchNearbyCall.call(
                  latitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.firstOrNull,
                  longitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.lastOrNull,
                  includedTypesList: FFAppConstants.ShoppingCenters,
                );
              }),
              Future(() async {}),
              Future(() async {
                _model.apiHealth = await SearchNearbyCall.call(
                  latitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.firstOrNull,
                  longitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.lastOrNull,
                  includedTypesList: FFAppConstants.HealthcareFacilities,
                );
              }),
              Future(() async {}),
              Future(() async {
                _model.apiSchool = await SearchNearbyCall.call(
                  latitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.firstOrNull,
                  longitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.lastOrNull,
                  includedTypesList: FFAppConstants.Ediucation,
                );
              }),
              Future(() async {
                _model.apiQualityOfLife = await SearchNearbyCall.call(
                  latitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.firstOrNull,
                  longitude: functions
                      .getLatitudeAndLongitude(_model.placePickerValue != null
                          ? _model.placePickerValue.latLng
                          : currentUserLocationValue)
                      ?.lastOrNull,
                  includedTypesList: FFAppConstants.qualityOfLife,
                );
              }),
              Future(() async {}),
            ]);
            if ((_model.apiSuperMarkets?.succeeded ?? true)) {
              await Future.wait([
                Future(() async {
                  _model.apisuperMarketDistance =
                      await GetDistanceAndTimeCall.call(
                    origins: _model.placePickerValue.address,
                    destinationsList: functions
                        .convertListOfStringsintoListOfStringwithPipeSepertor(
                            SearchNearbyCall.places(
                      (_model.apiSuperMarkets?.jsonBody ?? ''),
                    )
                                ?.map((e) => valueOrDefault<String>(
                                      PlacesTypesStruct.maybeFromMap(e)
                                          ?.formattedAddress,
                                      'jgjh',
                                    ))
                                .toList()
                                .toList()),
                  );
                }),
                Future(() async {}),
                Future(() async {
                  _model.apisuperShoppingDistance =
                      await GetDistanceAndTimeCall.call(
                    origins: _model.placePickerValue.address,
                    destinationsList: functions
                        .convertListOfStringsintoListOfStringwithPipeSepertor(
                            SearchNearbyCall.places(
                      (_model.apiShopping?.jsonBody ?? ''),
                    )
                                ?.map((e) => valueOrDefault<String>(
                                      PlacesTypesStruct.maybeFromMap(e)
                                          ?.formattedAddress,
                                      'dfs',
                                    ))
                                .toList()
                                .toList()),
                  );
                }),
                Future(() async {}),
                Future(() async {
                  _model.apiHealthDistance = await GetDistanceAndTimeCall.call(
                    origins: _model.placePickerValue.address,
                    destinationsList: functions
                        .convertListOfStringsintoListOfStringwithPipeSepertor(
                            SearchNearbyCall.places(
                      (_model.apiHealth?.jsonBody ?? ''),
                    )
                                ?.map((e) => valueOrDefault<String>(
                                      PlacesTypesStruct.maybeFromMap(e)
                                          ?.formattedAddress,
                                      'gf',
                                    ))
                                .toList()
                                .toList()),
                  );
                }),
                Future(() async {}),
                Future(() async {
                  _model.apiSchoolDistance = await GetDistanceAndTimeCall.call(
                    origins: _model.placePickerValue.address,
                    destinationsList: functions
                        .convertListOfStringsintoListOfStringwithPipeSepertor(
                            SearchNearbyCall.places(
                      (_model.apiSchool?.jsonBody ?? ''),
                    )
                                ?.map((e) => valueOrDefault<String>(
                                      PlacesTypesStruct.maybeFromMap(e)
                                          ?.formattedAddress,
                                      'sdf',
                                    ))
                                .toList()
                                .toList()),
                  );
                }),
                Future(() async {
                  _model.apiQualityDistance = await GetDistanceAndTimeCall.call(
                    origins: _model.placePickerValue.address,
                    destinationsList: functions
                        .convertListOfStringsintoListOfStringwithPipeSepertor(
                            SearchNearbyCall.places(
                      (_model.apiQualityOfLife?.jsonBody ?? ''),
                    )
                                ?.map((e) => valueOrDefault<String>(
                                      PlacesTypesStruct.maybeFromMap(e)
                                          ?.formattedAddress,
                                      'eq',
                                    ))
                                .toList()
                                .toList()),
                  );
                }),
              ]);
              if ((_model.apisuperMarketDistance?.succeeded ?? true)) {
                context.pushNamed(
                  ReportPageWidget.routeName,
                  queryParameters: {
                    'latLong': serializeParam(
                      _model.placePickerValue.latLng,
                      ParamType.LatLng,
                    ),
                    'superMarkets': serializeParam(
                      SearchNearbyCall.placesNames(
                        (_model.apiSuperMarkets?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'sDuration': serializeParam(
                      GetDistanceAndTimeCall.durations(
                        (_model.apisuperMarketDistance?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'shoppingMalls': serializeParam(
                      SearchNearbyCall.placesNames(
                        (_model.apiShopping?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'shoppingDuration': serializeParam(
                      GetDistanceAndTimeCall.durations(
                        (_model.apisuperShoppingDistance?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'hospitals': serializeParam(
                      SearchNearbyCall.placesNames(
                        (_model.apiHealth?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'hospitalDuration': serializeParam(
                      GetDistanceAndTimeCall.durations(
                        (_model.apiHealthDistance?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'schools': serializeParam(
                      SearchNearbyCall.placesNames(
                        (_model.apiSchool?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'schoolDuration': serializeParam(
                      GetDistanceAndTimeCall.durations(
                        (_model.apiSchoolDistance?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'quality': serializeParam(
                      SearchNearbyCall.placesNames(
                        (_model.apiQualityOfLife?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'qualityDuration': serializeParam(
                      GetDistanceAndTimeCall.durations(
                        (_model.apiQualityDistance?.jsonBody ?? ''),
                      ),
                      ParamType.String,
                      isList: true,
                    ),
                    'address': serializeParam(
                      _model.placePickerValue.address,
                      ParamType.String,
                    ),
                    'superMarketsPlaceTypes': serializeParam(
                      SearchNearbyCall.places(
                        (_model.apiSuperMarkets?.jsonBody ?? ''),
                      )
                          ?.map((e) => PlacesTypesStruct.maybeFromMap(e))
                          .withoutNulls
                          .toList(),
                      ParamType.DataStruct,
                      isList: true,
                    ),
                    'shoppingMallsPlaceTypes': serializeParam(
                      SearchNearbyCall.places(
                        (_model.apiShopping?.jsonBody ?? ''),
                      )
                          ?.map((e) => PlacesTypesStruct.maybeFromMap(e))
                          .withoutNulls
                          .toList(),
                      ParamType.DataStruct,
                      isList: true,
                    ),
                    'hospitalPlaceTypes': serializeParam(
                      SearchNearbyCall.places(
                        (_model.apiHealth?.jsonBody ?? ''),
                      )
                          ?.map((e) => PlacesTypesStruct.maybeFromMap(e))
                          .withoutNulls
                          .toList(),
                      ParamType.DataStruct,
                      isList: true,
                    ),
                    'schoolsPlaceTypes': serializeParam(
                      SearchNearbyCall.places(
                        (_model.apiSchool?.jsonBody ?? ''),
                      )
                          ?.map((e) => PlacesTypesStruct.maybeFromMap(e))
                          .withoutNulls
                          .toList(),
                      ParamType.DataStruct,
                      isList: true,
                    ),
                    'qualityPlacesTypes': serializeParam(
                      SearchNearbyCall.places(
                        (_model.apiQualityOfLife?.jsonBody ?? ''),
                      )
                          ?.map((e) => PlacesTypesStruct.maybeFromMap(e))
                          .withoutNulls
                          .toList(),
                      ParamType.DataStruct,
                      isList: true,
                    ),
                  }.withoutNulls,
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Place Did not Found!',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            }
          }),
        ]);

        safeSetState(() {});
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'What\'s Near Me? ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 10.0, 10.0, 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(SignupWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Login/Create Account',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed(SavedReportsWidget.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.save,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Saved Reports',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: FaIcon(
                                FontAwesomeIcons.bars,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        Stack(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.search,
                                  color: FlutterFlowTheme.of(context).success,
                                  size: 20.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.placePickerValue.city,
                                    'What\'s Near Me?',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 10.0)),
                            ),
                            FlutterFlowPlacePicker(
                              iOSGoogleMapsApiKey:
                                  'AIzaSyDnhKWlooPoEpOTtFPUm1V0opynFKclyFA',
                              androidGoogleMapsApiKey:
                                  'AIzaSyAUiTJnq3Tme_Op3bVWyVyAf8VwANRC4QY',
                              webGoogleMapsApiKey:
                                  'AIzaSyAfq-rekYBmMog4QjF6Q_pjEjpTRT51SKQ',
                              onSelect: (place) async {
                                safeSetState(
                                    () => _model.placePickerValue = place);
                                (await _model.googleMapsController.future)
                                    .animateCamera(CameraUpdate.newLatLng(
                                        place.latLng.toGoogleMaps()));
                              },
                              defaultText: '',
                              buttonOptions: FFButtonOptions(
                                width: 260.0,
                                height: 40.0,
                                color: Color(0x003A81FF),
                                textAlign: TextAlign.start,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0x00FFFFFF),
                                      fontSize: 0.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(88.0),
                              ),
                            ),
                            if (_model.placePickerValue.name != '')
                              Container(
                                width: 0.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    context.pushNamed(LoginWidget.routeName);
                                  },
                                  autofocus:
                                      _model.placePickerValue.name != '',
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 0.0,
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
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 0.0,
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/332BCBA2-E9A8-4DB2-9C7B-5C51DAADA77F__1_-removebg-preview.png',
                              width: 30.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              toolbarHeight: 80.0,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Stack(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Builder(builder: (context) {
                                      final _googleMapMarker =
                                          _model.placePickerValue.latLng;
                                      return FlutterFlowGoogleMap(
                                        controller: _model.googleMapsController,
                                        onCameraIdle: (latLng) => safeSetState(
                                            () => _model.googleMapsCenter =
                                                latLng),
                                        initialLocation:
                                            _model.googleMapsCenter ??=
                                                currentUserLocationValue!,
                                        markers: [
                                          FlutterFlowMarker(
                                            _googleMapMarker.serialize(),
                                            _googleMapMarker,
                                            () async {},
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
                                        showMapToolbar: true,
                                        showTraffic: true,
                                        centerMapOnMarkerTap: true,
                                      );
                                    }),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    PointerInterceptor(
                                      intercepting: isWeb,
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x7B39D2C0),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        SavedReportsWidget
                                                            .routeName);
                                                  },
                                                  child: Text(
                                                    'Saved Reports',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        SignupWidget.routeName);
                                                  },
                                                  child: Text(
                                                    'Login/Create Account',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
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
                            ),
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.desktopSideBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DesktopSideBarWidget(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
