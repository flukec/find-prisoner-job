import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'landingpageadmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhysologicalInterviewlistWidget extends StatefulWidget {
  PhysologicalInterviewlistWidget({ Key? key}) : super(key: key);

  @override
  _PhysologicalInterviewlistWidgetState createState() =>
      _PhysologicalInterviewlistWidgetState();
}

class _PhysologicalInterviewlistWidgetState
    extends State<PhysologicalInterviewlistWidget> {
  bool loadingButton1 = false;
  bool loadingButton2 = false;
  bool loadingButton3 = false;
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
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingpageadminWidget(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Physical Interview',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************

              StreamBuilder<QuerySnapshot> (
                stream: FirebaseFirestore.instance
                    .collection('applicants')
                    .where('stage', isEqualTo: 3)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot1) {
                  if (snapshot1.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot1.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  Map<String, dynamic> apps2 = Map();
                  snapshot1.data!.docs.forEach((DocumentSnapshot document) {
                    apps2[document.id] = document.data()! as Map<String, dynamic>;
                  });

                  return StreamBuilder<QuerySnapshot> (
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot2) {
                      if (snapshot2.hasError) {
                        return Text('Something went wrong');
                      }
                      if (snapshot2.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      Map<String, dynamic> users = Map();
                      snapshot2.data!.docs.forEach((DocumentSnapshot document) {
                        users[document.id] = document.data()! as Map<String, dynamic>;
                        // apps.fromJson(c.documentID, c.data);
                      });

                      return
                        SingleChildScrollView(
                            child:
                            Column(
                              children: [
                                Container(
                                    height: 600.0, // Change as per your requirement
                                    width: 350.0, // Change as per your requirement
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children:
                                      snapshot1.data!.docs.map((DocumentSnapshot document) {

                                        Map<String, dynamic> apps = document.data()! as Map<String, dynamic>;

                                        // print(users[apps['userID']]['name']);

                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print('Button pressed ...');
                                              checkInter(apps,document.id,users);
                                              print("555555555555555555555555555555555555555555555555555555555555555555555");
                                              print(apps);
                                              print(document.id);

                                            },
                                            child: Text(
                                              'Mr. ${users[apps['userID']]['name']}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(300, 60),
                                              primary: Color(0xFFF3AE20),
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        );

                                      }).toList(),
                                    )),


                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                //   child: ElevatedButton(
                                //     onPressed: () {
                                //       addSeminar(apps);
                                //     },
                                //     child: Text(
                                //       'Add seminar',
                                //       style: TextStyle(
                                //         fontSize: 16,
                                //         fontFamily: 'Poppins',
                                //       ),
                                //     ),
                                //     style: ElevatedButton.styleFrom(
                                //       minimumSize: Size(300, 60),
                                //       primary: Color(0xFFF3AE20),
                                //       onPrimary: Colors.white,
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(12),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                              ],
                            )


                        );
                    },
                  );
                },
              ),

            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkInter(Map<String, dynamic> apps, String appID,Map<String, dynamic> users) async {
    String comNameVal = "";
    String jobNameVal = "";
    String jobDesVal = "";
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            title: Text("Check Psychological Interview"),
            trailing: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 40),
                    primary: Colors.grey,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(12))),
                child: Text(
                  'Closed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          ),
          content: SingleChildScrollView(
              child: Container(
                  height: 100.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () async {

                                    await FirebaseFirestore.instance
                                        .collection('applicants')
                                        .doc(appID)
                                        .update({'interview1': 2,
                                      'stage': 0})
                                        .then((value) =>
                                        print("User Updated"))
                                        .catchError((error) => print(
                                        "Failed to update user: $error"));

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
                                    'Fail',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )),
                              ElevatedButton(
                                  onPressed: () async {

                                    await FirebaseFirestore.instance
                                        .collection('applicants')
                                        .doc(appID)
                                        .update({'interview1': 1,
                                      'stage': 4})
                                        .then((value) =>
                                        print("User Updated"))
                                        .catchError((error) => print(
                                        "Failed to update user: $error"));

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
                                    'Passed',
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
