import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:yoga/controllers/auth.dart';

import '../../../dashboard.dart';
import '../../../main.dart';
import 'constants.dart';
import 'posesdata.dart';
import 'package:yoga/yogaai/pushed_pageY.dart';

class YogaPoseDetail extends StatelessWidget {
  final List<CameraDescription> cameras;
  final PlanetInfo planetInfo;
  final String yogaModule;

  const YogaPoseDetail(
      {Key key, this.planetInfo, this.yogaModule, this.cameras})
      : super(key: key);

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
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF159957), Color(0xFF155799)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.7])),
              child: SafeArea(
                bottom: false,
                child: Stack(
                  children: <Widget>[
                    Image.asset(planetInfo.iconImage),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 300),
                                // Image.asset(planetInfo.iconImage),
                                Text(
                                  planetInfo.sansName == ''
                                      ? planetInfo.name
                                      : planetInfo.sansName,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 56,
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Text(
                                        yogaModule,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 31,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        if(planetInfo.sansName == 'Virabhadrasana I') {
                                          onSelectA(
                                            context: context,
                                            modelName: 'posenet');
                                        }
                                      },
                                      color: Colors.yellow,
                                      child: Text('Start'),
                                    ),
                                  ],
                                ),
                                Divider(color: Colors.black38),
                                SizedBox(height: 32),
                                Text(
                                  planetInfo.benefits ?? '',
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 20,
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 32),
                                Divider(color: Colors.black38),
                                SizedBox(height: 32),
                                Text(
                                  'Procedure',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  planetInfo.description ?? '',
                                  // maxLines: 5,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 20,
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 32),
                                Divider(color: Colors.black38),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: RaisedButton(
                              onPressed: () {
                                print('${planetInfo.name} Started');
                              },
                              color: Colors.yellow,
                              child: Text(
                                'Start This Pose',
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 32,
                      child: Text(
                        planetInfo.position.toString(),
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.2),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelectA({BuildContext context, String modelName}) async {
    print('hi');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PushedPageY(
                  cameras: cameras,
                  title: modelName,
                  yogaPose: 'Virabhadrasana',
                )));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
