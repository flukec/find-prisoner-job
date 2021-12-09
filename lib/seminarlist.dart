import 'landingpageadmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeminarlistWidget extends StatefulWidget {
  SeminarlistWidget({Key key}) : super(key: key);

  @override
  _SeminarlistWidgetState createState() => _SeminarlistWidgetState();
}

class _SeminarlistWidgetState extends State<SeminarlistWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingpageadminWidget(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Text(
                      'Seminar',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Mr.Bun',
                options: FFButtonOptions(
                  width: 300,
                  height: 60,
                  color: Color(0xFFF3AE20),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
                loading: _loadingButton1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Mr.Bun',
                options: FFButtonOptions(
                  width: 300,
                  height: 60,
                  color: Color(0xFFF3AE20),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
                loading: _loadingButton2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Mr.Bun',
                options: FFButtonOptions(
                  width: 300,
                  height: 60,
                  color: Color(0xFFF3AE20),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
                loading: _loadingButton3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
