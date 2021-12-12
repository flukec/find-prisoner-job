// import 'applicant.dart';
// import 'joblist.dart';
// import 'profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'applicant.dart';
import 'joblist.dart';
import 'jobstatus.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({Key? key}) : super(key: key);

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  // Future<String> getCurrentUID() async {
  //   return (auth.currentUser)!.uid;
  // }

  // Map<String, dynamic> jobDetail = {};
  // bool jobKey=false;
  // Future<void> getOneJob(Map<String, dynamic> data) async {
  //   // await Firebase.initializeApp().then((value) async {
  //   print("oneJob");
  //
  //   if(jobDetail.isEmpty||jobKey) {
  //     await FirebaseFirestore.instance
  //         .collection('jobs')
  //         .doc(data['jobID'])
  //         .get()
  //         .then((DocumentSnapshot document) {
  //       setState(() {
  //         jobDetail = document.data()! as Map<String, dynamic>;
  //         jobKey = false;
  //       });
  //       // print('test1 ${oneJob}');
  //     });
  //   }
  //   // print('test2 ${oneJob}');
  //   // });
  //   // print('test3 ${oneJob}');
  // }

  String appStatus (Map<String, dynamic> data) {
    if(data['applicant']==2){
      return "Applicant - Fail";
    }else if(data['applicant']==0){
      return "Applicant - Pending";
    }else{
      if(data['seminar']==0){
        return "Seminar - Pending";
      }else{
        if(data['interview1']==2){
          return "Psychological Interview - Fail";
        }else if(data['interview1']==0){
          return "Psychological Interview - Pending";
        }else{
          if(data['interview2']==2){
            return "Company Interview - Fail";
          }else if(data['interview2']==0){
            return "Company Interview - Pending";
          }else{
            return "Employed";
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
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
                        ////***********************************************************************************************************************
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProfileWidget(),
                        //   ),
                        // );
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
                    ////***********************************************************************************************************************
                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => JoblistWidget(),
                    //   ),
                    // );
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

              Expanded(
                child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************

                StreamBuilder<QuerySnapshot> (
                  stream: FirebaseFirestore.instance
                      .collection('applicants')
                      .where('userID', isEqualTo: (auth.currentUser)!.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot1) {
                    if (snapshot1.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot1.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    // Map<String, dynamic> apps = Map();
                    // snapshot1.data!.docs.forEach((DocumentSnapshot document) {
                    //   apps[document.id] = document.data()! as Map<String, dynamic>;
                    //       // apps.fromJson(c.documentID, c.data);
                    // });

                    return StreamBuilder<QuerySnapshot> (
                      stream: FirebaseFirestore.instance
                          .collection('jobs')
                          .snapshots(),

                      // FirebaseFirestore.instance
                      //     .collection('applicants')
                      //     .where('userID', isEqualTo: (auth.currentUser)!.uid)
                      //     .snapshots(),

                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot2) {
                        if (snapshot2.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot2.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        Map<String, dynamic> jobs = Map();
                        snapshot2.data!.docs.forEach((DocumentSnapshot document) {
                          jobs[document.id] = document.data()! as Map<String, dynamic>;
                          // apps.fromJson(c.documentID, c.data);
                        });

                        return
                      SingleChildScrollView(
                        child:

                        Container(
                            height: 500.0, // Change as per your requirement
                            width: 300.0, // Change as per your requirement
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: snapshot1.data!.docs
                                  .map((DocumentSnapshot document) {
                                // var doc_id = document.id;
                                Map<String, dynamic> apps =
                                document.data()! as Map<String, dynamic>;

                                // print("TESTHERE1");
                                //
                                // print(apps['jobID']);
                                // print(jobs[apps['jobID']]);
                                // print(jobs[apps['jobID']]['comName']);
                                //
                                // print("TESTHERE2");
                                return Container(
                                    height:
                                    90.0, // Change as per your requirement
                                    width:
                                    350.0, // Change as per your requirement
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[

                                          //////////////////////////////////////INNER
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                            child:
                                            GestureDetector(
                                              onTap: () async {
                                                await Navigator.pushReplacement(context,
                                                    MaterialPageRoute(
                                                      builder: (context) => JobstatusWidget(
                                                          app: apps),
                                                    ),
                                                  );
                                                },
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
                                                              '${jobs[apps['jobID']]['comName']}',
                                                              style: TextStyle(fontSize: 14),
                                                            ),
                                                          ),
                                                          Text(
                                                            'job: ${jobs[apps['jobID']]['jobName']}',
                                                            style: TextStyle(fontSize: 14),
                                                          ),
                                                          Text(
                                                            'status: ${appStatus(apps)}',
                                                            style: TextStyle(fontSize: 14),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                          //////////////////////////////////////INNER
                                        ]));

                              }).toList(),
                            )));
                      },
                    );
                  },
                ),

              ),

              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              //   child: Container(
              //     width: 350,
              //     height: 90,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFEEE9E9),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.transparent,
              //         )
              //       ],
              //       borderRadius: BorderRadius.circular(50),
              //       border: Border.all(
              //         color: Colors.transparent,
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.max,
              //       children: [
              //         Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              //           child: Container(
              //             width: 60,
              //             height: 60,
              //             clipBehavior: Clip.antiAlias,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //             ),
              //             child: Image.network(
              //               'https://picsum.photos/seed/263/600',
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.max,
              //             children: [
              //               Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              //                 child: Text(
              //                   'wiriya turakit company',
              //                   style: TextStyle(fontSize: 20.0),
              //                 ),
              //               ),
              //               Text(
              //                 'job: Account',
              //                 style: TextStyle(fontSize: 20.0),
              //               ),
              //               Text(
              //                 'status',
              //                 style: TextStyle(fontSize: 20.0),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              //   child: Container(
              //     width: 350,
              //     height: 90,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFEEE9E9),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.transparent,
              //         )
              //       ],
              //       borderRadius: BorderRadius.circular(50),
              //       border: Border.all(
              //         color: Colors.transparent,
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.max,
              //       children: [
              //         Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              //           child: Container(
              //             width: 60,
              //             height: 60,
              //             clipBehavior: Clip.antiAlias,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //             ),
              //             child: Image.network(
              //               'https://picsum.photos/seed/263/600',
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.max,
              //             children: [
              //               Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              //                 child: Text(
              //                   'wiriya turakit company',
              //                   style: TextStyle(fontSize: 14),
              //                 ),
              //               ),
              //               Text(
              //                 'job: Account',
              //                 style: TextStyle(fontSize: 14),
              //               ),
              //               Text(
              //                 'status',
              //                 style: TextStyle(fontSize: 14),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Expanded(
              //   child:
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(250, 0, 0, 0),
                      child: CircleAvatar(
                radius: 30,
                backgroundColor:  Color(0xFFF3AE20),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  ),
                    onPressed: () async {
                      // print((auth.currentUser)!.uid);
                      ////***********************************************************************************************************************
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              // builder: (context) => ApplicantWidget(),
                              builder: (context) => JoblistWidget(),
                              ),
                          );
                  },
                ),
              ),                    
                    )
                  ],
                ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

