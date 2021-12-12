import 'landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicantWidget extends StatefulWidget {
  const ApplicantWidget({Key? key}) : super(key: key);

  @override
  _ApplicantWidgetState createState() => _ApplicantWidgetState();
}

class _ApplicantWidgetState extends State<ApplicantWidget> {
  String dropDownValue1 = "choose job";
  String dropDownValue2 = "choose company";
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  bool isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

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
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    iconSize: 40,
                    onPressed: () async {
                      await Navigator.pushReplacement(
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
                      'Applicant',
                      style: TextStyle(
                        fontSize: 24,
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Job:',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            'Company:',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            'Name:',
                            style: TextStyle(fontSize: 14.0)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            'surname:',
                            style: TextStyle(fontSize: 14.0)
                          ),
                        )
                      ],
                    ),
                  ),             
                  
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: DropdownButton<String>(
                          value: dropDownValue1 ,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 2,
                          style: const TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'Poppins',),
                          underline: Container(
                            width: 200,
                            height: 40,
                            color: Color(0xFFF3AE20),
                            
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue1 = "choose job";
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          ),
                        ),                

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: DropdownButton<String>(
                          value: dropDownValue2 ,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 2,
                          style: const TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'Poppins',),
                          underline: Container(
                            width: 200,
                            height: 40,
                            color: Color(0xFFF3AE20),
                            
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue2 = "choose company";
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          ),
                        ),

                        Container(
                          width: 200,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '[Some hint text...]',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',                  
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 50),
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
    );
  }
}

