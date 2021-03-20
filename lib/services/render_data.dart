import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:camera/camera.dart';
import 'package:yoga/main.dart';
import '../innerPages/yogasession/yogasan.dart';

class RenderDataYogaSession extends StatefulWidget {
  final FlutterTts flutterTts = FlutterTts();
  final List<CameraDescription> cameras;
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String yogapose;
  final int percent;

  RenderDataYogaSession(
      {this.data,
      this.previewH,
      this.previewW,
      this.screenH,
      this.screenW,
      this.cameras,
      this.yogapose,
      this.percent});
  @override
  _RenderDataYogaSessionState createState() => _RenderDataYogaSessionState();
}

class _RenderDataYogaSessionState extends State<RenderDataYogaSession> {
  Map<String, List<double>> inputArr;

  String succfailmssg;
  Color correctColor;
  Color armColor, shoulderColor, legColor;
  String memo;

  double leftShoulderY,
      rightShoulderY,
      leftWristX,
      leftWristY,
      rightWristX,
      rightWristY,
      leftAnkleX,
      rightAnkleX,
      leftKneeY,
//
      leftKneeX,
      rightKneeX,
      rightKneeY,
      leftelbowX,
      leftelbowY,
      rightelbowX,
      rightelbowY,

//
      leftHipY,
      rightHipY;

  bool wristAlignment,
      shoulderAlignment,
      armAlignment,
      kneeAndHipAlignment,
      ankleAlignment,
      done1,
      complete1,
      done2,
      complete2,
      done3,
      complete3,
      timeout1,
      timeout2,
      timeout3;

  int progress;

  var leftEyePos = Vector(0, 0);
  var rightEyePos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = new Map();
    correctColor = Colors.red;
    wristAlignment = false;
    shoulderAlignment = false;
    armAlignment = false;
    kneeAndHipAlignment = false;
    ankleAlignment = false;
    done1 = false;
    done2 = false;
    done3 = false;
    complete1 = false;
    complete2 = false;
    complete3 = false;
    timeout1 = false;
    timeout2 = false;
    timeout3 = false;
    armColor = Colors.red;
    shoulderColor = Colors.red;
    legColor = Colors.red;
    succfailmssg = widget.yogapose;
    memo = widget.yogapose;
    progress = 0;
    Future.delayed(Duration(seconds: 3), () {
      memo = 'Start forming the Pose';
      succfailmssg = '';
    });
    if (widget.yogapose == 'Urdhva Hastasana') {
      widget.flutterTts.speak('Salute Pose Started');
      Future.delayed(Duration(seconds: 3), () {
        widget.flutterTts.speak('Lift Your Arms straight upwards');
      });
    } else if (widget.yogapose == 'Virabhadrasana') {
      widget.flutterTts.speak('Warrior Pose Started');
    } else {
      widget.flutterTts.speak('Tree Pose Started');
      Future.delayed(Duration(seconds: 8), () {
        widget.flutterTts.speak('Your right ankle must be straight on the left knee');
      });
    }
    Future.delayed(Duration(seconds: 30), () {
      if ((widget.yogapose == 'Urdhva Hastasana' && !done1) ||
          (widget.yogapose == 'Virabhadrasana' && !done2) ||
          (widget.yogapose == 'Vrikshasan' && !done3)) {
        succfailmssg = 'OK, well tried !';
        widget.flutterTts.speak('No problem, Well Tried');
        if (widget.yogapose == 'Urdhva Hastasana') {
          Future.delayed(Duration(seconds: 3), () {
            // Navigator.pop(context);
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: cameras,
                            asan: 'Virabhadrasana',
                            yoganum: 2,
                            percent: widget.percent + progress,
                          )));
            });
          });
        } else if (widget.yogapose == 'Virabhadrasana') {
          Future.delayed(Duration(seconds: 3), () {
            // Navigator.pop(context);
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: cameras,
                            asan: 'Vrikshasan',
                            yoganum: 3,
                            percent: widget.percent + progress,
                          )));
            });
          });
        } else {
          Future.delayed(Duration(seconds: 3), () {
            // Navigator.pop(context);
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: cameras,
                            asan: 'Achievements',
                            yoganum: 0,
                            percent: widget.percent + progress,
                          )));
            });
          });
        }
      }
    });
    super.initState();
  }

  void _postureAccordingToExerciseFirst(Map<String, List<double>> poses) {
    setState(() {
      leftShoulderY = poses['leftShoulder'][1];
      rightShoulderY = poses['rightShoulder'][1];
      leftWristX = poses['leftWrist'][0];
      leftWristY = poses['leftWrist'][1];
      rightWristX = poses['rightWrist'][0];
      rightWristY = poses['leftWrist'][1];

      leftKneeX = poses['leftKnee'][0];
      leftKneeY = poses['leftKnee'][1];
      rightKneeX = poses['rightKnee'][0];
      rightKneeY = poses['rightKnee'][1];

      leftelbowX = poses['leftElbow'][0];
      leftelbowY = poses['leftElbow'][1];
      rightelbowX = poses['rightElbow'][0];
      rightelbowY = poses['rightElbow'][1];

      leftAnkleX = poses['leftAnkle'][0];
      rightAnkleX = poses['rightAnkle'][0];
      leftHipY = poses['leftHip'][1];
      rightHipY = poses['rightHip'][1];
    });

    if (leftelbowY > 200 &&
        leftelbowY < 360 &&
        rightelbowX < 165 &&
        (leftWristY < 150 || rightWristY < 150)) {
      armAlignment = true;
      setState(() {
        armColor = Colors.green;
      });
    } else {
      armAlignment = false;
      setState(() {
        armColor = Colors.red;
        memo = 'Arms must be upwards';
      });
    }

    if (leftShoulderY < 360) {
      wristAlignment = true;
      kneeAndHipAlignment = true;
      setState(() {
        shoulderColor = Colors.green;
        legColor = Colors.green;
      });
    } else {
      wristAlignment = false;
      kneeAndHipAlignment = false;
      setState(() {
        shoulderColor = Colors.red;
        legColor = Colors.red;
        memo = 'Keep back and legs parallel';
      });
    }
    // if (leftKneeX < 250 &&
    //     rightKneeX > 155) {
    //   kneeAndHipAlignment = true;
    //   setState(() {
    //     legColor = Colors.green;
    //   });
    // } else {
    //   kneeAndHipAlignment = true;
    //   setState(() {
    //     legColor = Colors.green;
    //     // memo = 'Keep legs straight';
    //   });
    // }
    if (wristAlignment && armAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        done1 = true;
        memo = 'Good';
        memo = 'Hold for 10 Sec.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now, hold for 10 seconds');
      });
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          legColor = Colors.transparent;
          armColor = Colors.transparent;
          shoulderColor = Colors.transparent;
          memo = 'Congratulations !';
          succfailmssg = 'Congratulations';
          widget.flutterTts.speak('Congratulations');
          widget.flutterTts.speak('You Successfully Formed The Pose');
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            complete1 = true;
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: cameras,
                            asan: 'Virabhadrasana',
                            yoganum: 2,
                            percent: widget.percent + progress,
                          )));
            });
          });
        });
      });
    } else if ((wristAlignment && armAlignment) ||
        (wristAlignment && kneeAndHipAlignment) ||
        (armAlignment && wristAlignment)) {
      setState(() {
        progress = 35;
      });
    } else if ((wristAlignment || armAlignment || kneeAndHipAlignment)) {
      setState(() {
        progress = 70;
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        progress = 0;
      });
    }
  }

  void _postureAccordingToExerciseSecond(Map<String, List<double>> poses) {
    setState(() {
      leftShoulderY = poses['leftShoulder'][1];
      rightShoulderY = poses['rightShoulder'][1];
      leftWristX = poses['leftWrist'][0];
      leftWristY = poses['leftWrist'][1];
      rightWristX = poses['rightWrist'][0];
      rightWristY = poses['leftWrist'][1];

      leftKneeX = poses['leftKnee'][0];
      leftKneeY = poses['leftKnee'][1];
      rightKneeX = poses['rightKnee'][0];
      rightKneeY = poses['rightKnee'][1];

      leftelbowX = poses['leftElbow'][0];
      leftelbowY = poses['leftElbow'][1];
      rightelbowX = poses['rightElbow'][0];
      rightelbowY = poses['rightElbow'][1];

      leftAnkleX = poses['leftAnkle'][0];
      rightAnkleX = poses['rightAnkle'][0];
      leftHipY = poses['leftHip'][1];
    });

    print('left wrist ===');
    print('${leftWristX}, ${leftWristY}, ${rightWristX}, ${rightWristY}');
    print('=== left wrist');

    if (leftelbowY > 285 && leftelbowY < 420 && leftWristY < 300) {
      armAlignment = true;
      setState(() {
        armColor = Colors.green;
      });
    } else {
      armAlignment = false;
      setState(() {
        armColor = Colors.red;
        memo = 'Arms must be upwards';
      });
    }

    if (leftShoulderY < 360) {
      wristAlignment = true;
      setState(() {
        shoulderColor = Colors.green;
      });
    } else {
      wristAlignment = false;
      setState(() {
        shoulderColor = Colors.red;
        memo = 'Keep Shoulders Straight';
      });
    }
    if (leftKneeX > 200 && rightKneeX < 140) {
      kneeAndHipAlignment = true;
      setState(() {
        legColor = Colors.green;
      });
    } else {
      kneeAndHipAlignment = false;
      setState(() {
        legColor = Colors.red;
        memo = 'Keep Distance B/W Legs';
      });
    }
    if (wristAlignment && armAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        done2 = true;
        memo = 'Good';
        memo = 'Hold for 10 Sec.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now, hold for 10 seconds');
      });
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          legColor = Colors.transparent;
          armColor = Colors.transparent;
          shoulderColor = Colors.transparent;
          memo = 'Congratulations !';
          succfailmssg = 'Congratulations';
          widget.flutterTts.speak('Congratulations');
          widget.flutterTts.speak('You Successfully Formed The Pose');
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            complete1 = true;
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: cameras,
                            asan: 'Vrikshasan',
                            yoganum: 3,
                            percent: widget.percent + progress,
                          )));
            });
          });
        });
      });
    } else if ((wristAlignment && armAlignment) ||
        (wristAlignment && kneeAndHipAlignment) ||
        (armAlignment && wristAlignment)) {
      setState(() {
        progress = 35;
      });
    } else if ((wristAlignment || armAlignment || kneeAndHipAlignment)) {
      setState(() {
        progress = 70;
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        progress = 0;
      });
    }
  }

  void _postureAccordingToExerciseThird(Map<String, List<double>> poses) {
    setState(() {
      leftShoulderY = poses['leftShoulder'][1];
      rightShoulderY = poses['rightShoulder'][1];
      leftWristX = poses['leftWrist'][0];
      leftWristY = poses['leftWrist'][1];
      rightWristX = poses['rightWrist'][0];
      rightWristY = poses['leftWrist'][1];

      leftKneeX = poses['leftKnee'][0];
      leftKneeY = poses['leftKnee'][1];
      rightKneeX = poses['rightKnee'][0];
      rightKneeY = poses['rightKnee'][1];

      leftelbowX = poses['leftElbow'][0];
      leftelbowY = poses['leftElbow'][1];
      rightelbowX = poses['rightElbow'][0];
      rightelbowY = poses['rightElbow'][1];

      leftAnkleX = poses['leftAnkle'][0];
      rightAnkleX = poses['rightAnkle'][0];
      leftHipY = poses['leftHip'][1];
    });

    if (leftelbowY > 200 &&
        leftelbowY < 360 &&
        rightelbowX < 165 &&
        (leftWristY < 150 || rightWristY < 150)) {
      armAlignment = true;
      setState(() {
        armColor = Colors.green;
      });
    } else {
      armAlignment = false;
      setState(() {
        armColor = Colors.red;
        memo = 'Arms must be upwards';
      });
    }

    if (leftShoulderY < 360) {
      wristAlignment = true;
      setState(() {
        shoulderColor = Colors.green;
      });
    } else {
      wristAlignment = false;
      setState(() {
        shoulderColor = Colors.red;
        memo = 'Keep Shoulders Straight';
      });
    }
    if (rightKneeX < 140 && rightAnkleX < 150 && rightAnkleX > 130) {
      kneeAndHipAlignment = true;
      setState(() {
        legColor = Colors.green;
      });
    } else {
      kneeAndHipAlignment = false;
      setState(() {
        legColor = Colors.red;
        memo = 'Keep Ankle R upto Knee L';
      });
    }

    if (wristAlignment && armAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        done2 = true;
        memo = 'Good';
        memo = 'Hold for 10 Sec.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now, hold for 10 seconds');
      });
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          legColor = Colors.transparent;
          armColor = Colors.transparent;
          shoulderColor = Colors.transparent;
          memo = 'Congratulations !';
          succfailmssg = 'Congratulations';
          widget.flutterTts.speak('Congratulations');
          widget.flutterTts.speak('You Successfully Formed The Pose');
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            complete1 = true;
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: cameras,
                            asan: 'Achievements',
                            yoganum: 0,
                            percent: widget.percent + progress,
                          )));
            });
          });
        });
      });
    } else if ((wristAlignment && armAlignment) ||
        (wristAlignment && kneeAndHipAlignment) ||
        (armAlignment && wristAlignment)) {
      setState(() {
        progress = 35;
      });
    } else if ((wristAlignment || armAlignment || kneeAndHipAlignment)) {
      setState(() {
        progress = 70;
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        progress = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void _getKeyPoints(k, x, y) {
      if (k["part"] == 'leftEye') {
        leftEyePos.x = x - 230;
        leftEyePos.y = y - 45;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x - 230;
        rightEyePos.y = y - 45;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x - 230;
        leftShoulderPos.y = y - 45;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x - 230;
        rightShoulderPos.y = y - 45;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x - 230;
        leftElbowPos.y = y - 45;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x - 230;
        rightElbowPos.y = y - 45;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x - 230;
        leftWristPos.y = y - 45;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x - 230;
        rightWristPos.y = y - 45;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x - 230;
        leftHipPos.y = y - 45;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x - 230;
        rightHipPos.y = y - 45;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x - 230;
        leftKneePos.y = y - 45;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x - 230;
        rightKneePos.y = y - 45;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x - 230;
        leftAnklePos.y = y - 45;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x - 230;
        rightAnklePos.y = y - 45;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.data.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var scaleW, scaleH, x, y;

          if (widget.screenH / widget.screenW >
              widget.previewH / widget.previewW) {
            scaleW = widget.screenH / widget.previewH * widget.previewW;
            scaleH = widget.screenH;
            var difW = (scaleW - widget.screenW) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
          } else {
            scaleH = widget.screenW / widget.previewW * widget.previewH;
            scaleW = widget.screenW;
            var difH = (scaleH - widget.screenH) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
          }
          inputArr[k['part']] = [x, y];
          //Mirroring
          if (x > 320) {
            var temp = x - 320;
            x = 320 - temp;
          } else {
            var temp = 320 - x;
            x = 320 + temp;
          }

          _getKeyPoints(k, x, y);

          if (k["part"] == 'leftEye') {
            leftEyePos.x = x - 230;
            leftEyePos.y = y - 45;
          }
          if (k["part"] == 'rightEye') {
            rightEyePos.x = x - 230;
            rightEyePos.y = y - 45;
          }
          return Positioned(
            left: x - 230,
            top: y - 50,
            width: 100,
            height: 15,
            child: Container(
                // child: Text(
                //   "● ${inputArr[k['part']]}",
                //   style: TextStyle(
                //     color: Color.fromRGBO(37, 213, 253, 1.0),
                //     fontSize: 12.0,
                //   ),
                // ),
                ),
          );
        }).toList();

        if (widget.yogapose == 'Urdhva Hastasana') {
          if (!done1) {
            _postureAccordingToExerciseFirst(inputArr);
          }
        }
        if (widget.yogapose == 'Virabhadrasana') {
          if (!done2) {
            _postureAccordingToExerciseSecond(inputArr);
          }
        }
        if (widget.yogapose == 'Vrikshasan') {
          if (!done3) {
            _postureAccordingToExerciseThird(inputArr);
          }
        }
        inputArr.clear();

        lists..addAll(list);
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Positioned(
            top: 10.6,
            right: -10,
            child: widget.yogapose == 'Urdhva Hastasana'
                ? Image.asset(
                    'assets/yogaposes/031-salute.png',
                    scale: 2.5,
                  )
                : widget.yogapose == 'Virabhadrasana'
                    ? Image.asset(
                        'assets/yogaposes/032-warrior.png',
                        scale: 2.5,
                      )
                    : Image.asset(
                        'assets/yogaposes/027-tree.png',
                        scale: 2.5,
                      )),
        Positioned(
          top: 220,
          right: 50,
          child: Text(
            widget.yogapose,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 400,
          right: 130,
          child: Text(
            '${succfailmssg}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 450,
          right: 140,
          child: Text(
            '${progress} %',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Stack(
          children: [
            CustomPaint(
              painter: MyPainter(
                  left: leftShoulderPos,
                  right: rightShoulderPos,
                  color: shoulderColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftElbowPos, right: leftShoulderPos, color: armColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftWristPos, right: leftElbowPos, color: armColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: rightElbowPos,
                  right: rightShoulderPos,
                  color: armColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: rightWristPos, right: rightElbowPos, color: armColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftShoulderPos,
                  right: leftHipPos,
                  color: shoulderColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftHipPos, right: leftKneePos, color: legColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftKneePos, right: leftAnklePos, color: legColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: rightShoulderPos,
                  right: rightHipPos,
                  color: shoulderColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: rightHipPos, right: rightKneePos, color: legColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: rightKneePos, right: rightAnklePos, color: legColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftHipPos, right: rightHipPos, color: shoulderColor),
            ),
          ],
        ),
        Stack(children: _renderKeypoints()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: widget.screenW,
            decoration: BoxDecoration(
              color: correctColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$memo',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Vector {
  double x, y;
  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;
  Color color;
  MyPainter({this.left, this.right, this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = color //Colors.blue
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
