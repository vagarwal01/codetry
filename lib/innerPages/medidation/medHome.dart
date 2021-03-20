import 'package:flutter/material.dart';
import 'package:yoga/controllers/auth.dart';
import '../../main.dart';
import './widgets.dart';
import './focusmode.dart';

class MedHomePage extends StatelessWidget {
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
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Meditation",
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        // Row(
                        //   children: [
                        //     PromoIcons(assetName: "assets/med/moon.png"),
                        //     PromoIcons(assetName: "assets/med/circle.png"),
                        //     PromoIcons(assetName: "assets/med/triangle.png"),
                        //     PromoIcons(assetName: "assets/med/drop.png"),
                        //   ],
                        // ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Let's focus on the new day",
                                style: TextStyle(
                                  fontFamily: "Josefin",
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                              Text("~")
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                              background: Color(0xffffb773),
                              flexSize: 4,
                              mgTop: 30,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 10,
                              modeName: "Focus Mode",
                              assetImage: "assets/med/coltri.png",
                              buttonAsset: "assets/med/triangle.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => FocusMode())),
                            ),
                            Modes(
                              background: Color(0xffcf8cf9),
                              flexSize: 6,
                              mgTop: 10,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 30,
                              modeName: "Meditation\nMode",
                              assetImage: "assets/med/colmoon.png",
                              buttonAsset: "assets/med/moon.png",
                              openMode: null,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                                background: Color(0xff74e9f8),
                                flexSize: 6,
                                mgTop: 30,
                                mgLeft: 10,
                                mgRight: 30,
                                mgBottom: 10,
                                modeName: "Relaxation\nMode",
                                assetImage: "assets/med/colcir.png",
                                buttonAsset: "assets/med/circle.png",
                                openMode: null),
                            Modes(
                              background: Color(0xff97e37b),
                              flexSize: 4,
                              mgTop: 10,
                              mgLeft: 10,
                              mgRight: 30,
                              mgBottom: 30,
                              modeName: "Sleep Mode",
                              assetImage: "assets/med/coldrop.png",
                              buttonAsset: "assets/med/drop.png",
                              openMode: null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
