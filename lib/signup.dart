import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoga/main.dart';
import 'controllers/auth.dart';
import 'signin_button.dart';
import 'teddy_controller.dart';
import 'tracking_text_input.dart';


class SignUp extends StatefulWidget {

  final String title;
  SignUp({this.title});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TeddyController _teddyController;

  @override
  void initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/om.png"),
        ),
        title: Text(
          "YogGuru",
          style: TextStyle(
            fontFamily: "tepeno",
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF159957),
      ),
      backgroundColor: Color(0xFF159957),
      body: Container(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.0, 1.0],
                        colors: [Color(0xFF159957), Color(0xFF155799)],
                      ),
                    ),
                  )),
              Positioned.fill(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 200,
                              padding: const EdgeInsets.only(left: 30.0, right:30.0),
                              child: FlareActor(
                                "assets/Teddy.flr",
                                shouldClip: false,
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.contain,
                                controller: _teddyController,
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Form(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        TrackingTextInput(
                                            label: "Name",
                                            hint: "Type your Username here",
                                            onCaretMoved: (Offset caret) {
                                              _teddyController.lookAt(caret);
                                            },
                                            onTextChanged: (String value) {
                                              _teddyController.setSUUsername(value);
                                            },
                                        ),
                                        TrackingTextInput(
                                          label: "Email",
                                          hint: "Type your Email Id here",
                                          onCaretMoved: (Offset caret) {
                                            _teddyController.lookAt(caret);
                                          },
                                          onTextChanged: (String value) {
                                            _teddyController.setSUEmail(value);
                                          },
                                        ),
                                        TrackingTextInput(
                                          label: "Password",
                                          hint: "Type your Password here",
                                          isObscured: true,
                                          onCaretMoved: (Offset caret) {
                                            _teddyController.coverEyes(caret != null);
                                            _teddyController.lookAt(null);
                                          },
                                          onTextChanged: (String value) {
                                            _teddyController.setSUPassword(value);
                                          },
                                        ),
                                        SigninButton(
                                          child: Text("SIGN UP",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                          onPressed: () {
                                            _teddyController.signup(context);
                                          }),
                                          SizedBox(height: 20,),
                                            InkWell(
                                              onTap: () {
                                                print('signin');
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (context) => MyHome()));
                                              },
                                              child: Text(
                                                "Sign In Here"
                                              ),
                                            )
                                      ],
                                    )),
                              )),
                        ])),
              ),
            ],
          )),
    );
  }
}

