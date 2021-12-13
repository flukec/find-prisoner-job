import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'landingpageadmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeminarlistWidget extends StatefulWidget {
  SeminarlistWidget({ Key? key}) : super(key: key);

  @override
  _SeminarlistWidgetState createState() => _SeminarlistWidgetState();
}

class _SeminarlistWidgetState extends State<SeminarlistWidget> {
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
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Text(
                      'Seminar',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),

            ////////////////////////////////////////////////////////////////
            Expanded(
              child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************

              StreamBuilder<QuerySnapshot> (
                stream: FirebaseFirestore.instance
                    .collection('applicants')
                    .where('stage', isEqualTo: 2)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot1) {
                  if (snapshot1.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot1.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  Map<String, dynamic> apps = Map();
                  snapshot1.data!.docs.forEach((DocumentSnapshot document) {
                    apps[document.id] = document.data()! as Map<String, dynamic>;
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

                                        print(users[apps['userID']]['name']);

                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                          child: ElevatedButton(
                                            onPressed: null,
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


                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      addSeminar(apps);
                                    },
                                    child: Text(
                                      'Add seminar',
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
                                ),

                              ],
                            )


                        );
                    },
                  );
                },
              ),

            ),
            ////////////////////////////////////////////////////////////////

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       print('Button pressed ...');
            //     },
            //     child: Text(
            //         'Mr.Bun',
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontFamily: 'Poppins',
            //         ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         minimumSize: Size(300, 60),
            //         primary: Color(0xFFF3AE20),
            //         onPrimary: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //       ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       print('Button pressed ...');
            //     },
            //       child: Text(
            //         'Mr.Bun',
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontFamily: 'Poppins',
            //         ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         minimumSize: Size(300, 60),
            //         primary: Color(0xFFF3AE20),
            //         onPrimary: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //   ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       print('Button pressed ...');
            //     },
            //     child: Text(
            //         'Mr.Bun',
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontFamily: 'Poppins',
            //         ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         minimumSize: Size(300, 60),
            //         primary: Color(0xFFF3AE20),
            //         onPrimary: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //       ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future<bool> addSeminar(Map<String, dynamic> apps) async {
    // String comNameVal = "";
    // String jobNameVal = "";
    String jobDesVal = "";
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Seminar"),
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
                          TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  jobDesVal = value.toString();
                                });
                              },
                              minLines: 13,
                              maxLines: null,  // allow user to enter 5 line in textfield
                              keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                labelText: "Seminar Description",
                                hintText: "Describe the detail of seminar.",
                                // fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Color(0xFFF3AE20),
                                    width: 1.0,
                                  ),
                                ),
                              )
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
                                  onPressed: () async {

                                    // print("hello1");
                                    // //
                                    // print(comNameVal);
                                    // print(jobDesVal);
                                    // print(jobNameVal);

                                    apps.forEach((key, value) {

                                      FirebaseFirestore.instance
                                          .collection('applicants')
                                          .doc(key)
                                          .update({'semDes': jobDesVal,
                                        'seminar': 1,
                                        'stage': 3})
                                          .then((value) =>
                                          print("User Updated"))
                                          .catchError((error) => print(
                                          "Failed to update user: $error"));

                                    });

                                    //
                                    // print("hello2");
                                    //
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
                                    'Apply',
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
