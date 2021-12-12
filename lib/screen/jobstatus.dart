import 'landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobstatusWidget extends StatefulWidget {
  const JobstatusWidget({  Key? key, required Map<String, dynamic> this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _JobstatusWidgetState createState() => _JobstatusWidgetState(data);
}

class _JobstatusWidgetState extends State<JobstatusWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> data;

  _JobstatusWidgetState(this.data);

  String stageStatus (int status) {
    if(status==0){
      return "Pending";
    }else if(status==1){
      return "Passed";
    }else{
      return "Fail";
    }
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
                      'Jobstatus',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(60, 0, 20, 0),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Check applicant',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
                        child: Text(
                          'Status: ${stageStatus(data['applicant'])}',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(60, 0, 20, 0),
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Seminar',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'Status: ${stageStatus(data['seminar'])}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(103, 30),
                          primary: Colors.grey,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0))),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(60, 0, 20, 0),
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Physological interview',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 150, 0),
                        child: Text(
                          'Status: ${stageStatus(data['interview1'])}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(60, 0, 20, 0),
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Company interview',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 120, 0),
                        child: Text(
                          'Status: ${stageStatus(data['interview2'])}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> appDetail(Map<String, dynamic> jobs) async {
    // int valueText = number;
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Job Detail'),
          content: SingleChildScrollView(
              child:
              Container(
                  height: 100.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: ListView(children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: Text(jobs['jobDes']),
                    ),
                    // TextFormField(
                    //   // initialValue: number.toString(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         valueText = int.parse(value);
                    //       });
                    //     },
                    //     controller:
                    //     TextEditingController(text: number.toString()),
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: <TextInputFormatter>[
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     decoration: InputDecoration(
                    //         labelText: "number",
                    //         hintText: "any number",
                    //         icon: Icon(Icons.calculate))
                    // ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(103, 30),
                                  primary: Colors.grey,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0))),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(103, 30),
                                  primary: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0))),
                              child: Text(
                                'Choose',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                        ]),
                  ]))),
        );
      },
    );
  }
}

