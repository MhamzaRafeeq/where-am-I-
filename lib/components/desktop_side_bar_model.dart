import '/components/side_bar_icon_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'desktop_side_bar_widget.dart' show DesktopSideBarWidget;
import 'package:flutter/material.dart';

class DesktopSideBarModel extends FlutterFlowModel<DesktopSideBarWidget> {
  ///  Local state fields for this component.

  Color iconColors = Color(4279506971);

  int iconSize = 24;

  Color iconTextColor = Color(4283917164);

  ///  State fields for stateful widgets in this component.

  // Model for sideBarIconBox component.
  late SideBarIconBoxModel sideBarIconBoxModel1;
  // Model for sideBarIconBox component.
  late SideBarIconBoxModel sideBarIconBoxModel2;
  // Model for sideBarIconBox component.
  late SideBarIconBoxModel sideBarIconBoxModel3;
  // Model for sideBarIconBox component.
  late SideBarIconBoxModel sideBarIconBoxModel4;

  @override
  void initState(BuildContext context) {
    sideBarIconBoxModel1 = createModel(context, () => SideBarIconBoxModel());
    sideBarIconBoxModel2 = createModel(context, () => SideBarIconBoxModel());
    sideBarIconBoxModel3 = createModel(context, () => SideBarIconBoxModel());
    sideBarIconBoxModel4 = createModel(context, () => SideBarIconBoxModel());
  }

  @override
  void dispose() {
    sideBarIconBoxModel1.dispose();
    sideBarIconBoxModel2.dispose();
    sideBarIconBoxModel3.dispose();
    sideBarIconBoxModel4.dispose();
  }
}
