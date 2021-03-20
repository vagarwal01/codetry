import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:yoga/dashboard.dart';
import 'package:yoga/main.dart';
import 'package:yoga/controllers/auth.dart';
import 'package:yoga/yogaai/pushed_pageY.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../training/traininginnerpages/constants.dart';

class YogaAsana extends StatefulWidget {
  final FlutterTts flutterTts = FlutterTts();
  final List<CameraDescription> cameras;
  final String asan;
  final int yoganum;
  final int percent;

  YogaAsana({Key key, this.cameras, this.asan, this.yoganum, this.percent})
      : super(key: key);

  @override
  _YogaAsanaState createState() => _YogaAsanaState();
}

class _YogaAsanaState extends State<YogaAsana> {
  double pro;
  void initState() {
    super.initState();
    if (widget.yoganum == 2) {
      pro = (widget.percent / 100) * 100;
    } else if (widget.yoganum == 3) {
      pro = (widget.percent / 200) * 100;
    } else if (widget.yoganum == 0) {
      pro = (widget.percent / 300) * 100;
    } else {
      pro = 0.0;
    }
    if (widget.yoganum == 1) {
      widget.flutterTts.speak('Starting the first yoga posture - Salute Pose');
    } else {
      // widget.flutterTts.speak('Your next yoga posture is');
      if (widget.asan == 'Virabhadrasana') {
        widget.flutterTts.speak('Your next yoga posture is - Warrior Pose');
      } else if (widget.asan == 'Vrikshasan') {
        widget.flutterTts.speak('Your next yoga posture is - Tree Pose');
      }
    }

    Future.delayed(Duration(seconds: 5), () {
      print('hiii');
      if (widget.asan == 'Achievements') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => Dashboard(
                      cameras: widget.cameras,
                      uid: 'sI3j2SCHBWXf2ZW0YZWlQDTeAz92',
                    )),
            (Route<dynamic> route) => false);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PushedPageY(
                      cameras: widget.cameras,
                      title: 'posenet',
                      yogaPose: widget.asan,
                      session: true,
                      percent: widget.percent,
                    )));
      }
    });
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
      extendBody: true,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF159957), Color(0xFF155799)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          child: SafeArea(
            child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.asan == 'Achievements'
                              ? 'Session Completed'
                              : 'Yoga Pose ${widget.yoganum}',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 700,
                      // decoration: BoxDecoration(color: Colors.red),
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: InkWell(
                        onTap: () {
                          print('tapper');
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 130),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 200),
                                        Text(
                                          widget.asan,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 30,
                                            color: primaryTextColorList,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          widget.asan == 'Urdhva Hastasana'
                                              ? 'Salute Pose'
                                              : widget.asan == 'Virabhadrasana'
                                                  ? 'Warrior Pose'
                                                  : widget.asan == 'Vrikshasan'
                                                      ? 'Tree Pose'
                                                      : 'Total Yoga Poses = 3',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 20,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        widget.asan == 'Achievements'
                                            ? Text(
                                                'Total Completed = 2',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff47455f),
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            : Text(
                                                '',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff47455f),
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                        SizedBox(height: 32),
                                        Text(
                                          'Progress: ${pro.toStringAsFixed(0)} %',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: secondaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            widget.asan == 'Urdhva Hastasana'
                                ? Image.asset('assets/yogaposes/031-salute.png')
                                : widget.asan == 'Virabhadrasana'
                                    ? Image.asset(
                                        'assets/yogaposes/032-warrior.png')
                                    : widget.asan == 'Vrikshasan'
                                        ? Image.asset(
                                            'assets/yogaposes/027-tree.png')
                                        : Image.asset('assets/trophy.png'),
                            Positioned(
                              right: 24,
                              top: 300,
                              child: Text(
                                widget.yoganum.toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 200,
                                  color: primaryTextColorList.withOpacity(0.08),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 75,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
