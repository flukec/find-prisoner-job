import 'physologicalinterviewlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhysologicalInterviewWidget extends StatefulWidget {
  PhysologicalInterviewWidget({ Key? key}) : super(key: key);

  @override
  _PhysologicalInterviewWidgetState createState() =>
      _PhysologicalInterviewWidgetState();
}

class _PhysologicalInterviewWidgetState
    extends State<PhysologicalInterviewWidget> {
  TextEditingController textController = TextEditingController();
  bool loadingButton1 = false;
  bool loadingButton2 = false;
  bool loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
                          builder: (context) => PhysologicalInterviewlistWidget(),
                        ),
                      );
                    },
                  ),
                  Text(
                    'Physological Interview',
                    style: TextStyle(fontSize:24),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '[Some hint text...]',
                    hintStyle: TextStyle(fontSize: 14),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text(
                    'Send message',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 50),
                    primary: Color(0xFFF3AE20),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),                     
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text(
                    'Pass',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 40),
                    primary: Color(0xFF6DBA45),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),                     
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      child: Text(
                    'Fail',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 40),
                    primary: Color(0xFFBF2F2F),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),                                           
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
