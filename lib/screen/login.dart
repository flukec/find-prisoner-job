import 'package:final_app/model/profile.dart';
import 'package:final_app/screen/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:final_app/model/email.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
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
//                 title: Text("Login"),
//               ),
//               body: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Email", style: TextStyle(fontSize: 20)),
//                           TextFormField(
//                             validator: MultiValidator([
//                               RequiredValidator(errorText: "Enter Email"),
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
//                                 RequiredValidator(errorText: "Enter password"),
//                             obscureText: true,
//                             onSaved: (String? password) {
//                               profile.password = password!;
//                             },
//                           ),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               child:
//                                   Text("Login", style: TextStyle(fontSize: 20)),
//                               onPressed: () async {
//                                 if (formKey.currentState!.validate()) {
//                                   formKey.currentState!.save();
//                                   try {
//                                     await FirebaseAuth.instance
//                                         .signInWithEmailAndPassword(
//                                             email: profile.email,
//                                             password: profile.password)
//                                         .then((value) {
//                                       formKey.currentState!.reset();
//                                       Navigator.pushReplacement(context,
//                                           MaterialPageRoute(builder: (context) {
//                                         return Welcome();
//                                       }));
//                                     });
//                                   } on FirebaseAuthException catch (e) {
//                                     Fluttertoast.showToast(
//                                         msg: e.message!,
//                                         gravity: ToastGravity.CENTER);
//                                   }
//                                 }
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
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
/////////////////////////////////////////////////////////////



class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  bool loadingButton1 = false;
  bool loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Email email = Email(password: '', email: '');
  // String emailValue='';
  // String passwordValue='';
  final formKey = GlobalKey<FormState>();
  // Profile profile = Profile(password: '', email: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  void initState() {
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
                // body:
                // Scaffold(
                //   appBar: AppBar(
                //     title: Text("Login"),
                //   ),
                  body: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child:

                        // Column(
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Welcome \nto Another chance ',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                      child: TextFormField(
                                        validator: MultiValidator([
                                          RequiredValidator(errorText: "Enter Email"),
                                          EmailValidator(errorText: "Invalid email form")
                                        ]),
                                        keyboardType: TextInputType.emailAddress,
                                        onSaved: (String? email) {
                                          this.email.email = email!;
                                        },
                                        // onChanged: (value) {
                                        //   setState(() {
                                        //     emailValue = value;
                                        //   });
                                        // },
                                        controller: emailAddressController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email Address',
                                          labelStyle: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: Color(0x98FFFFFF),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFFDCC6E),
                                          contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF2B343A),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                                      child:

                                      // TextFormField(
                                      //   validator: MultiValidator([
                                      //     RequiredValidator(errorText: "Enter Email"),
                                      //     EmailValidator(errorText: "Invalid email form")
                                      //   ]),
                                      //   keyboardType: TextInputType.emailAddress,
                                      //   onSaved: (String? email) {
                                      //     profile.email = email!;
                                      //   },
                                      // ),

                                      TextFormField(
                                        validator: RequiredValidator(errorText: "Enter password"),
                                        // obscureText: true,
                                        onSaved: (String? password) {
                                          this.email.password = password!;
                                        },
                                        // onChanged: (value) {
                                        //   setState(() {
                                        //     passwordValue = value;
                                        //   });
                                        // },
                                        controller: passwordController,
                                        obscureText: !passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: Color(0x98FFFFFF),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFFDCC6E),
                                          contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                                  () => passwordVisibility = !passwordVisibility,
                                            ),
                                            child: Icon(
                                              passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons.visibility_off_outlined,
                                              color: Color(0x98FFFFFF),
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
// //////////////////////////////////////////////////////////
//                                     SizedBox(
//                                       width: double.infinity,
//                                       child: ElevatedButton(
//                                         child:
//                                         Text("Login", style: TextStyle(fontSize: 20)),
//                                         onPressed: () async {
//                                           if (formKey.currentState!.validate()) {
//                                             formKey.currentState!.save();
//                                             try {
//                                               await FirebaseAuth.instance
//                                                   .signInWithEmailAndPassword(
//                                                   email: profile.email,
//                                                   password: profile.password)
//                                                   .then((value) {
//                                                 formKey.currentState!.reset();
//                                                 Navigator.pushReplacement(context,
//                                                     MaterialPageRoute(builder: (context) {
//                                                       return Welcome();
//                                                     }));
//                                               });
//                                             } on FirebaseAuthException catch (e) {
//                                               Fluttertoast.showToast(
//                                                   msg: e.message!,
//                                                   gravity: ToastGravity.CENTER);
//                                             }
//                                           }
//                                         },
//                                       ),
//                                     )
//                                     //////////////////////////////////////////////////////////
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          print('Button-Login pressed ...');

                                          if (formKey.currentState!.validate()) {
                                            formKey.currentState!.save();
                                            try {
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                  email: this.email.email,
                                                  password: this.email.password)
                                                  .then((value) {
                                                formKey.currentState!.reset();
                                                Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) {
                                                      return Welcome();
                                                    }));
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              Fluttertoast.showToast(
                                                  msg: e.message!,
                                                  gravity: ToastGravity.CENTER);
                                            }
                                          }

                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 3,
                                          minimumSize: Size(230, 60),
                                          primary: Color(0xFFF3AE20),
                                          onPrimary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
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
                                                    builder: (context) => SignupWidget(),
                                                  ),
                                                );
                                              } finally {
                                                setState(() => loadingButton2 = false);
                                              }
                                            },
                                            child: Text(
                                              'Sign up',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
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
                            )
                        //   ],
                        // ),

                      ),
                    ),
                  ),
                // );

              );



            //   Scaffold(
            //   appBar: AppBar(
            //     title: Text("Login"),
            //   ),
            //   body: Container(
            //     child: Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Form(
            //         key: formKey,
            //         child: SingleChildScrollView(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text("Email", style: TextStyle(fontSize: 20)),
            //               TextFormField(
            //                 validator: MultiValidator([
            //                   RequiredValidator(errorText: "Enter Email"),
            //                   EmailValidator(errorText: "Invalid email form")
            //                 ]),
            //                 keyboardType: TextInputType.emailAddress,
            //                 onSaved: (String? email) {
            //                   profile.email = email!;
            //                 },
            //               ),
            //               SizedBox(
            //                 height: 15,
            //               ),
            //               Text("Password", style: TextStyle(fontSize: 20)),
            //               TextFormField(
            //                 validator:
            //                 RequiredValidator(errorText: "Enter password"),
            //                 obscureText: true,
            //                 onSaved: (String? password) {
            //                   profile.password = password!;
            //                 },
            //               ),
            //               SizedBox(
            //                 width: double.infinity,
            //                 child: ElevatedButton(
            //                   child:
            //                   Text("Login", style: TextStyle(fontSize: 20)),
            //                   onPressed: () async {
            //                     if (formKey.currentState!.validate()) {
            //                       formKey.currentState!.save();
            //                       try {
            //                         await FirebaseAuth.instance
            //                             .signInWithEmailAndPassword(
            //                             email: profile.email,
            //                             password: profile.password)
            //                             .then((value) {
            //                           formKey.currentState!.reset();
            //                           Navigator.pushReplacement(context,
            //                               MaterialPageRoute(builder: (context) {
            //                                 return Welcome();
            //                               }));
            //                         });
            //                       } on FirebaseAuthException catch (e) {
            //                         Fluttertoast.showToast(
            //                             msg: e.message!,
            //                             gravity: ToastGravity.CENTER);
            //                       }
            //                     }
            //                   },
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // );


          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });

  }
}

