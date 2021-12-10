import 'applicant.dart';
import 'joblist.dart';
import profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({Key key}) : super(key: key);

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Welcome!\nLet find the job',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/blank-profile-picture-973460_1280.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 190, 0),                
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JoblistWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'Job list',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 40),
                    primary: Color(0xFFF3AE20),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),      
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Your  applicant job',
                  style: TextStyle(fontSize: 20),
                ),
              ),
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
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Text(
                              'job: Account',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              'status',
                              style: TextStyle(fontSize: 20.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(250, 260, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        fillColor: Color(0xFFF3AE20),
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ApplicantWidget(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

