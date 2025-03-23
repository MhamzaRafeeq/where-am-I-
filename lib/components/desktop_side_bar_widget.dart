import '';
import '/components/side_bar_icon_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'desktop_side_bar_model.dart';
export 'desktop_side_bar_model.dart';

class DesktopSideBarWidget extends StatefulWidget {
  const DesktopSideBarWidget({super.key});

  @override
  State<DesktopSideBarWidget> createState() => _DesktopSideBarWidgetState();
}

class _DesktopSideBarWidgetState extends State<DesktopSideBarWidget> {
  late DesktopSideBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesktopSideBarModel());

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
      width: 72.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: _model.iconColors,
                    size: _model.iconSize.toDouble(),
                  ),
                ),
              ],
            ),
          ),
          wrapWithModel(
            model: _model.sideBarIconBoxModel1,
            updateCallback: () => safeSetState(() {}),
            child: SideBarIconBoxWidget(
              icon: Icon(
                Icons.login,
                color: _model.iconColors,
                size: _model.iconSize.toDouble(),
              ),
              iconText: 'Log in',
              textColor: _model.iconTextColor,
            ),
          ),
          wrapWithModel(
            model: _model.sideBarIconBoxModel2,
            updateCallback: () => safeSetState(() {}),
            child: SideBarIconBoxWidget(
              icon: Icon(
                Icons.save,
                color: _model.iconColors,
                size: _model.iconSize.toDouble(),
              ),
              iconText: 'save',
              textColor: _model.iconTextColor,
            ),
          ),
          wrapWithModel(
            model: _model.sideBarIconBoxModel3,
            updateCallback: () => safeSetState(() {}),
            child: SideBarIconBoxWidget(
              icon: Icon(
                Icons.share_rounded,
                color: _model.iconColors,
                size: _model.iconSize.toDouble(),
              ),
              iconText: 'share',
              textColor: _model.iconTextColor,
            ),
          ),
          wrapWithModel(
            model: _model.sideBarIconBoxModel4,
            updateCallback: () => safeSetState(() {}),
            child: SideBarIconBoxWidget(
              icon: Icon(
                Icons.print,
                color: _model.iconColors,
                size: _model.iconSize.toDouble(),
              ),
              iconText: 'print',
              textColor: _model.iconTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
