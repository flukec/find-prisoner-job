// import 'dart:async';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'login.dart';

//PAGES
//class LoginWidget
//class SignupWidget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        // apiKey: "XXX",
        // appId: "XXX",
        // messagingSenderId: "XXX",
        // projectId: "XXX",
        //
        apiKey: "AIzaSyBCY4hbqCg1Xs5wc7SlB4etTpr6S2DgyMs",
        authDomain: "anotherchance-df3cc.firebaseapp.com",
        projectId: "anotherchance-df3cc",
        storageBucket: "anotherchance-df3cc.appspot.com",
        messagingSenderId: "879570579499",
        appId: "1:879570579499:web:7a026df6d5c85bfe0bba6e"),
  );

  var abc=await FirebaseFirestore.instance.collection('jobs').get();
  print(abc);

  runApp(MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // LoginWidget(),
          MyHomePage(title: 'Flutter Demo Home Page'),
      // FirstRoute(),
    );
  }
}

//EXAMPLE SENDING DATA THROUGH PAGE
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String user = 'hjbI9lUI8tV6icyxiAB8';
  //สำหรับ get****************************************
  final Stream<QuerySnapshot> _appsStream = FirebaseFirestore.instance
      .collection('applicants')
      .where('userID', isEqualTo: 'hjbI9lUI8tV6icyxiAB8')
      .snapshots();
  //CollectionReference applicants = FirebaseFirestore.instance.collection('applicants');
  int _counter = 0;

  // final CollectionReference jobCol = FirebaseFirestore.instance
  //     .collection('jobs')
  //     .where('userID', isEqualTo: 'hjbI9lUI8tV6icyxiAB8') as CollectionReference<Object?>;
  //
  // Stream<QuerySnapshot> get jobStream{
  //   return jobCol.snapshots();
  // }

  Map<String, dynamic> jobs=new Map();

  @override
  void initState() {
    super.initState();

  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//******************************************************************************FOR GETTING MORE THAN 1 COLLECTION**************************************
  Map<String, dynamic> oneJob=new Map();
  Future<void> getOneJob(data) async {
    // await Firebase.initializeApp().then((value) async {
      Map<String, dynamic> data2;
      await FirebaseFirestore.instance
          .collection('jobs').doc(data['jobID'])
          .get()
          .then((DocumentSnapshot document){
              // oneJob=document.data()! as Map<String, dynamic>;
              setState(() {
                oneJob=document.data()! as Map<String, dynamic>;
              });
              // print('test1 ${oneJob}');
          }
      );
      // print('test2 ${oneJob}');
    // });
    // print('test3 ${oneJob}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SecondRoutePage()),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondRoutePage(
                      counter: _counter,
                      title: '',
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
                child: Text("Add Applicants"),
                // onPressed: () {
                //   //call method flutter upload
                // }
                onPressed: () {
                  //สำหรับ add ***************************************************
                  FirebaseFirestore.instance
                      .collection('applicants')
                      .add({
                        "applicant": 0,
                        "interview1": 0,
                        "interview2": 0,
                        "interview2Des": 0,
                        "interview2Des": "TESTTEST",
                        "jobID": 'Rx27NISLdNSXqVgllxqQ',
                        "notify": false,
                        "semID": "",
                        "seminar": 0,
                        "userID": this.user,
                      })
                      .then((value) => {print("Added " + value.id)})
                      .catchError((error) => {print("Failed to add: $error")});

                  // firestoreInstance.collection("users").add(
                  //     {
                  //       "applicant" : 0,
                  //       "interview1" : 0,
                  //       "interview2" : 0,
                  //       "interview2Des" : 0,
                  //       "interview2Des" : "TESTTEST",
                  //       "JobID" : "Rx27NISLdNSXqVgllxqQ",
                  //       "notify" : false,
                  //       "semID" : "",
                  //       "seminar" : 0,
                  //       "userID" : this.user,
                  //     }
                  // ).then((value){
                  //   print(value.id);
                  // });
                }),
            Expanded(
              child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************
                  StreamBuilder<QuerySnapshot>(
                stream:
                _appsStream,
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
                          width: 300.0, // Change as per your requirement
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              var doc_id = document.id;
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                              // FirebaseFirestore.instance
                              //      .collection('jobs')
                              //      .get()
                              //      .then((QuerySnapshot querySnapshot){querySnapshot.docs.forEach((doc){
                              //            print(doc.data());
                              //      });
                              // });


                              getOneJob(data);

                              // String jobName='1';
                              Map<String, dynamic> _data1=new Map();
                              snapshot.data!.docs.map((DocumentSnapshot document) {
                                Map<String, dynamic> data1 = document.data()! as Map<String, dynamic>;
                                print(data1);
                                // setState(() async {
                                //   jobName=data1['jabName'];
                                //   print(jobName);
                                // });
                              });
                              // print(jobName);

                              // Map<String, dynamic> jobs = document.data()! as Map<String, dynamic>;

                              // Map<String, dynamic> data2;
                              // String name="";
                              // FirebaseFirestore.instance
                              //     .collection('jobs').doc(data['jobID'])
                              //     .get()
                              //     .then((DocumentSnapshot document){
                              //         Map<String, dynamic> data2=document.data()! as Map<String, dynamic>;
                              //         name=data2['jobName'];
                              //         print(data2);
                              //     }
                              // );

                              // print(data['jobID']);

                              return Container(
                                  height:
                                      30.0, // Change as per your requirement
                                  width:
                                      300.0, // Change as per your requirement
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        Text(
                                            "ID: ${doc_id}, JobName: ${oneJob['jobName']}, applicant: ${data['applicant']}"),
                                        //Update ********************************************************************************
                                        ElevatedButton(
                                          child: const Text('Update'),
                                          onPressed: () async {
                                            int number = await _getNumber(
                                                data['applicant']);

                                            FirebaseFirestore.instance
                                                .collection('applicants')
                                                .doc(doc_id)
                                                .update({'applicant': number})
                                                .then((value) =>
                                                    print("User Updated"))
                                                .catchError((error) => print(
                                                    "Failed to update user: $error"));
                                          },
                                        ),
                                        //Delete *********************************************************************************
                                        ElevatedButton(
                                          child: const Text('Delete'),
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('applicants')
                                                .doc(doc_id)
                                                .delete()
                                                .then((value) =>
                                                    print("Apps Deleted"))
                                                .catchError((error) => print(
                                                    "Failed to delete apps: $error"));
                                          },
                                        ),
                                      ]));

                              // return ListTile(
                              //   title: Text(doc_id),
                              //   subtitle: Text(data['jobID']),
                              // );
                            }).toList(),
                          )));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Function<void> _getJobs(String a) {
  //   // List<dynamic> joblist=[];
  //   Map<String, dynamic> joblist2=new Map();
  //   FirebaseFirestore.instance
  //       .collection('jobs')
  //       .get()
  //       .then((QuerySnapshot querySnapshot){
  //         querySnapshot.docs.forEach((doc){
  //           joblist2[doc.id] = doc.data();
  //         // print(doc.data());
  //       });
  //       print("test1");
  //       print(joblist2);
  //       return joblist2;
  //   });
  //   print("test2");
  //   print(joblist2);
  //   return joblist2;
  // }

  Future<void> _getJobs() async {
    // String uid = FirebaseAuth.instance.currentUser.uid;
    Map<String, dynamic> joblist2=new Map();
    await FirebaseFirestore.instance
        .collection('jobs')
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc){
        if(doc.exists) { // this will check availability of document
          joblist2[doc.id] = doc.data();
        }else{
        }
      });
      print("test1");
      print(joblist2);
      jobs=joblist2;
      // return joblist2;
    });
    // if(doc.exists) { // this will check availability of document
    //   branch = doc.data()['Branch'];
    //   semester = doc.data()['Semester'];
    // }else{
    //   branch = "User is not available";
    //   semester = "User is not available";
    // }
    setState((){});
  }

  Future<int> _getNumber(int number) async {
    int valueText = number;
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Test Update'),
          content: SingleChildScrollView(
              child: Container(
                  height: 100.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: ListView(children: [
                    TextFormField(
                        // initialValue: number.toString(),
                        onChanged: (value) {
                          setState(() {
                            valueText = int.parse(value);
                          });
                        },
                        controller:
                            TextEditingController(text: number.toString()),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            labelText: "number",
                            hintText: "any number",
                            icon: Icon(Icons.calculate))),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, valueText);
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
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
        );
      },
    );
  }



}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _appStream = FirebaseFirestore.instance.collection('applicants').snapshots();
  final Stream<QuerySnapshot> _jobStream = FirebaseFirestore.instance.collection('jobs').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _appStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot1) {

        if (snapshot1.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return StreamBuilder<QuerySnapshot>(
          stream: _jobStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot2) {

            Map<String, dynamic> data1;
            if (snapshot1.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }


            Map<String, dynamic> data2;

            snapshot1.data!.docs.map((DocumentSnapshot document) {
              data1 = document.data()! as Map<String, dynamic>;
            });
            snapshot2.data!.docs.map((DocumentSnapshot document) {
              data2 = document.data()! as Map<String, dynamic>;
            });

            return ListView(
              children: snapshot1.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                snapshot2.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data2 = document.data()! as Map<String, dynamic>;


                });
                return ListTile(
                  title: Text(data['full_name']),
                  subtitle: Text(data['company']),
                );
              }).toList(),
            );

          },
        );
      },
    );
  }
}
class SecondRoutePage extends StatefulWidget {
  SecondRoutePage({Key? key, required this.title, required this.counter})
      : super(key: key);
  final String title;
  final int counter;

  @override
  _SecondRouteState createState() => _SecondRouteState(counter);
}

class _SecondRouteState extends State<SecondRoutePage> {
  int counter;
  _SecondRouteState(this.counter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Second Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(counter.toString()),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}

class Count {
  final int count;
  const Count(this.count);
}

/////////////////////////////////////////////////////////////////////////////////////////////
//
// class LoginWidget extends StatefulWidget {
//   LoginWidget({Key key}) : super(key: key);
//
//   @override
//   _LoginWidgetState createState() => _LoginWidgetState();
// }
//
// class _LoginWidgetState extends State<LoginWidget> {
//   TextEditingController emailAddressController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool passwordVisibility;
//   bool loadingButton1 = false;
//   bool loadingButton2 = false;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     emailAddressController = TextEditingController();
//     passwordController = TextEditingController();
//     passwordVisibility = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Color(0xFFD7D7D7),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Welcome \nto Another chance ',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontFamily: 'Poppins',
//                             color: Colors.black,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
//                           child: Text(
//                             'Sign In',
//                             style: TextStyle(fontSize: 24),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
//                     child: TextFormField(
//                       controller: emailAddressController,
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         labelText: 'Email Address',
//                         labelStyle: TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'Poppins',
//                           color: Color(0x98FFFFFF),
//                           fontWeight: FontWeight.normal,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xFFDBE2E7),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xFFDBE2E7),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         filled: true,
//                         fillColor: Color(0xFFFDCC6E),
//                         contentPadding:
//                         EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
//                       ),
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontFamily: 'Poppins',
//                         color: Color(0xFF2B343A),
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
//                     child: TextFormField(
//                       controller: passwordController,
//                       obscureText: !passwordVisibility,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         labelStyle: TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'Poppins',
//                           color: Color(0x98FFFFFF),
//                           fontWeight: FontWeight.normal,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         filled: true,
//                         fillColor: Color(0xFFFDCC6E),
//                         contentPadding:
//                         EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
//                         suffixIcon: InkWell(
//                           onTap: () => setState(
//                                 () => passwordVisibility = !passwordVisibility,
//                           ),
//                           child: Icon(
//                             passwordVisibility
//                                 ? Icons.visibility_outlined
//                                 : Icons.visibility_off_outlined,
//                             color: Color(0x98FFFFFF),
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         print('Button-Login pressed ...');
//                       },
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         elevation: 3,
//                         minimumSize: Size(230, 60),
//                         primary: Color(0xFFF3AE20),
//                         onPrimary: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Don\'t have an account?',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                             color: Colors.black,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () async {
//                             setState(() => loadingButton2 = true);
//                             try {
//                               await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignupWidget(),
//                                 ),
//                               );
//                             } finally {
//                               setState(() => loadingButton2 = false);
//                             }
//                           },
//                           child: Text(
//                             'Sign up',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             elevation: 0,
//                             minimumSize: Size(70, 30),
//                             onPrimary: Color(0xFF39D2C0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class SignupWidget extends StatefulWidget {
//   SignupWidget({Key key}) : super(key: key);
//
//   @override
//   _SignupWidgetState createState() => _SignupWidgetState();
// }
//
// class _SignupWidgetState extends State<SignupWidget> {
//   TextEditingController emailAddressController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool passwordVisibility;
//   bool loadingButton1 = false;
//   bool loadingButton2 = false;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     emailAddressController = TextEditingController();
//     passwordController = TextEditingController();
//     passwordVisibility = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Color(0xFFD7D7D7),
//       body: Padding(
//         padding: EdgeInsetsDirectional.fromSTEB(20, 100, 20, 0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 30),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
//                       child: Text(
//                         'Sign up',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontFamily: 'Poppins',
//                           color: Colors.black,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: emailAddressController,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           labelText: 'Email Address',
//                           labelStyle: TextStyle(
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                             color: Color(0xFF95A1AC),
//                             fontWeight: FontWeight.normal,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           filled: true,
//                           fillColor: Color(0xFFFDCC6E),
//                           contentPadding:
//                           EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
//                         ),
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFF2B343A),
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: passwordController,
//                         obscureText: !passwordVisibility,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           labelStyle: TextStyle(
//                             fontFamily: 'Poppins',
//                             color: Color(0xFF95A1AC),
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           filled: true,
//                           fillColor: Color(0xFFFDCC6E),
//                           contentPadding:
//                           EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
//                           suffixIcon: InkWell(
//                             onTap: () => setState(
//                                   () => passwordVisibility = !passwordVisibility,
//                             ),
//                             child: Icon(
//                               passwordVisibility
//                                   ? Icons.visibility_outlined
//                                   : Icons.visibility_off_outlined,
//                               color: Color(0xFF95A1AC),
//                               size: 22,
//                             ),
//                           ),
//                         ),
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFF2B343A),
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           setState(() => loadingButton1 = true);
//                           try {
//                             await Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LoginWidget(),
//                               ),
//                             );
//                           } finally {
//                             setState(() => loadingButton1 = false);
//                           }
//                         },
//                         child: Text(
//                           'Create Account',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           elevation: 3,
//                           minimumSize: Size(210, 36),
//                           primary: Color(0xFFF3AE20),
//                           onPrimary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Already have an account?',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () async {
//                         setState(() => loadingButton2 = true);
//                         try {
//                           await Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginWidget(),
//                             ),
//                           );
//                         } finally {
//                           setState(() => loadingButton2 = false);
//                         }
//                       },
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         minimumSize: Size(70, 30),
//                         onPrimary: Color(0xFF39D2C0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
