import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_in_info_model.dart';
export 'check_in_info_model.dart';

class CheckInInfoWidget extends StatefulWidget {
  const CheckInInfoWidget({
    super.key,
    required this.guest,
  });

  final GuestStruct? guest;

  @override
  State<CheckInInfoWidget> createState() => _CheckInInfoWidgetState();
}

class _CheckInInfoWidgetState extends State<CheckInInfoWidget> {
  late CheckInInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInInfoModel());

    _model.switchIValue = false;
    _model.textController ??= TextEditingController(
        text: getJsonField(
      widget!.guest?.toMap(),
      r'''$.name''',
    ).toString().toString());
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Switch.adaptive(
                value: _model.switchIValue!,
                onChanged: (newValue) async {
                  safeSetState(() => _model.switchIValue = newValue!);
                  if (newValue!) {
                    _model.isPortuguese = !_model.isPortuguese;
                  }
                },
                activeColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).primary,
                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                inactiveThumbColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'ijwvrtx3' /* Are you Portuguese? If not, pl... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Ubuntu',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                  child: Container(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () => safeSetState(() {}),
                      ),
                      autofocus: false,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      readOnly: _model.isPortuguese == true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        alignLabelWithHint: false,
                        hintText: FFLocalizations.of(context).getText(
                          '8dija4ga' /* First Name */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                  lineHeight: 1.5,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Ubuntu',
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
