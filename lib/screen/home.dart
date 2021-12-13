// import 'package:final_app/screen/login.dart';
// import 'package:final_app/screen/register.dart';
// import 'package:final_app/screen/signup.dart';
// import 'package:flutter/material.dart';
// ////***************************************************************DIDN'T USE*******************************************************
// class Home extends StatelessWidget {
//   const Home({Key? key, String? title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register/Login"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.add),
//                   label: Text("Create account", style: TextStyle(fontSize: 20)),
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return SignupWidget();
//                     }));
//                   },
//                 ),
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.login),
//                   label: Text("Login", style: TextStyle(fontSize: 20)),
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return LoginWidget();
//                     }));
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
