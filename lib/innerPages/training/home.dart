import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoga/controllers/auth.dart';
import 'package:camera/camera.dart';

import '../../dashboard.dart';
import '../../main.dart';
import 'constants.dart';
import 'pages/courses.dart';
import 'pages/diffstyles.dart';

class TrainingHomePage extends StatefulWidget {
  final String uid;
  final List<CameraDescription> cameras;

  const TrainingHomePage({Key key, this.uid, this.cameras}) : super(key: key);

  @override
  _TrainingHomePageState createState() => _TrainingHomePageState();
}

class _TrainingHomePageState extends State<TrainingHomePage> {
  int selsctedIconIndex = 2;

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
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // colors: [gradientStartColor, gradientEndColor],
                colors: [Color(0xFF159957), Color(0xFF155799)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: Padding(
          padding: EdgeInsets.only(top: appPadding * 1.5),
          child: Column(
            children: [
              DiffStyles(uid: widget.uid, cameras: widget.cameras,),
              Courses(uid: widget.uid, cameras: widget.cameras,),
            ],
          ),
        ),
      ),
    );
  }
}
