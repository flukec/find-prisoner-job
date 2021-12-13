import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:final_app/screen/login.dart';


// import 'model/profile.dart';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'login.dart';

//PAGES
//class LoginWidget
//class SignupWidget



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBCY4hbqCg1Xs5wc7SlB4etTpr6S2DgyMs",
        authDomain: "anotherchance-df3cc.firebaseapp.com",
        projectId: "anotherchance-df3cc",
        storageBucket: "anotherchance-df3cc.appspot.com",
        messagingSenderId: "879570579499",
        appId: "1:879570579499:web:7a026df6d5c85bfe0bba6e"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      LoginWidget(),
          // MyHomePage(title: 'Flutter Demo Home Page'),
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

  int _counter = 0;

  Map<String, dynamic> jobs = new Map();

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
  Map<String, dynamic> oneJob = new Map();
  Future<void> getOneJob(data) async {
    // await Firebase.initializeApp().then((value) async {
    Map<String, dynamic> data2;
    await FirebaseFirestore.instance
        .collection('jobs')
        .doc(data['jobID'])
        .get()
        .then((DocumentSnapshot document) {
      // oneJob=document.data()! as Map<String, dynamic>;
      setState(() {
        oneJob = document.data()! as Map<String, dynamic>;
      });
      // print('test1 ${oneJob}');
    });
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
                        "jobID": 'Rx27NISLdNSXqVgllxqQ',
                        "notify": false,
                        "semDes": "",
                        "seminar": 0,
                        "userID": this.user,
                      })
                      .then((value) => {print("Added " + value.id)})
                      .catchError((error) => {print("Failed to add: $error")});
                }),
            Expanded(
              child: //สำหรับ get ที่เปลี่ยนไปเรื่อยๆ******************************************
                  StreamBuilder<QuerySnapshot>(
                stream: _appsStream,
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
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              var doc_id = document.id;
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;

                              getOneJob(data);

                              Map<String, dynamic> _data1 = new Map();
                              snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data1 =
                                    document.data()! as Map<String, dynamic>;
                                print(data1);
                              });

                              //GET MANY JOBS
                              // FirebaseFirestore.instance
                              //      .collection('jobs')
                              //      .get()
                              //      .then((QuerySnapshot querySnapshot){querySnapshot.docs.forEach((doc){
                              //            print(doc.data());
                              //      });
                              // });

                              //GET ONE JOB
                              // FirebaseFirestore.instance
                              //     .collection('jobs').doc(data['jobID'])
                              //     .get()
                              //     .then((DocumentSnapshot document){
                              //         Map<String, dynamic> data2=document.data()! as Map<String, dynamic>;
                              //         name=data2['jobName'];
                              //         print(data2);
                              //     }
                              // );

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