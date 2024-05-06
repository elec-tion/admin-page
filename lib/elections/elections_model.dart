import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'elections_widget.dart' show ElectionsWidget;
import 'package:flutter/material.dart';

class ElectionsModel extends FlutterFlowModel<ElectionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;

  @override
  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
  }
}
