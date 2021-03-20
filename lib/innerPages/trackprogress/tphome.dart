import 'package:flutter/material.dart';
import 'package:yoga/dashboard.dart';
import 'package:yoga/innerPages/training/pages/courses.dart';
import 'package:yoga/main.dart';
import 'package:yoga/controllers/auth.dart';
import './progress.dart';

class TPHome extends StatefulWidget {
  final String uid;

  const TPHome({Key key, this.uid}) : super(key: key);
  @override
  _TPHomeState createState() => _TPHomeState();
}

class _TPHomeState extends State<TPHome> {
  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => signOutUser().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MyHome()),
                  (Route<dynamic> route) => false);
            }),
          ),
        ],
      ),
      backgroundColor: Color(0xFF159957),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // colors: [gradientStartColor, gradientEndColor],
                colors: [Color(0xFF159957), Color(0xFF155799)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0 * 1.5),
          child: Column(
            children: [
              Text(
                "Your Progress",
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 44,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),              
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, 30, 25.0, 25.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.black,
              value: 0.6,
              minHeight: 8,
              semanticsLabel: 'hi',
              semanticsValue: 'ok',
            ),
          ),
              Progress(uid: widget.uid,),
            ],
          ),
        ),
      ),
    );
  }
}
