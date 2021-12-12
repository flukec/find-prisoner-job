import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:final_app/model/email.dart';
// import 'home.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends StatefulWidget {
  SignupWidget({ Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  bool loadingButton1 = false;
  bool loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // String emailValue='';
  // String passwordValue='';

  final formKey = GlobalKey<FormState>();
  Email email = Email(password: '', email: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // final auth = FirebaseAuth.instance;

  @override
  void initState() {
    // print((auth.currentUser)!.uid);

    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return

              Scaffold(
                  key: scaffoldKey,
                  backgroundColor: Colors.white,
                  body: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 100, 20, 0),
              //       child:
              //
              // Scaffold(
              // appBar: AppBar(
              //   title: Text("Create account"),
              // ),
              // body:
              //
              // Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child:

                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                                  child: Text(
                                    'Sign up',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: "Enter email"),
                                      EmailValidator(errorText: "Invalid email form")
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (String? email) {
                                      this.email.email = email!;
                                    },
                                    controller: emailAddressController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF95A1AC),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFDCC6E),
                                      contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator:
                                    RequiredValidator(errorText: "Enter password"),
                                    // obscureText: true,
                                    onSaved: (String? password) {
                                      this.email.password = password!;
                                    },
                                    controller: passwordController,
                                    obscureText: !passwordVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFDCC6E),
                                      contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                              () => passwordVisibility = !passwordVisibility,
                                        ),
                                        child: Icon(
                                          passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF95A1AC),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() => loadingButton1 = true);
                                      try {

                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          try {
                                            await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                                email: this.email.email,
                                                password: this.email.password)
                                                .then((value) {

                                                  print("CHECK Uuid START");
                                                  print("TEST1 ${value.user}");

                                                  FirebaseFirestore.instance.collection('users')
                                                      .doc(value.user!.uid) // <-- Document ID
                                                      .set({
                                                    "citizenID": "",
                                                    "email": value.user!.email,
                                                    "isAdmin": false,
                                                    "name": "",
                                                    "surname": "",
                                                  }) // <-- Your data
                                                      .then((_) => print('Create User'))
                                                      .catchError((error) => print('Create failed: $error'));

                                                  print("TEST2 ${value.user!.uid}");
                                                  print("CHECK Uuid END");
                                              // final auth = FirebaseAuth.instance;
                                              // print((auth.currentUser)!.uid);

                                              formKey.currentState!.reset();
                                              Fluttertoast.showToast(
                                                  msg: "Account created",
                                                  gravity: ToastGravity.TOP);
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return LoginWidget();
                                                  }));
                                            });
                                          } on FirebaseAuthException catch (e) {
                                            print(e.code);
                                            String message;
                                            if (e.code == 'email-already-in-use') {
                                              message = "Email already used";
                                            } else if (e.code == 'weak-password') {
                                              message = "Require atleast 6 characters";
                                            } else {
                                              message = e.message!;
                                            }
                                            Fluttertoast.showToast(
                                                msg: message,
                                                gravity: ToastGravity.CENTER);
                                          }
                                        }

                                        // await Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => LoginWidget(),
                                        //   ),
                                        // );

                                      } finally {
                                        setState(() => loadingButton1 = false);
                                      }
                                    },
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      minimumSize: Size(210, 36),
                                      primary: Color(0xFFF3AE20),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() => loadingButton2 = true);
                                    try {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginWidget(),
                                        ),
                                      );
                                    } finally {
                                      setState(() => loadingButton2 = false);
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(70, 30),
                                    onPrimary: Color(0xFF39D2C0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                  ),
                ),
              // ),
              ),
              );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }


    //   Scaffold(
    //   key: scaffoldKey,
    //   backgroundColor: Colors.white,
    //   body: Padding(
    //     padding: EdgeInsetsDirectional.fromSTEB(20, 100, 20, 0),
    //     child:
    //
    //
    //
    //
    //   ),
    // );
  // }
}
////////////////////////////////////////////////////////////////////////////////
//
// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   final formKey = GlobalKey<FormState>();
//   Profile profile = Profile(password: '', email: '');
//   final Future<FirebaseApp> firebase = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: firebase,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text("Error"),
//               ),
//               body: Center(
//                 child: Text("${snapshot.error}"),
//               ),
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text("Create account"),
//               ),
//               body: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child:
//
//                     SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Email", style: TextStyle(fontSize: 20)),
//                           TextFormField(
//                             validator: MultiValidator([
//                               RequiredValidator(errorText: "Enter email"),
//                               EmailValidator(errorText: "Invalid email form")
//                             ]),
//                             keyboardType: TextInputType.emailAddress,
//                             onSaved: (String? email) {
//                               profile.email = email!;
//                             },
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text("Password", style: TextStyle(fontSize: 20)),
//                           TextFormField(
//                             validator:
//                             RequiredValidator(errorText: "Enter password"),
//                             obscureText: true,
//                             onSaved: (String? password) {
//                               profile.password = password!;
//                             },
//                           ),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               child: Text("Register",
//                                   style: TextStyle(fontSize: 20)),
//                               onPressed: () async {
//                                 if (formKey.currentState!.validate()) {
//                                   formKey.currentState!.save();
//                                   try {
//                                     await FirebaseAuth.instance
//                                         .createUserWithEmailAndPassword(
//                                         email: profile.email,
//                                         password: profile.password)
//                                         .then((value) {
//                                       formKey.currentState!.reset();
//                                       Fluttertoast.showToast(
//                                           msg: "Account created",
//                                           gravity: ToastGravity.TOP);
//                                       Navigator.pushReplacement(context,
//                                           MaterialPageRoute(builder: (context) {
//                                             return Home();
//                                           }));
//                                     });
//                                   } on FirebaseAuthException catch (e) {
//                                     print(e.code);
//                                     String message;
//                                     if (e.code == 'email-already-in-use') {
//                                       message = "Email already used";
//                                     } else if (e.code == 'weak-password') {
//                                       message = "Require atleast 6 characters";
//                                     } else {
//                                       message = e.message!;
//                                     }
//                                     Fluttertoast.showToast(
//                                         msg: message,
//                                         gravity: ToastGravity.CENTER);
//                                   }
//                                 }
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//
//
//                   ),
//                 ),
//               ),
//             );
//           }
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         });
//   }
// }


