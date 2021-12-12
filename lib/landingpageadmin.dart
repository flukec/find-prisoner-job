import 'checkapplicantlistadmin.dart';
import 'companyinterviewlist.dart';
import 'joblistadmin.dart';
import 'profile.dart';
import 'physologicalinterviewlist.dart';
import 'seminarlist.dart';
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
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
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
                  ),
                  
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 190, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() => loadingButton1 = true);
                        try {
                          await Navigator.push(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        setState(() => loadingButton2 = true);
                        try {
                          await Navigator.push(
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
                    try {
                      await Navigator.push(
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
                    try {
                      await Navigator.push(
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
                    try {
                      await Navigator.push(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
