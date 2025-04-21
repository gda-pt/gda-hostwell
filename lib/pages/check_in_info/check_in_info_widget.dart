import '/backend/supabase/supabase.dart';
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
    this.index,
    required this.guestId,
  });

  final int? index;
  final int? guestId;

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

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textFieldFocusNode6 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: StreamBuilder<List<GdaGuestRow>>(
        stream: _model.listViewSupabaseStream ??= SupaFlow.client
            .from("gda_guest")
            .stream(primaryKey: ['id'])
            .eqOrNull(
              'id',
              widget!.guestId,
            )
            .map((list) => list.map((item) => GdaGuestRow(item)).toList()),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<GdaGuestRow> listViewGdaGuestRowList = snapshot.data!;

          final listViewGdaGuestRow = listViewGdaGuestRowList.isNotEmpty
              ? listViewGdaGuestRowList.first
              : null;

          return ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        '${FFLocalizations.of(context).getVariableText(
                          enText: 'Guest #',
                          ptText: 'Hóspede #',
                        )}${widget!.index?.toString()}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Ubuntu',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Switch.adaptive(
                        value: _model.switchValue ??=
                            listViewGdaGuestRow!.isPortuguese,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue = newValue!);
                          if (newValue!) {
                            await GdaGuestTable().update(
                              data: {
                                'is_portuguese': true,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget!.guestId,
                              ),
                            );
                          } else {
                            await GdaGuestTable().update(
                              data: {
                                'is_portuguese': false,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget!.guestId,
                              ),
                            );
                          }
                        },
                        activeColor: Color(0xFF06E152),
                        activeTrackColor: Color(0xFF06E152),
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '1cxp9q0u' /* Are you a portuguese citizen? */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Ubuntu',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 100.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController1 ??=
                                TextEditingController(
                              text: listViewGdaGuestRow?.firstName,
                            ),
                            focusNode: _model.textFieldFocusNode1,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController1',
                              Duration(milliseconds: 2000),
                              () async {
                                await GdaGuestTable().update(
                                  data: {
                                    'first_name': _model.textController1.text,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.guestId,
                                  ),
                                );
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'q8e71e6v' /* First Name(s) */,
                              ),
                              alignLabelWithHint: true,
                              hintText: FFLocalizations.of(context).getText(
                                'leul9ml3' /* First Name(s) */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 1.0,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 100.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController2 ??=
                                TextEditingController(
                              text: listViewGdaGuestRow?.lastName,
                            ),
                            focusNode: _model.textFieldFocusNode2,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController2',
                              Duration(milliseconds: 2000),
                              () async {
                                await GdaGuestTable().update(
                                  data: {
                                    'last_name': _model.textController2.text,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.guestId,
                                  ),
                                );
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'b5dugqgv' /* Last Name */,
                              ),
                              alignLabelWithHint: true,
                              hintText: FFLocalizations.of(context).getText(
                                'm947uj3u' /* Last Name */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 1.0,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 100.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController3 ??=
                                TextEditingController(
                              text: listViewGdaGuestRow?.dob?.toString(),
                            ),
                            focusNode: _model.textFieldFocusNode3,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController3',
                              Duration(milliseconds: 2000),
                              () async {
                                await GdaGuestTable().update(
                                  data: {
                                    'last_name': _model.textController3.text,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.guestId,
                                  ),
                                );
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                '27bm29qx' /* Date of Birth */,
                              ),
                              alignLabelWithHint: true,
                              hintText: FFLocalizations.of(context).getText(
                                'xrljeeen' /* Date of Birth */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 1.0,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.datetime,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 100.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController4 ??=
                                TextEditingController(
                              text: listViewGdaGuestRow?.passportOrId,
                            ),
                            focusNode: _model.textFieldFocusNode4,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController4',
                              Duration(milliseconds: 2000),
                              () async {
                                await GdaGuestTable().update(
                                  data: {
                                    'last_name': _model.textController4.text,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.guestId,
                                  ),
                                );
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                '1tygt5b1' /* Passport Number or ID (europea... */,
                              ),
                              alignLabelWithHint: true,
                              hintText: FFLocalizations.of(context).getText(
                                'oznd0rks' /* Passport Number or ID (europea... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 1.0,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController4Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 100.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController5 ??=
                                TextEditingController(
                              text: listViewGdaGuestRow?.countryOfResidency,
                            ),
                            focusNode: _model.textFieldFocusNode5,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController5',
                              Duration(milliseconds: 2000),
                              () async {
                                await GdaGuestTable().update(
                                  data: {
                                    'last_name': _model.textController5.text,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.guestId,
                                  ),
                                );
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'u3su2s3v' /* Country of Residency */,
                              ),
                              alignLabelWithHint: true,
                              hintText: FFLocalizations.of(context).getText(
                                '44vjzwgz' /* Country of Residence */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 1.0,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController5Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 100.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController6 ??=
                                TextEditingController(
                              text: listViewGdaGuestRow!.isPortuguese
                                  ? 'Portugal'
                                  : listViewGdaGuestRow?.countryOfBirth,
                            ),
                            focusNode: _model.textFieldFocusNode6,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController6',
                              Duration(milliseconds: 2000),
                              () async {
                                await GdaGuestTable().update(
                                  data: {
                                    'last_name': _model.textController6.text,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.guestId,
                                  ),
                                );
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.go,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'e32hbmjq' /* Nationality */,
                              ),
                              alignLabelWithHint: true,
                              hintText: FFLocalizations.of(context).getText(
                                'qnfyydwb' /* Nationality */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 1.0,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController6Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
