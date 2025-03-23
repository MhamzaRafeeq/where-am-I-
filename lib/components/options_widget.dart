import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'options_model.dart';
export 'options_model.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({
    super.key,
    required this.shareAction,
    required this.printAction,
    required this.convenienceData,
    required this.convenienceResult,
    required this.safetyData,
    required this.safetyResults,
    required this.qualityData,
    required this.qualityResult,
    required this.totalResult,
    required this.resultsLocation,
    required this.resultAdrress,
  });

  final Future Function()? shareAction;
  final Future Function()? printAction;
  final List<AddressAndDurationStruct>? convenienceData;
  final List<Color>? convenienceResult;
  final List<AddressAndDurationStruct>? safetyData;
  final List<Color>? safetyResults;
  final List<AddressAndDurationStruct>? qualityData;
  final List<Color>? qualityResult;
  final List<Color>? totalResult;
  final LatLng? resultsLocation;
  final String? resultAdrress;

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  late OptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                    reportPlace: widget.resultsLocation,
                    reportplaceAddress: widget.resultAdrress,
                    uid: currentUserUid,
                  ),
                  ...mapToFirestore(
                    {
                      'convenience': getAddressAndDurationListFirestoreData(
                        widget.convenienceData,
                      ),
                      'Safety': getAddressAndDurationListFirestoreData(
                        widget.safetyData,
                      ),
                      'QualityOfLIfe': getAddressAndDurationListFirestoreData(
                        widget.qualityData,
                      ),
                      'convenienceResult': widget.convenienceResult,
                      'safetyResult': widget.safetyResults,
                      'qualityResult': widget.qualityResult,
                      'finalResult': widget.totalResult,
                    },
                  ),
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'report saved successfully',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              } else {
                context.pushNamed(LoginWidget.routeName);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'For Saving Report you has to login first',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }

              Navigator.pop(context);
            },
            child: Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.save,
                      color: FlutterFlowTheme.of(context).success,
                      size: 36.0,
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.shareAction?.call();
              Navigator.pop(context);
            },
            child: Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.share_outlined,
                    color: FlutterFlowTheme.of(context).success,
                    size: 36.0,
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.printAction?.call();
              Navigator.pop(context);
            },
            child: Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.print,
                    color: FlutterFlowTheme.of(context).success,
                    size: 36.0,
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
