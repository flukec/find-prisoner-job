import 'checkapplicantlistadmin.dart';
import 'companyinterviewlist.dart';
import 'joblistadmin.dart';
import 'physologicalinterviewlist.dart';
import 'seminarlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingpageadminWidget extends StatefulWidget {
  LandingpageadminWidget({Key key}) : super(key: key);

  @override
  _LandingpageadminWidgetState createState() => _LandingpageadminWidgetState();
}

class _LandingpageadminWidgetState extends State<LandingpageadminWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  bool _loadingButton5 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Welcome to\ncheck page',
                        style: FlutterFlowTheme.title1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 190, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton1 = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JoblistadminWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton1 = false);
                        }
                      },
                      text: 'Job list',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFFF3AE20),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFFEFEFE),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                      loading: _loadingButton1,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton2 = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CheckappicantlistadminWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton2 = false);
                        }
                      },
                      text: 'Check Applicant',
                      options: FFButtonOptions(
                        width: 320,
                        height: 90,
                        color: Color(0xFFF3AE20),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFFEFEFE),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                      loading: _loadingButton2,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton3 = true);
                    try {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeminarlistWidget(),
                        ),
                      );
                    } finally {
                      setState(() => _loadingButton3 = false);
                    }
                  },
                  text: 'Seminar',
                  options: FFButtonOptions(
                    width: 320,
                    height: 90,
                    color: Color(0xFFF3AE20),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFEFEFE),
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                  loading: _loadingButton3,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton4 = true);
                    try {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PhysologicalInterviewlistWidget(),
                        ),
                      );
                    } finally {
                      setState(() => _loadingButton4 = false);
                    }
                  },
                  text: 'Physological Interview',
                  options: FFButtonOptions(
                    width: 320,
                    height: 90,
                    color: Color(0xFFF3AE20),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFEFEFE),
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                  loading: _loadingButton4,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton5 = true);
                    try {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompanyInterviewlistWidget(),
                        ),
                      );
                    } finally {
                      setState(() => _loadingButton5 = false);
                    }
                  },
                  text: 'Company Interview',
                  options: FFButtonOptions(
                    width: 320,
                    height: 90,
                    color: Color(0xFFF3AE20),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFEFEFE),
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                  loading: _loadingButton5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
