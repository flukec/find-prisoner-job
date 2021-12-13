import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'landingpageadmin.dart';
// import 'addjobadmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoblistadminWidget extends StatefulWidget {
  JoblistadminWidget({ Key? key}) : super(key: key);

  @override
  _JoblistadminWidgetState createState() => _JoblistadminWidgetState();
}

class _JoblistadminWidgetState extends State<JoblistadminWidget> {
  bool loadingButton = false;
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
        child: ListView(
          // mainAxisSize: MainAxisSize.max,
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
                          builder: (context) => LandingpageadminWidget(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Text(
                      'Add New Job',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),


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
                          height: 550.0, // Change as per your requirement
                          width: 350.0, // Change as per your requirement
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              // var docID = document.id;
                              Map<String, dynamic> jobs =
                              document.data()! as Map<String, dynamic>;

                              return Container(
                                  height:
                                  130.0, // Change as per your requirement
                                  width:
                                  350.0, // Change as per your requirement
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        //////////////////////////////////////INNER
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              // bool enterJob =
                                              await jobSee('https://picsum.photos/seed/263/600',jobs);

                                              // if (enterJob) {
                                              //   FirebaseFirestore.instance
                                              //       .collection('applicants')
                                              //       .add({
                                              //     "applicant": 0,
                                              //     "interview1": 0,
                                              //     "interview2": 0,
                                              //     "interview2Des": 0,
                                              //     "interview2Des": "No detail.",
                                              //     "jobID": docID,
                                              //     "notify": false,
                                              //     "semDes": "No detail.",
                                              //     "seminar": 0,
                                              //     "userID":
                                              //     (auth.currentUser)!
                                              //         .uid,
                                              //   })
                                              //       .then((value) => {
                                              //     print("Added " +
                                              //         value.id)
                                              //   })
                                              //       .catchError((error) => {
                                              //     print(
                                              //         "Failed to add: $error")
                                              //   });
                                              //   // await Navigator.pushReplacement(
                                              //   //   context,
                                              //   //   MaterialPageRoute(
                                              //   //     builder: (context) =>
                                              //   //         LandingPageWidget(),
                                              //   //   ),
                                              //   // );
                                              // }
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
                                                    padding: EdgeInsetsDirectional.fromSTEB(30, 5, 0, 5),
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
                                                            '${jobs['comName']}',
                                                            style: TextStyle(fontSize: 14),
                                                          ),
                                                        ),
                                                        Text(
                                                          'job: ${jobs['jobName']}',
                                                          style: TextStyle(fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(Icons.edit),
                                                    color: Colors.black,
                                                    iconSize: 30,
                                                    onPressed:() async {
                                                      await jobEdit('https://picsum.photos/seed/263/600',jobs,document.id);
                                                    },
                                                  ),
                                                  IconButton(
                                                      icon: const Icon(Icons.delete),
                                                      color: Colors.black,
                                                      iconSize: 30,
                                                      onPressed:() async {

                                                        bool confirm=await DeleteConfirmation();
                                                        if(confirm){
                                                        await FirebaseFirestore.instance
                                                            .collection('jobs')
                                                            .doc(document.id)
                                                            .delete()
                                                            .then((value) =>
                                                            print("Apps Deleted"))
                                                            .catchError((error) => print(
                                                            "Failed to delete apps: $error"));
                                                        }

                                                      },
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


            // Column(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Padding(
            //       padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            //       child: Container(
            //         width: 350,
            //         height: 90,
            //         decoration: BoxDecoration(
            //           color: Color(0xFFEEE9E9),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.transparent,
            //             )
            //           ],
            //           borderRadius: BorderRadius.circular(50),
            //           border: Border.all(
            //             color: Colors.transparent,
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Padding(
            //               padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
            //               child: Container(
            //                 width: 60,
            //                 height: 60,
            //                 clipBehavior: Clip.antiAlias,
            //                 decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                 ),
            //                 child: Image.network(
            //                   'https://picsum.photos/seed/263/600',
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.max,
            //                 children: [
            //                   Padding(
            //                     padding:
            //                         EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            //                     child: Text(
            //                       'wiriya turakit company',
            //                       style: TextStyle(fontSize: 14),
            //                     ),
            //                   ),
            //                   Text(
            //                     'job: Account',
            //                     style: TextStyle(fontSize: 14),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             IconButton(
            //         icon: const Icon(Icons.delete),
            //         color: Colors.black,
            //         iconSize: 30,
            //         onPressed: () {
            //                 print('IconButton pressed ...');
            //               },
            //       ),
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),



            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: ElevatedButton(
                onPressed: () async {
                  print('Button pressed ...');

                  await jobAdd();

                },
                 child: Text(
                    'Add job',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 70),
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
            )
          ],
        ),
      ),
    );
  }

  Future<bool> jobSee(String image, Map<String, dynamic> jobs) async {
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
          ),
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
                            child: Text(jobs['jobDes']),
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
                            ]),
                      )
                    ],
                  )
              )),
        );
      },
    );
  }

  Future<bool> jobEdit(String image, Map<String, dynamic> jobs, String jobID) async {
    String comNameVal = jobs['comName'];
    String jobNameVal = jobs['jobName'];
    String jobDesVal = jobs['jobDes'];
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
            title: TextFormField(
              // initialValue: number.toString(),
                onChanged: (value) {
                  setState(() {
                    comNameVal = value.toString();
                  });
                },
                controller:
                TextEditingController(text: jobs['comName']),
                decoration: InputDecoration(
                    labelText: "Company Name",
                    hintText: "Company Name",
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
                  contentPadding: EdgeInsets.all(5),
                )),
            subtitle: TextFormField(
              // initialValue: number.toString(),
                onChanged: (value) {
                  setState(() {
                    jobNameVal = value.toString();
                  });
                },
                controller:
                TextEditingController(text: jobs['jobName']),
                decoration: InputDecoration(
                  labelText: "Job Name",
                  hintText: "Job Name",
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
                  contentPadding: EdgeInsets.all(5),
                )),
          ),
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
                              controller: TextEditingController(text: jobs['jobDes'],),
                              decoration: InputDecoration(
                                labelText: "Job Description",
                                hintText: "Describe the detail of job.",
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

                                  await FirebaseFirestore.instance
                                      .collection('jobs')
                                      .doc(jobID)
                                      .update({
                                    'comName': comNameVal,
                                    'jobDes': jobDesVal,
                                    'jobName': jobNameVal,
                                  })
                                      .then((value) =>
                                      print("job Updated"))
                                      .catchError((error) => print(
                                      "Failed to update job: $error"));
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

  Future<bool> jobAdd() async {
    String comNameVal = "";
    String jobNameVal = "";
    String jobDesVal = "";
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
                'https://picsum.photos/seed/263/600',
              ),
            ),
            title: TextFormField(
              // initialValue: number.toString(),
                onChanged: (value) {
                  setState(() {
                    comNameVal = value.toString();
                  });
                },
                controller:
                TextEditingController(),
                decoration: InputDecoration(
                  labelText: "Company Name",
                  hintText: "Company Name",
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
                  contentPadding: EdgeInsets.all(5),
                )),
            subtitle: TextFormField(
              // initialValue: number.toString(),
                onChanged: (value) {
                  setState(() {
                    jobNameVal = value.toString();
                  });
                },
                controller:
                TextEditingController(),
                decoration: InputDecoration(
                  labelText: "Job Name",
                  hintText: "Job Name",
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
                  contentPadding: EdgeInsets.all(5),
                )),
            // trailing: Icon(Icons.more_vert),
          ),
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
                                labelText: "Job Description",
                                hintText: "Describe the detail of job.",
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

                                    await FirebaseFirestore.instance
                                        .collection('jobs')
                                        .add({
                                      'comName': comNameVal,
                                      'jobDes': jobDesVal,
                                      'jobName': jobNameVal,
                                    })
                                        .then((value) =>
                                        print("job Updated"))
                                        .catchError((error) => print(
                                        "Failed to update job: $error"));

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

  Future<bool> DeleteConfirmation() async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("Delete Confirmation",style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ))),
          content: SingleChildScrollView(
              child: Container(
                  height: 100.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: Column(
                    children: [
                      // Center(child: Text("Do you really want to delete this?",style: TextStyle(
                      //   color: Colors.red,
                      //   fontSize: 20,
                      // ),),),
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
                                      primary: Color(0xFFF3AE20),
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
                                      primary: Color(0xFFBF2F2F),
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
