// import 'checkapplicantlistadmin.dart';
// import 'companyinterviewlist.dart';
// import 'joblistadmin.dart';
import 'package:final_app/screen/physologicalinterviewlist.dart';
import 'package:final_app/screen/seminarlist.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'checkapplicantlistadmin.dart';
import 'companyinterviewlist.dart';
import 'joblistadmin.dart';
import 'login.dart';
// import 'physologicalinterviewlist.dart';
// import 'seminarlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingpageadminWidget extends StatefulWidget {
  LandingpageadminWidget({Key? key}) : super(key: key);

  @override
  _LandingpageadminWidgetState createState() => _LandingpageadminWidgetState();
}

class _LandingpageadminWidgetState extends State<LandingpageadminWidget> {
  bool loadingButton1 = false;
  bool loadingButton2 = false;
  bool loadingButton3 = false;
  bool loadingButton4 = false;
  bool loadingButton5 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  // Future<String> getCurrentUID() async {
  //   return (auth.currentUser)!.uid;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.9, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                        child: Text(
                          'Welcome to\ncheck page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(100, 20, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() => loadingButton1 = true);
                              try {/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JoblistadminWidget(),
                                  ),
                                );
                              } finally {
                                setState(() => loadingButton1 = false);
                              }
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
                      ],
                    ),

                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          setState(() => loadingButton2 = true);
                          try {////////////////////////////////////////////////////////////////////////////////////////////////////////////
                            await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CheckapplicantlistadminWidget(),
                              ),
                            );
                          } finally {
                            setState(() => loadingButton2 = false);
                          }
                        },
                        child: Text(
                          'Check Applicant',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(320, 90),
                          primary: Color(0xFFF3AE20),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() => loadingButton3 = true);
                      try {//////////////////////////////////////////////////////////////////////////////////////////////
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeminarlistWidget(),
                          ),
                        );
                      } finally {
                        setState(() => loadingButton3 = false);
                      }
                    },
                    child: Text(
                      'Seminar',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 90),
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
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() => loadingButton4 = true);
                      try {//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PhysologicalInterviewlistWidget(),
                          ),
                        );
                      } finally {
                        setState(() => loadingButton4 = false);
                      }
                    },
                    child: Text(
                      'Physological Interview',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 90),
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
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() => loadingButton5 = true);
                      try {//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyInterviewlistWidget(),
                          ),
                        );
                      } finally {
                        setState(() => loadingButton5 = false);
                      }
                    },
                    child: Text(
                      'Company Interview',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 90),
                      primary: Color(0xFFF3AE20),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(190, 160, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        auth.signOut().then((value) async {
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginWidget(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        minimumSize: Size(130, 40),
                        primary: Color(0xFFF3AE20),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
