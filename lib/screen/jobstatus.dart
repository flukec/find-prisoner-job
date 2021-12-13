import 'landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobstatusWidget extends StatefulWidget {
  const JobstatusWidget({  Key? key, required Map<String, dynamic> this.app, required Map<String, dynamic> this.job, required String this.image}) : super(key: key);
  // const JobstatusWidget({  Key? key, required List<dynamic> this.list}) : super(key: key);
  final Map<String, dynamic> app;
  final Map<String, dynamic> job;
  final String image;
  // final List<dynamic> list;

  @override
  _JobstatusWidgetState createState() => _JobstatusWidgetState(app,job,image);
}

class _JobstatusWidgetState extends State<JobstatusWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // List<dynamic> list;

  _JobstatusWidgetState( this.app, this.job, this.image );

  Map<String, dynamic> app;
  Map<String, dynamic> job;
  String image;

  final Map<String, int> colorMap = {
    "Fail": 0xFFBF2F2F,
    "Pending": 0xFFF3AE20,
    "Passed": 0xFF6DBA45,
  };

  @override
  void initState() {
    super.initState();
  }

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
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                        child:
                        Container(
                              width: 60,
                              height: 60,
                              clipBehavior:
                              Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/263/600',
                              ),
                            ),
                        ),
                        Column(
                          children: [
                            Text('${job['comName']}',style: TextStyle(
                              fontSize: 24,
                            ),),
                            Text('${job['jobName']}',style: TextStyle(
                              fontSize: 20,
                            ),)
                          ],
                        )
                      ],
                    )



                    // ListTile(
                    //   title:Text('Job Status'),
                    //   subtitle: Text('Sub'),
                    // ),

                    // Text('Job Status',style: TextStyle(
                    //   fontSize: 24,
                    // ),),
                    // ListTile(
                    //   leading:
                    //   Container(
                    //     width: 60,
                    //     height: 60,
                    //     clipBehavior:
                    //     Clip.antiAlias,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Image.network(
                    //       'https://picsum.photos/seed/263/600',
                    //     ),
                    //   ),
                    //   title:
                    //   Text('TITLE'),
                    //   // Text(job['comName']),
                    //   subtitle:
                    //   Text('SUBTITLE'),
                    //   // Text(job['comName']),
                    //   // trailing: Icon(Icons.more_vert),
                    // )
                    // Text(
                    //   'Jobstatus',
                    //   style: TextStyle(fontSize: 24.0),
                    // ),
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
                        child:

                        Text.rich(
                            TextSpan(
                                text: 'Status: ',
                                style: TextStyle(fontSize: 20.0),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '${stageStatus(app['applicant'])}',
                                    style: TextStyle(fontSize: 20.0, color:Color(colorMap[stageStatus(app['applicant'])]!)),

                                  )
                                ]
                            )
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

                      Text.rich(
                          TextSpan(
                              text: 'Status: ',
                              style: TextStyle(fontSize: 20.0),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '${stageStatus(app['seminar'])}',
                                  style: TextStyle(fontSize: 20.0, color:Color(colorMap[stageStatus(app['seminar'])]!)),

                                )
                              ]
                          )
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                    child: ElevatedButton(
                        onPressed: (app['applicant']!=1)? null : () {
                          appDetail("Seminar Detail",app['semDes'],);
                          // Navigator.pop(context, false);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(30, 30),
                            primary: Colors.grey,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0))),
                        child: Text(
                          'Detail',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
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
                        child:

                        Text.rich(
                            TextSpan(
                                text: 'Status: ',
                                style: TextStyle(fontSize: 20.0),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '${stageStatus(app['interview1'])}',
                                    style: TextStyle(fontSize: 20.0, color:Color(colorMap[stageStatus(app['interview1'])]!)),

                                  )
                                ]
                            )
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 100, 0),
                        child:

                        Text.rich(
                            TextSpan(
                                text: 'Status: ',
                                style: TextStyle(fontSize: 20.0),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '${stageStatus(app['interview2'])}',
                                    style: TextStyle(fontSize: 20.0, color:Color(colorMap[stageStatus(app['interview2'])]!)),

                                  )
                                ]
                            )
                        ),

                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  //   child:
                    ElevatedButton(
                        onPressed: (app['interview1']!=1)? null : () {
                          appDetail("Company Interview Detail",app['interview2Des'],);
                          // Navigator.pop(context, false);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(30, 30),
                            primary: Colors.grey,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0))),
                        child: Text(
                          'Detail',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<bool> appDetail(String title, String detail) async {
  //   // int valueText = number;
  //   return await showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return
  //         AlertDialog(
  //           title: Text(title),
  //           content: SingleChildScrollView(
  //               child: Container(
  //                   height: 400.0, // Change as per your requirement
  //                   width: 300.0, // Change as per your requirement
  //                   child: ListView(children: [
  //                     Container(
  //                       height: 300.0,
  //                       width: 100.0,
  //                       margin: const EdgeInsets.all(15.0),
  //                       padding: const EdgeInsets.all(3.0),
  //                       decoration: BoxDecoration(
  //                         border: Border.all(color: Color(0xFFF3AE20)),
  //                         borderRadius: new BorderRadius.circular(8),
  //                       ),
  //                       child: Text(detail),
  //                     ),
  //                     Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: <Widget>[
  //                           ElevatedButton(
  //                               onPressed: () {
  //                                 Navigator.pop(context, true);
  //                               },
  //                               style: ElevatedButton.styleFrom(
  //                                   minimumSize: Size(130, 40),
  //                                   primary: Color(0xFFBF2F2F),
  //                                   padding: EdgeInsets.symmetric(
  //                                     horizontal: 30,
  //                                     vertical: 8,
  //                                   ),
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                       new BorderRadius.circular(12))),
  //                               child: Text(
  //                                 'Close',
  //                                 style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 16,
  //                                 ),
  //                               )),
  //                         ]),
  //                   ]))),
  //         );
  //     },
  //   );
  // }

  Future<bool> appDetail(String title, String detail) async {
    String comNameVal = "";
    String jobNameVal = "";
    String jobDesVal = "";
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
              child: Container(
                  height: 400.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: Column(
                    children: [
                      Container(
                        height: 300.0,
                        width: 300.0,
                        child: ListView(children: [
                          Container(
                            height: 270.0,
                            width: 300.0,
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFF3AE20)),
                              borderRadius: new BorderRadius.circular(8),
                            ),
                            child: Text(detail),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(130, 40),
                                      primary: Color(0xFFBF2F2F),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 8,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(12))),
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )),
                            ]),
                      )
                    ],
                  )
              )),
        );
      },
    );
  }

}
