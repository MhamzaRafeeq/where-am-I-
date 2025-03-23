import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'saved_map_model.dart';
export 'saved_map_model.dart';

class SavedMapWidget extends StatefulWidget {
  const SavedMapWidget({super.key});

  @override
  State<SavedMapWidget> createState() => _SavedMapWidgetState();
}

class _SavedMapWidgetState extends State<SavedMapWidget> {
  late SavedMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavedMapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowGoogleMap(
      controller: _model.googleMapsController,
      onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
      initialLocation: _model.googleMapsCenter ??=
          LatLng(13.106061, -59.613158),
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
  }
}
