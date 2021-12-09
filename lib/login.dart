import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility;
  bool _loadingButton1 = false; 
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFD7D7D7),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                    child: TextFormField(
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button-Login pressed ...');
                      },
                      text: 'Login',
                      options: FFButtonOptions(
                        width: 230,
                        height: 60,
                        color: Color(0xFFF3AE20),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                      loading: _loadingButton1,
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
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton2 = true);
                            try {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupWidget(),
                                ),
                              );
                            } finally {
                              setState(() => _loadingButton2 = false);
                            }
                          },
                          text: 'Sign up',
                          options: FFButtonOptions(
                            width: 70,
                            height: 30,
                            color: Color(0x00FFFFFF),
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Color(0xFF39D2C0),
                              fontWeight: FontWeight.bold,
                            ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 0,
                          ),
                          loading: _loadingButton2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

