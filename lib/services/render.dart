import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class RenderDataYoga extends StatefulWidget {
  final FlutterTts flutterTts = FlutterTts();
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  RenderDataYoga(
      {this.data, this.previewH, this.previewW, this.screenH, this.screenW});
  @override
  _RenderDataYogaState createState() => _RenderDataYogaState();
}

class _RenderDataYogaState extends State<RenderDataYoga> {
  Map<String, List<double>> inputArr;

  String ex = 'Virabhadrasana I';
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
      ankleAlignment,
      kneeAndHipAlignment,
      done1,
      c1;

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

  String succfailmssg;
  int progress;

  @override
  void initState() {
    inputArr = new Map();
    correctColor = Colors.red;
    wristAlignment = false;
    shoulderAlignment = false;
    ankleAlignment = false;
    kneeAndHipAlignment = false;
    done1 = false;
    c1 = false;
    armColor = Colors.red;
    shoulderColor = Colors.red;
    legColor = Colors.red;
    memo = ex;
    succfailmssg = ex;
    progress = 0;
    Future.delayed(Duration(seconds: 3), () {
      memo = 'Start forming the Yoga Posture';
      succfailmssg = '';
    });
    widget.flutterTts.speak('Warrior Pose Started');
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

    print('left wrist ===');
    print(leftWristY);
    print('${leftWristX}, ${leftWristY}, ${rightWristX}, ${rightWristY}');
    print('shoulder = ${leftShoulderY}, ${rightShoulderY}');
    print('knee = ${leftKneeX}, ${leftKneeY}, ${rightKneeX}, ${rightKneeY}');
    print(
        'elbow = ${leftelbowX}, ${leftelbowY}, ${rightelbowX}, ${rightelbowY}');
    print('ankle = ${leftAnkleX}, ${rightAnkleX}');
    print('hip = ${leftHipY}, ${rightHipY}');
    print('=== left wrist');

    if (leftelbowY > 200 && leftelbowY < 360 && rightelbowX < 165) {
      ankleAlignment = true;
      setState(() {
        armColor = Colors.green;
      });
    } else {
      ankleAlignment = false;
      setState(() {
        armColor = Colors.red;
      });
    }

    if (leftShoulderY < 360) {
      wristAlignment = true;
      print('shoulder');
      setState(() {
        shoulderColor = Colors.green;
      });
    } else {
      wristAlignment = false;
      setState(() {
        shoulderColor = Colors.red;
      });
    }
    if (leftKneeX < 250 &&
        rightKneeX > 155 &&
        leftHipY < 552 &&
        rightHipY < 552) {
      kneeAndHipAlignment = true;
      setState(() {
        legColor = Colors.green;
      });
    } else {
      kneeAndHipAlignment = false;
      setState(() {
        legColor = Colors.red;
      });
    }
    if (wristAlignment || ankleAlignment || kneeAndHipAlignment) {
      progress = 35;
    } else if ((wristAlignment && ankleAlignment) ||
        (wristAlignment && kneeAndHipAlignment) ||
        (ankleAlignment || wristAlignment)) {
      progress = 70;
    }
    if (wristAlignment && ankleAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        done1 = true;
        memo = 'Good';
        memo = 'Hold for 10 Sec.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now, hold for 10 seconds');
      });
      setState(() {
        correctColor = Colors.green;
        legColor = Colors.green;
        armColor  = Colors.green;
        shoulderColor = Colors.green;
        progress = 100;
        memo = 'Virabhadrasana I position aligned!';
        done1 = true;
        memo = 'Good';
        memo = 'Now hold for 10 seconds.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now hold for 10 seconds');
      });
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          memo = 'Congratulations !';
          succfailmssg = 'Congratulations';
          widget.flutterTts.speak('Congratulations');
          progress = 0;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            c1 = true;
          });
          // Future.delayed(Duration(seconds: 2), () {
          //   setState(() {
          //     complete1 = true;
          //     succfailmssg = '';
          //   });
          // });
        });
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        memo = 'Virabhadrasana I position not aligned.';
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
      rightHipY = poses['rightHip'][1];
    });

    print('left wrist ===');
    print(leftWristY);
    print('${leftWristX}, ${leftWristY}, ${rightWristX}, ${rightWristY}');
    print('shoulder = ${leftShoulderY}, ${rightShoulderY}');
    print('knee = ${leftKneeX}, ${leftKneeY}, ${rightKneeX}, ${rightKneeY}');
    print(
        'elbow = ${leftelbowX}, ${leftelbowY}, ${rightelbowX}, ${rightelbowY}');
    print('ankle = ${leftAnkleX}, ${rightAnkleX}');
    print('hip = ${leftHipY}, ${rightHipY}');
    print('=== left wrist');

    if (leftelbowY > 285 && leftelbowY < 420 && leftWristY < 300) {
      ankleAlignment = true;
      setState(() {
        armColor = Colors.green;
        // shoulderColor = Colors.green;
        progress += 35;
      });
    } else {
      ankleAlignment = false;
      setState(() {
        armColor = Colors.red;
        // shoulderColor = Colors.red;
        if (progress >= 35) {
          progress -= 35;
        }
      });
    }

    if (leftShoulderY < 360) {
      wristAlignment = true;
      print('shoulder');
      setState(() {
        // armColor = Colors.green;
        shoulderColor = Colors.green;
        progress += 35;
      });
    } else {
      wristAlignment = false;
      setState(() {
        // armColor = Colors.red;
        shoulderColor = Colors.red;
        if (progress >= 35) {
          progress -= 35;
        }
      });
    }
    if (leftKneeX > 200 && rightKneeX < 140) {
      kneeAndHipAlignment = true;
      print('kneww coorr');
      setState(() {
        legColor = Colors.green;
        progress += 30;
      });
    } else {
      kneeAndHipAlignment = false;
      setState(() {
        legColor = Colors.red;
        if (progress >= 75 || progress == 30) {
          progress -= 30;
        }
      });
    }
    if (wristAlignment && ankleAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        memo = 'Virabhadrasana I position aligned!';
        done1 = true;
        memo = 'Good';
        memo = 'Now hold for 10 seconds.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now hold for 10 seconds');
      });
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          memo = 'Congratulations !';
          succfailmssg = 'Congratulations';
          widget.flutterTts.speak('Congratulations');
          progress = 0;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            c1 = true;
          });
          // Future.delayed(Duration(seconds: 2), () {
          //   setState(() {
          //     complete1 = true;
          //     succfailmssg = '';
          //   });
          // });
        });
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        memo = 'Virabhadrasana I position not aligned.';
        progress = 0;
      });
    }
  }

  void _postureAccordingToExercise(Map<String, List<double>> poses) {
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

    print('left wrist ===');
    print(leftWristY);
    print('${leftWristX}, ${leftWristY}, ${rightWristX}, ${rightWristY}');
    print('shoulder = ${leftShoulderY}, ${rightShoulderY}');
    print('knee = ${leftKneeX}, ${leftKneeY}, ${rightKneeX}, ${rightKneeY}');
    print(
        'elbow = ${leftelbowX}, ${leftelbowY}, ${rightelbowX}, ${rightelbowY}');
    print('ankle = ${leftAnkleX}, ${rightAnkleX}');
    print('hip = ${leftHipY}, ${rightHipY}');
    print('=== left wrist');

    if (leftelbowY > 200 && leftelbowY < 360 && rightelbowX < 165) {
      ankleAlignment = true;
      setState(() {
        armColor = Colors.green;
        // shoulderColor = Colors.green;
        progress += 35;
      });
    } else {
      ankleAlignment = false;
      setState(() {
        armColor = Colors.red;
        // shoulderColor = Colors.red;
        if (progress >= 35) {
          progress -= 35;
        }
      });
    }

    if (leftShoulderY < 360) {
      wristAlignment = true;
      print('shoulder');
      setState(() {
        // armColor = Colors.green;
        shoulderColor = Colors.green;
        progress += 35;
      });
    } else {
      wristAlignment = false;
      setState(() {
        // armColor = Colors.red;
        shoulderColor = Colors.red;
        if (progress >= 35) {
          progress -= 35;
        }
      });
    }
    if (rightKneeX < 140 && rightAnkleX < 150 && rightAnkleX > 130) {
      kneeAndHipAlignment = true;
      print('kneww coorr');
      setState(() {
        legColor = Colors.green;
        progress += 30;
      });
    } else {
      kneeAndHipAlignment = false;
      setState(() {
        legColor = Colors.red;
        if (progress >= 75 || progress == 30) {
          progress -= 30;
        }
      });
    }
    if (wristAlignment && ankleAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        memo = 'Virabhadrasana I position aligned!';
        done1 = true;
        memo = 'Good';
        memo = 'Now hold for 10 seconds.';
        widget.flutterTts.speak('Good');
        widget.flutterTts.speak('Now hold for 10 seconds');
      });
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          memo = 'Congratulations !';
          succfailmssg = 'Congratulations';
          widget.flutterTts.speak('Congratulations');
          progress = 0;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            c1 = true;
          });
          // Future.delayed(Duration(seconds: 2), () {
          //   setState(() {
          //     complete1 = true;
          //     succfailmssg = '';
          //   });
          // });
        });
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        memo = 'Virabhadrasana I position not aligned.';
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

        if (!done1) {
          _postureAccordingToExercise(inputArr);
        }
        // if (!done1 && istimeout) {
        //   Future.delayed(Duration(seconds: 5), () {
        //     succfailmssg = 'OK, well tried !';
        //     widget.flutterTts.speak('Ok, Well Tried');
        //     Navigator.pop(context);
        //   });
        // }
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
            child: Image.asset(
              'assets/yogaposes/031-warrior1.png',
              scale: 2.5,
            )),
        Positioned(
          top: 220,
          right: 50,
          child: Text(
            ex,
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
              children: [
                Text(
                  //'$whatToDo\nArm Presses: ${_counter.toString()}',
                  '$memo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
