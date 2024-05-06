import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ID widget.
  FocusNode? idFocusNode;
  TextEditingController? idTextController;
  String? Function(BuildContext, String?)? idTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in card_ActiveUsers widget.
  List<AdminsRow>? isIDValid;
  // Stores action output result for [Backend Call - Query Rows] action in card_ActiveUsers widget.
  List<AdminsRow>? isPasswordValid;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    idFocusNode?.dispose();
    idTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
