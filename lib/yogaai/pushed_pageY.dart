import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';
import 'package:yoga/services/camera.dart';

import 'package:yoga/services/render_data_yoga.dart';
import '../main.dart';
import 'package:yoga/controllers/auth.dart';
import 'package:yoga/services/render_data.dart';

class PushedPageY extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  final String yogaPose;
  final bool session;
  final int percent;
  const PushedPageY({this.cameras, this.title, this.yogaPose, this.session, this.percent});
  @override
  _PushedPageYState createState() => _PushedPageYState();
}

class _PushedPageYState extends State<PushedPageY> {
  List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    // print('Model Response: ' + res.toString());
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
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
      body: Stack(
        children: <Widget>[
          Camera(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          widget.session
              ? RenderDataYogaSession(
                  yogapose: widget.yogaPose,
                  percent: widget.percent,
                  cameras: widget.cameras,
                  data: _data == null ? [] : _data,
                  previewH: max(_imageHeight, _imageWidth),
                  previewW: min(_imageHeight, _imageWidth),
                  screenH: screen.height,
                  screenW: screen.width,
                )
              : RenderDataYoga(
                  data: _data == null ? [] : _data,
                  previewH: max(_imageHeight, _imageWidth),
                  previewW: min(_imageHeight, _imageWidth),
                  screenH: screen.height,
                  screenW: screen.width,
                )
        ],
      ),
    );
  }
}
