import 'landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoblistWidget extends StatefulWidget {
  JoblistWidget({Key key}) : super(key: key);

  @override
  _JoblistWidgetState createState() => _JoblistWidgetState();
}

class _JoblistWidgetState extends State<JoblistWidget> {
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
                          builder: (context) => LandingPageWidget(),
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
                              ),
                              Text(
                                'status',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
