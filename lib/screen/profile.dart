import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'landingpage.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String uploadedFileUrl = '';
  bool loadingButton1 = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  bool loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  // Future<String> getCurrentUID() async {
  //   return (auth.currentUser)!.uid;
  // }

  @override
  void initState() {
    super.initState();
    citizenIdController = TextEditingController();
    surnameController = TextEditingController();
    nameController = TextEditingController();
  }

  String name='';
  String surname='';
  String citizenID='';
  final formKey = GlobalKey<FormState>();
  bool isSave=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
        SingleChildScrollView(
          child:
        Column(
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
                      'Profile',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/blank-profile-picture-973460_1280.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text(
                    'Change Photo',
                    style: TextStyle(
                      fontSize: 14,
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),                                     
                  )
                ],
              ),
            ),

            /////////////////////////////////////////////////////////////////////////////////////////////////////

            // Expanded(
            //   child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************
              StreamBuilder<QuerySnapshot>(
                stream:
                FirebaseFirestore.instance.collection('users').where('email', isEqualTo: (auth.currentUser)!.email).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  Map<String, dynamic> users = Map();
                  snapshot.data!.docs.forEach((DocumentSnapshot document) {
                    users[document.id] = document.data()! as Map<String, dynamic>;
                    // apps.fromJson(c.documentID, c.data);
                  });

                  // users[(auth.currentUser)!.uid]['citizenID'];


                  if(isSave) {
                    // setState(() {
                      citizenIdController = TextEditingController(text: '${users[(auth.currentUser)!.uid]['citizenID']}');
                      surnameController = TextEditingController(text: '${users[(auth.currentUser)!.uid]['surname']}');
                      nameController = TextEditingController(text: '${users[(auth.currentUser)!.uid]['name']}');
                      isSave=false;
                    // });
                  }


                  return

                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(

                          // Container(
                          //     height: 500.0, // Change as per your requirement
                          //     width: 350.0, // Change as per your requirement
                          //     child: ListView(
                          //       scrollDirection: Axis.vertical,
                            children:[
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                                child: Text(
                                  // 'Email'
                                  '${users[(auth.currentUser)!.uid]['email']}',style: TextStyle(
                                  fontSize: 20,
                                ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                                child: TextFormField(
                                  onSaved: (String? value) {
                                      setState(() {
                                        name = value!;
                                      });
                                  },
                                  validator: (String? value){
                                    return value!.length < 1 ? 'name cannot be empty' : null;
                                  },
                                  controller: nameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                                  ),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF14181B),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                                child: TextFormField(
                                  onSaved: (String? value) {
                                      setState(() {
                                        surname = value!;
                                      });
                                  },
                                  validator: (String? value){
                                    return value!.length < 1 ? 'Surname cannot be empty' : null;
                                  },
                                  controller: surnameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Surname',
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF14181B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                                child: TextFormField(
                                  onSaved: (String? value) {
                                      setState(() {
                                        citizenID = value!;
                                      });
                                  },
                                  validator: (String? value){
                                    return value!.length < 13 ? 'Citizen ID must be 13 digits' : null;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    new LengthLimitingTextInputFormatter(13),
                                  ],
                                  controller: citizenIdController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Citizen ID',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF14181B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0.05),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        // isSave=true;
                                        formKey.currentState!.save();
                                        setState(() => loadingButton2 = true);
                                        try {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc((auth.currentUser)!.uid)
                                              .update({
                                            "name": name,
                                            "surname": surname,
                                            "citizenID": citizenID,
                                            "saveProfile": true,})
                                              .then((value) =>
                                              print("User Updated"))
                                              .catchError((error) =>
                                              print(
                                                  "Failed to update user: $error"));
                                          await Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LandingPageWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(() =>
                                          loadingButton2 = false);
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Save Changes',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      minimumSize: Size(340, 60),
                                      primary: Color(0xFFF3AE20),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]

                          // ),
                        ),

                      ),

                    );


                      //

                          //
                      //
                      //   snapshot.data!.docs
                          //       .map((DocumentSnapshot document) {
                          //     var docID = document.id;
                          //     Map<String, dynamic> jobs =
                          //     document.data()! as Map<String, dynamic>;
                          //
                          //     return Container(
                          //         height:
                          //         90.0, // Change as per your requirement
                          //         width:
                          //         350.0, // Change as per your requirement
                          //         child: ListView(
                          //             scrollDirection: Axis.horizontal,
                          //             children: <Widget>[
                          //               //////////////////////////////////////INNER
                          //               Padding(
                          //                 padding:
                          //                 EdgeInsetsDirectional.fromSTEB(
                          //                     0, 10, 0, 0),
                          //                 child: GestureDetector(
                          //                   onTap: () async {
                          //                     bool enterJob =
                          //                     await jobDetail('https://picsum.photos/seed/263/600',jobs);
                          //
                          //                     if (enterJob) {
                          //                       FirebaseFirestore.instance
                          //                           .collection('applicants')
                          //                           .add({
                          //                         "applicant": 0,
                          //                         "interview1": 0,
                          //                         "interview2": 0,
                          //                         "interview2Des": 0,
                          //                         "interview2Des":
                          //                         "No detail.",
                          //                         "jobID": docID,
                          //                         "notify": false,
                          //                         "semDes": "No detail.",
                          //                         "seminar": 0,
                          //                         "userID":
                          //                         (auth.currentUser)!
                          //                             .uid,
                          //                       })
                          //                           .then((value) => {
                          //                         print("Added " +
                          //                             value.id)
                          //                       })
                          //                           .catchError((error) => {
                          //                         print(
                          //                             "Failed to add: $error")
                          //                       });
                          //                       await Navigator.pushReplacement(
                          //                         context,
                          //                         MaterialPageRoute(
                          //                           builder: (context) =>
                          //                               LandingPageWidget(),
                          //                         ),
                          //                       );
                          //                     }
                          //                   },
                          //                   child: Container(
                          //                     width: 350,
                          //                     height: 90,
                          //                     decoration: BoxDecoration(
                          //                       color: Color(0xFFEEE9E9),
                          //                       boxShadow: [
                          //                         BoxShadow(
                          //                           color: Colors.transparent,
                          //                         )
                          //                       ],
                          //                       borderRadius:
                          //                       BorderRadius.circular(50),
                          //                       border: Border.all(
                          //                         color: Colors.transparent,
                          //                       ),
                          //                     ),
                          //                     child: Row(
                          //                       mainAxisSize: MainAxisSize.max,
                          //                       children: [
                          //                         Padding(
                          //                           padding:
                          //                           EdgeInsetsDirectional
                          //                               .fromSTEB(
                          //                               30, 0, 0, 0),
                          //                           child: Container(
                          //                             width: 60,
                          //                             height: 60,
                          //                             clipBehavior:
                          //                             Clip.antiAlias,
                          //                             decoration: BoxDecoration(
                          //                               shape: BoxShape.circle,
                          //                             ),
                          //                             child: Image.network(
                          //                               'https://picsum.photos/seed/263/600',
                          //                             ),
                          //                           ),
                          //                         ),
                          //                         Padding(
                          //                           padding:
                          //                           EdgeInsetsDirectional
                          //                               .fromSTEB(
                          //                               30, 0, 0, 0),
                          //                           child: Column(
                          //                             mainAxisSize:
                          //                             MainAxisSize.max,
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                 EdgeInsetsDirectional
                          //                                     .fromSTEB(0,
                          //                                     20, 0, 0),
                          //                                 child: Text(
                          //                                   '${jobs['comName']}',
                          //                                   style: TextStyle(
                          //                                       fontSize: 14),
                          //                                 ),
                          //                               ),
                          //                               Text(
                          //                                 'job: ${jobs['jobName']}',
                          //                                 style: TextStyle(
                          //                                     fontSize: 14),
                          //                               ),
                          //                               // Text(
                          //                               //   'status: ${appStage(data)}',
                          //                               //   style: TextStyle(fontSize: 14),
                          //                               // )
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //
                          //               //////////////////////////////////////INNER
                          //             ]));
                          //   ])
                          // )));
                },
              ),
            // ),

            /////////////////////////////////////////////////////////////////////////////////////////////////

            Align(
              alignment: AlignmentDirectional(0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
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
                    minimumSize: Size(160, 60),
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
      )
      ),
    );
  }
}

