import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoblistWidget extends StatefulWidget {
  JoblistWidget({Key? key}) : super(key: key);

  @override
  _JoblistWidgetState createState() => _JoblistWidgetState();
}

class _JoblistWidgetState extends State<JoblistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  // Future<String> getCurrentUID() async {
  //   return (auth.currentUser)!.uid;
  // }

  // Map<String, dynamic> oneJob = {};
  // bool oneJobKey=false;
  // Future<void> getOneJob(Map<String, dynamic> data) async {
  //   // await Firebase.initializeApp().then((value) async {
  //   print("oneJob");
  //
  //   if(oneJob.isEmpty||oneJobKey) {
  //     await FirebaseFirestore.instance
  //         .collection('jobs')
  //         .doc(data['jobID'])
  //         .get()
  //         .then((DocumentSnapshot document) {
  //       setState(() {
  //         oneJob = document.data()! as Map<String, dynamic>;
  //         oneJobKey = false;
  //       });
  //       // print('test1 ${oneJob}');
  //     });
  //   }
  //   // print('test2 ${oneJob}');
  //   // });
  //   // print('test3 ${oneJob}');
  // }
  //
  // String appStage (Map<String, dynamic> data) {
  //   if(data['applicant']==2){
  //     return "Applicant - Fail";
  //   }else if(data['applicant']==0){
  //     return "Applicant - Pending";
  //   }else{
  //     if(data['seminar']==0){
  //       return "Seminar - Pending";
  //     }else{
  //       if(data['interview1']==2){
  //         return "Psychological Interview - Fail";
  //       }else if(data['interview1']==0){
  //         return "Psychological Interview - Pending";
  //       }else{
  //         if(data['interview2']==2){
  //           return "Company Interview - Fail";
  //         }else if(data['interview2']==0){
  //           return "Company Interview - Pending";
  //         }else{
  //           return "Employed";
  //         }
  //       }
  //     }
  //   }
  // }

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
                      'Joblist',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Expanded(
              child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************
                  StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('jobs').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return SingleChildScrollView(
                      child: Container(
                          height: 500.0, // Change as per your requirement
                          width: 350.0, // Change as per your requirement
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              var docID = document.id;
                              Map<String, dynamic> jobs =
                                  document.data()! as Map<String, dynamic>;

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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              bool enterJob =
                                                  await jobDetail('https://picsum.photos/seed/263/600',jobs);

                                              if (enterJob) {
                                                FirebaseFirestore.instance
                                                    .collection('applicants')
                                                    .add({
                                                      "applicant": 0,
                                                      "interview1": 0,
                                                      "interview2": 0,
                                                      "interview2Des": 0,
                                                      "interview2Des":
                                                          "No detail.",
                                                      "jobID": docID,
                                                      "notify": false,
                                                      "semDes": "No detail.",
                                                      "seminar": 0,
                                                      "userID":
                                                          (auth.currentUser)!
                                                              .uid,
                                                    })
                                                    .then((value) => {
                                                          print("Added " +
                                                              value.id)
                                                        })
                                                    .catchError((error) => {
                                                          print(
                                                              "Failed to add: $error")
                                                        });
                                                await Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LandingPageWidget(),
                                                  ),
                                                );
                                              }
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
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                30, 0, 0, 0),
                                                    child: Container(
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                30, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      20, 0, 0),
                                                          child: Text(
                                                            '${jobs['comName']}',
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Text(
                                                          'job: ${jobs['jobName']}',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        // Text(
                                                        //   'status: ${appStage(data)}',
                                                        //   style: TextStyle(fontSize: 14),
                                                        // )
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
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  Future<bool> jobDetail(String image, Map<String, dynamic> jobs) async {
    // int valueText = number;
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              clipBehavior:
              Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                image,
              ),
            ),
            title: Text(jobs['comName']),
            subtitle: Text(jobs['jobName']),
            // trailing: Icon(Icons.more_vert),
          ),
          content: SingleChildScrollView(
              child: Container(
                  height: 400.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: ListView(children: [
                    Container(
                      height: 300.0,
                      width: 100.0,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF3AE20)),
                        borderRadius: new BorderRadius.circular(8),
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
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(130, 40),
                                  primary: Color(0xFF6DBA45),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12))),
                              child: Text(
                                'Choose',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )),
                        ]),
                  ]))),
        );
      },
    );
  }
}
