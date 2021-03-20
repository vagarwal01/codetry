import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yoga/controllers/auth.dart';
import 'package:yoga/controllers/database.dart';
import 'package:yoga/main.dart';
import 'package:camera/camera.dart';

import '../dashboard.dart';
import 'training/home.dart';

class FeedBack extends StatefulWidget {
  final String uid;
  final List<CameraDescription> cameras;

  const FeedBack({Key key, this.uid, this.cameras}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  int currentStep = 0;
  int days = 0;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  TimeOfDay picked;

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: _timeOfDay);
    setState(() {
      _timeOfDay = picked;
      print(_timeOfDay);
    });
  }

  List<String> ageList = ['10 - 29', '30 - 49', '50 +'];
  int selectedAgeIndex = 0;
  void changeAgeIndex(int index) {
    setState(() {
      selectedAgeIndex = index;
    });
  }

  Widget ageRadio(String txt, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: RaisedButton(
        onPressed: () {
          changeAgeIndex(index);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: selectedAgeIndex == index ? Colors.pink[100] : Colors.cyan[100],
        child: Text(
          txt,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  List<String> wDays = [
    'Mon + Wed + Fri',
    'Tue + Thu + Sat',
    'Mon to Fri',
    'Mon to Sat'
  ];
  int selectedDaysIndex = 0;
  void changeDaysIndex(int index) {
    setState(() {
      selectedDaysIndex = index;
    });
  }

  Widget wDaysRadio(String txt, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: RaisedButton(
        onPressed: () {
          changeDaysIndex(index);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: selectedDaysIndex == index ? Colors.pink[100] : Colors.cyan[100],
        child: Text(
          txt,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  List<String> yogaPrac = [
    'Beginner - New To Yoga',
    'Intermediate - Have Done Some Yoga Postures',
    'Advance - Do Daily Frequently'
  ];
  int selectedYPIndex = 0;
  void changeYPIndex(index) {
    setState(() {
      selectedYPIndex = index;
    });
  }

  Widget yPracRadio(String txt, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: RaisedButton(
        onPressed: () {
          changeYPIndex(index);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: selectedYPIndex == index ? Colors.pink[100] : Colors.cyan[100],
        child: Text(
          txt,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  List<String> medList = ['< 10 Min', '= 10 Min', '> 10 Min'];
  int selectedMedIndex = 0;
  void changeMedIndex(int index) {
    setState(() {
      selectedMedIndex = index;
    });
  }

  Widget medRadio(String txt, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: RaisedButton(
        onPressed: () {
          changeMedIndex(index);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: selectedMedIndex == index ? Colors.pink[100] : Colors.cyan[100],
        child: Text(
          txt,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  List<String> healthList = [
    'Diabetes',
    'Thyroid',
    'Chromic Back Pain',
    'Stress/Anxiety',
    'Depression',
    'Heart Problems',
    'None'
  ];
  int selectedHealthIndex = 0;
  void changeHealthIndex(int index) {
    setState(() {
      selectedHealthIndex = index;
    });
  }

  Widget healthRadio(String txt, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: RaisedButton(
        onPressed: () {
          changeHealthIndex(index);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color:
            selectedHealthIndex == index ? Colors.pink[100] : Colors.cyan[100],
        child: Text(
          txt,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  List<Step> _stepper() {
    double cWidth = MediaQuery.of(context).size.width * 0.7;

    List<Step> steps = [
      Step(
          title: const Text(
            'Age',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: const Text(
            'Choose Your Age Group',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          isActive: currentStep >= 0,
          state: StepState.complete,
          content: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: <Widget>[
              ageRadio(ageList[0], 0),
              ageRadio(ageList[1], 1),
              ageRadio(ageList[2], 2)
            ],
          )),
      Step(
        title: const Text(
          'Yoga Days',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: const Text(
          'How many days can you devote for yoga per week ?',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        isActive: currentStep >= 1,
        state: StepState.complete,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
                Text(
                  "3 Days a Week",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
              ]),
            ),
            wDaysRadio(wDays[0], 0),
            wDaysRadio(wDays[1], 1),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
                Text("5 Days a Week", style: TextStyle(color: Colors.white)),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
              ]),
            ),
            wDaysRadio(wDays[2], 2),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
                Text("6 Days a Week", style: TextStyle(color: Colors.white)),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
              ]),
            ),
            wDaysRadio(wDays[3], 3),
          ],
        ),
      ),
      Step(
          title: const Text(
            'Yoga Time',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: Container(
            // padding: const EdgeInsets.all(16.0),
            width: cWidth,
            child: const Text(
              'At what time you would like to do yoga on the prefered days above ?',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          isActive: currentStep >= 2,
          state: StepState.complete,
          content: Center(
              child: RaisedButton(
                  onPressed: () {
                    selectTime(context);
                    print(_timeOfDay);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.pink[100],
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '${_timeOfDay.hour}:${_timeOfDay.minute}',
                            style: TextStyle(color: Colors.black)),
                        WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Icon(Icons.timer),
                        ))
                      ],
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20)))),
      Step(
        title: const Text(
          'Yoga Practice',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: const Text(
          'How good are you in yoga ?',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        isActive: currentStep >= 3,
        state: StepState.complete,
        content: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            yPracRadio(yogaPrac[0], 0),
            yPracRadio(yogaPrac[1], 1),
            yPracRadio(yogaPrac[2], 2),
          ],
        ),
      ),
      Step(
          title: const Text(
            'Meditation Time',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: const Text(
            'How much time can you medidate ?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          isActive: currentStep >= 4,
          state: StepState.complete,
          content: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: <Widget>[
              medRadio(medList[0], 0),
              medRadio(medList[1], 1),
              medRadio(medList[2], 2),
            ],
          )),
      Step(
          title: const Text(
            'Health Issue',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: const Text(
            'Do you have any (or some) of these medical problems ?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          isActive: currentStep >= 5,
          state: StepState.complete,
          content: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: <Widget>[
              healthRadio(healthList[0], 0),
              healthRadio(healthList[1], 1),
              healthRadio(healthList[2], 2),
              healthRadio(healthList[3], 3),
              healthRadio(healthList[4], 4),
              healthRadio(healthList[5], 5),
              healthRadio(healthList[6], 6),
            ],
          )),
    ];
    return steps;
  }

  next() {
    setState(() {
      this.currentStep < this._stepper().length - 1
          ? goTo(currentStep + 1)
          : setState(() {
              saveUserFB();
            });
    });
  }

  cancel() {
    setState(() {
      if (this.currentStep > 0) {
        goTo(currentStep - 1);
      }
    });
  }

  goTo(int step) {
    setState(() => this.currentStep = step);
  }

  void saveUserFB() async {
    Center(
      child: CircularProgressIndicator(),
    );
    print(ageList[selectedAgeIndex] +
        wDays[selectedDaysIndex] +
        _timeOfDay.toString() +
        yogaPrac[selectedYPIndex] +
        medList[selectedMedIndex] +
        healthList[selectedHealthIndex]);

    await DatabaseService(uid: widget.uid).addUserFB(
        ageList[selectedAgeIndex],
        wDays[selectedDaysIndex],
        _timeOfDay.toString(),
        yogaPrac[selectedYPIndex],
        medList[selectedMedIndex],
        healthList[selectedHealthIndex]);

    var time = Time(_timeOfDay.hour, _timeOfDay.minute, 00);
    print(time);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'om',
      // sound: RawResourceAndroidNotificationSound('alert'),
      largeIcon: DrawableResourceAndroidBitmap('om'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      // sound: 'alert.mp3',
      presentAlert: true,
      presentBadge: true,
      // presentSound: true
    );
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Good Morning', // title
        'It\'s Time for Yoga.', // message
        time,
        platformChannelSpecifics);

    FocusScope.of(context).requestFocus(new FocusNode());
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Congratulations"),
        content: Text("You are now a part of our family !"),
        actions: <Widget>[
          OutlineButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrainingHomePage(
                            uid: widget.uid,
                            cameras: widget.cameras,
                          )));
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }

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
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    // colors: [gradientStartColor, gradientEndColor],
                    colors: [Color(0xFF159957), Color(0xFF155799)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.7])),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Text(
                    'Just a few Questions away',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stepper(
                  steps: _stepper(),
                  currentStep: this.currentStep,
                  onStepContinue: next,
                  onStepTapped: (step) => goTo(step),
                  onStepCancel: cancel,
                ),
              ),
            ]),
          ),
        ));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
