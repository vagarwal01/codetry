import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:camera/camera.dart';
import 'package:yoga/main.dart';
import '../innerPages/yogasession/yogasan.dart';

class RenderDataYogaParvatasana extends StatefulWidget {
  final FlutterTts flutterTts = FlutterTts();
  final List<CameraDescription> cameras;
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String yogapose;

  RenderDataYogaParvatasana(
      {this.data,
      this.previewH,
      this.previewW,
      this.screenH,
      this.screenW,
      this.cameras,
      this.yogapose});
  @override
  _RenderDataYogaParvatasanaState createState() =>
      _RenderDataYogaParvatasanaState();
}

class _RenderDataYogaParvatasanaState extends State<RenderDataYogaParvatasana> {
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
      leftHipY;

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
    if (widget.yogapose == 'Parvatasana') {
      widget.flutterTts.speak('Mountain Pose Started');
    } else if (widget.yogapose == 'Gomukhasana') {
      widget.flutterTts.speak('Cow Face Pose Started');
    } else {
      widget.flutterTts.speak('Cobbler Pose Started');
    }
    Future.delayed(Duration(seconds: 60), () {
      if((widget.yogapose == 'Parvatasana' && !done1) || (widget.yogapose == 'Gomukhasana' && !done2) || (widget.yogapose == 'Badhakonasana' && !done3)) {
        succfailmssg = 'OK, well tried !';
        widget.flutterTts.speak('No problem, Well Tried');
        Future.delayed(Duration(seconds: 3), () {
          // Navigator.pop(context);
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => YogaAsana(
                          cameras: cameras,
                          asan: 'Gomukhasana',
                          yoganum: 2,
                        )));
          });              
        });
      }
    });
    super.initState();
  }

  void _postureAccordingToExerciseParvatAsana(Map<String, List<double>> poses) {
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


    if (leftelbowX > 280 &&
        leftelbowX < 330 &&
        rightelbowX > 60 &&
        rightelbowX < 170) {
      armAlignment = true;
      setState(() {
        armColor = Colors.green;
        progress += 40;
      });
    } else {
      armAlignment = false;
      setState(() {
        memo = 'Keep Arms Straight';
        armColor = Colors.red;
        if (progress >= 40) {
          progress -= 40;
        }
      });
    }
    if ((leftelbowX > 280 &&
            leftelbowX < 330 &&
            rightelbowX > 60 &&
            rightelbowX < 170) ||
        (leftWristX > 250 &&
            leftWristY > 140 &&
            rightWristX > 160 &&
            rightWristY > 150 &&
            leftShoulderY > 390 &&
            rightShoulderY > 380)) {
      wristAlignment = true;
      setState(() {
        shoulderColor = Colors.green;
        progress += 40;
      });
    } else {
      wristAlignment = false;
      setState(() {
        memo = 'Keep Back Straight';
        shoulderColor = Colors.red;
        if (progress >= 40) {
          progress -= 40;
        }

        // widget.flutterTts.speak('Keep Your Back Straight');
      });
    }
    if (leftKneeX > 320 &&
        leftKneeY > 660 &&
        rightKneeX > 40 &&
        rightKneeY > 650) {
      kneeAndHipAlignment = true;
      setState(() {
        legColor = Colors.green;
        progress -= 20;
      });
    } else {
      kneeAndHipAlignment = false;
      setState(() {
        memo = 'Sit Properly';
        legColor = Colors.red;
        if (progress == 20 || progress >= 60) {
          progress -= 20;
        }
        // widget.flutterTts.speak('Please sit Properly');
      });
    }
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
          progress = 0;
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            complete1 = true;
            widget.flutterTts.speak('Your next yoga posture is');
          });
        });
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        progress = 0;
      });
    }
  }

  void _postureAccordingToExerciseCowFace(Map<String, List<double>> poses) {
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
    print(leftWristY);
    print('${leftWristX}, ${leftWristY}, ${rightWristX}, ${rightWristY}');
    print('${leftShoulderY}, ${rightShoulderY}');
    print('knee == ${leftKneeX}, ${leftKneeY}, ${rightKneeX}, ${rightKneeY}');
    print(
        'elbow == ${leftelbowX}, ${leftelbowY}, ${rightelbowX}, ${rightelbowY}');
    // print('${leftAnkleX}, ${rightAnkleX}');

    print('=== left wrist');

    // if (leftelbowY < 520 && rightelbowY < 460) {
    //   armAlignment = true;
    //   setState(() {
    //     armColor = Colors.green;
    //   });
    // } else {
    //   armAlignment = false;
    //   setState(() {
    //     memo = 'Your right arm must be straight upwards.';
    //     armColor = Colors.red;
    //   });
    // }
    if ((leftelbowY < 520 && rightelbowY < 460) ||
        (leftWristX > 300 &&
            leftWristY > 530 &&
            rightWristX > 140 &&
            rightWristY > 530 &&
            leftShoulderY > 400 &&
            rightShoulderY > 380)) {
      wristAlignment = true;
      armAlignment = true;
      setState(() {
        shoulderColor = Colors.green;
        armColor = Colors.green;
        progress += 70;
      });
    } else {
      wristAlignment = false;
      armAlignment = false;
      setState(() {
        // memo = 'Keep Your Back Straight';
        memo = 'Keep Your R Arm upwards.';
        shoulderColor = Colors.red;
        armColor = Colors.red;
        if (progress >= 70) {
          progress -= 70;
        }
      });
    }
    if (leftKneeX > 340 &&
        leftKneeY > 660 &&
        rightKneeX > 90 &&
        rightKneeY > 280) {
      kneeAndHipAlignment = true;
      setState(() {
        legColor = Colors.green;
        progress += 30;
      });
    } else {
      kneeAndHipAlignment = true;
      setState(() {
        memo = 'You need to sit Properly';
        legColor = Colors.green;
        if (progress == 30 || progress >= 100) {
          progress -= 30;
        }
      });
    }
    if (wristAlignment && armAlignment && kneeAndHipAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        done2 = true;
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
            complete2 = true;
            succfailmssg = '';
            memo = 'Cobbler Pose';
            succfailmssg = 'Cobbler Pose';
            wristAlignment = false;
            armAlignment = false;
            widget.flutterTts.speak('Cobbler Pose Started');
          });
          // Future.delayed(Duration(seconds: 3), () {
          //   setState(() {
          //     complete2 = true;
          //     succfailmssg = '';
          //   });
          // });
        });
      });
    } else {
      setState(() {
        correctColor = Colors.red;
      });
    }
  }

  void _postureAccordingToExerciseCobblerPose(Map<String, List<double>> poses) {
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
    print(leftWristY);
    print('${leftWristX}, ${leftWristY}, ${rightWristX}, ${rightWristY}');
    print('${leftShoulderY}, ${rightShoulderY}');
    print('knee == ${leftKneeX}, ${leftKneeY}, ${rightKneeX}, ${rightKneeY}');
    print(
        'elbow == ${leftelbowX}, ${leftelbowY}, ${rightelbowX}, ${rightelbowY}');
    // print('${leftAnkleX}, ${rightAnkleX}');

    print('=== left wrist');

    if ((leftelbowX > 300 &&
            leftelbowX < 350 &&
            rightelbowX > 90 &&
            rightelbowX < 120) ||
        (leftWristY > 700 &&
            rightWristY > 700 &&
            leftWristX > 230 &&
            rightWristX > 120 &&
            leftShoulderY > 445 &&
            rightShoulderY > 445)) {
      wristAlignment = true;
      setState(() {
        armColor = Colors.green;
        shoulderColor = Colors.green;
        progress += 70;
      });
    } else {
      wristAlignment = false;
      setState(() {
        memo = 'Your Back Must Be Straight';
        armColor = Colors.red;
        shoulderColor = Colors.red;
        if (progress >= 70) {
          progress -= 70;
        }
      });
    }
    if (leftAnkleX > 230 && rightAnkleX > 150) {
      ankleAlignment = true;
      setState(() {
        legColor = Colors.green;
        progress += 30;
      });
    } else {
      ankleAlignment = false;
      setState(() {
        memo = 'Keep your hands near the toes';
        legColor = Colors.red;
        if (progress == 30 || progress >= 100) {
          progress -= 30;
        }
      });
    }
    if (leftKneeX > 240 &&
        leftKneeY > 700 &&
        rightKneeX > 120 &&
        rightKneeY > 750) {
      kneeAndHipAlignment = true;
      setState(() {
        //legColor = Colors.green;
      });
    } else {
      kneeAndHipAlignment = true;
      setState(() {
        memo = 'Your knees should be slightly up';
        legColor = Colors.green;
      });
    }
    if (wristAlignment && kneeAndHipAlignment && ankleAlignment) {
      setState(() {
        correctColor = Colors.green;
        progress = 100;
        done3 = true;
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
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            memo = 'You are done for today !';
            succfailmssg = 'Completed';
            widget.flutterTts.speak('Completed');
          });
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              complete3 = true;
            });
          });
        });
      });
    } else {
      setState(() {
        correctColor = Colors.red;
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

        if(widget.yogapose == 'Parvatasana') {
          if(!done1) {
            _postureAccordingToExerciseParvatAsana(inputArr);  
          } else {
            if(complete1) {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YogaAsana(
                              cameras: cameras,
                              asan: 'Gomukhasana',
                              yoganum: 2,
                            )));
              });              
            }
          }
        }
//         if (!done1) {
//           _postureAccordingToExerciseParvatAsana(inputArr);
//           // Future.delayed(Duration(seconds: 60), () {
//           //   _postureAccordingToExerciseParvatAsana(inputArr);
//           // });
//           //     Future.delayed(Duration(seconds: 20), () {
//           //     widget.flutterTts.speak('Keep Your Arms Straight');
//           // });

// // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PushedPageY(cameras: cameras, widget.yogapose: 'bla',)));
//         } else {
//           if (complete1) {
//             // Navigator.of(context).popUntil((route) => false);
//             Future.delayed(Duration.zero, () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => YogaAsana(
//                             cameras: cameras,
//                             asan: 'Gomukhasana',
//                             yoganum: 2,
//                           )));
//             });
//           }
//           // if (complete1 && !done2) {
//           //   _postureAccordingToExerciseCowFace(inputArr);
//           // } else if (complete2 && !done3) {
//           //   _postureAccordingToExerciseCobblerPose(inputArr);
//           // } else if (complete3) {
//           //   Navigator.pop(context);
//           // }
//         }
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
            child: widget.yogapose == 'Parvatasana'
                ? Image.asset(
                    'assets/yogaposes/013-mountainpose.png',
                    scale: 2.5,
                  )
                : widget.yogapose == 'Gomukhasana'
                    ? Image.asset(
                        'assets/yogaposes/007-cow_face_pose.png',
                        scale: 2.5,
                      )
                    : Image.asset(
                        'assets/yogaposes/005-cobbler_pose.png',
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
