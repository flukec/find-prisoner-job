import 'landingpageadmin.dart';
import 'addjobadmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoblistadminWidget extends StatefulWidget {
  JoblistadminWidget({Key key}) : super(key: key);

  @override
  _JoblistadminWidgetState createState() => _JoblistadminWidgetState();
}

class _JoblistadminWidgetState extends State<JoblistadminWidget> {
  bool _loadingButton = false;
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
                      'Joblist',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    width: 350,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEE9E9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                        )
                      ],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: Container(
                            width: 60,
                            height: 60,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/263/600',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'wiriya turakit company',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Text(
                                'job: Account',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 450, 0, 0),
                    child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                 child: Text(
                    'Add job',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 70),
                    primary: Color(0xFFF3AE20),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),              
              ),
            ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
