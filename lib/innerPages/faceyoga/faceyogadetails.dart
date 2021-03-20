import 'package:flutter/material.dart';
import 'package:yoga/controllers/auth.dart';
import 'package:yoga/innerPages/training/traininginnerpages/constants.dart';
import 'package:yoga/main.dart';

import 'faceyogadata.dart';
import '../../dashboard.dart';

class FaceYogaDetails extends StatelessWidget {
  final FaceYogaEx faceyogas;

  const FaceYogaDetails({Key key, this.faceyogas}) : super(key: key);


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
            SizedBox(
              height: 10,
            ),
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
                    Container(
                      height: 300,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(faceyogas.imageUrl))),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      // child: Image(image: AssetImage(mudras.imageUrl)),
                      // child: Image.asset(mudras.imageUrl)
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 32, top: 32, bottom: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 300),
                                // Image.asset(planetInfo.iconImage),
                                Text(
                                  faceyogas.name,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 56,
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                    faceyogas.benefits,
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 21,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Divider(color: Colors.black38),
                                SizedBox(height: 32),
                                Text(
                                  'Procedure',
                                  textAlign: TextAlign.center,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  faceyogas.procedure ?? '',
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
                                SizedBox(height: 32),
                                Text(
                                  'Tip',
                                  textAlign: TextAlign.center,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  faceyogas.tryinplaceof ?? '',
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
                        ],
                      ),
                    ),
                    // Positioned(
                    //   top: 60,
                    //   left: 32,
                    //   child: Text(
                    //     // planetInfo.position.toString(),
                    //     '1',
                    //     style: TextStyle(
                    //       fontFamily: 'Avenir',
                    //       fontSize: 247,
                    //       color: primaryTextColor.withOpacity(0.6),
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
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
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
