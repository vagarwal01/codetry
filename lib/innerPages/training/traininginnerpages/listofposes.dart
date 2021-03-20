import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yoga/controllers/auth.dart';
import '../../../dashboard.dart';
import '../../../main.dart';
import 'constants.dart';
import 'posesdata.dart';
import 'ypdetail.dart';
import 'package:camera/camera.dart';


class YogaPoses extends StatefulWidget {
  final String uid;
  final String courseModule;
  final List<CameraDescription> cameras;

  const YogaPoses({Key key, this.uid, this.courseModule, this.cameras}) : super(key: key);

  @override
  _YogaPosesState createState() => _YogaPosesState();
}

class _YogaPosesState extends State<YogaPoses> {
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
                        widget.courseModule,
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
                  height: 600,
                  // decoration: BoxDecoration(color: Colors.red),
                  padding: const EdgeInsets.only(left: 32),
                  child: Swiper(
                    // dges[const [2, 'a']]; // 2
                    // itemCount: planets.length,
                    itemCount: allPoses[widget.courseModule].length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder:
                          DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print('tapper');
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => YogaPoseDetail(
                                planetInfo: allPoses[widget.courseModule][index],
                                yogaModule: widget.courseModule,
                                cameras: widget.cameras,
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 100),
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
                                        SizedBox(height: 150),
                                        Text(
                                          allPoses[widget.courseModule][index].sansName,
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
                                          allPoses[widget.courseModule][index].name,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 20,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 32),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Start',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(allPoses[widget.courseModule][index].iconImage),
                            // Hero(
                            //   tag: planets[index].position,
                            //   child: Image.asset(planets[index].iconImage),
                            // ),
                            Positioned(
                              right: 24,
                              top: 300,
                              child: Text(
                                allPoses[widget.courseModule][index].position.toString(),
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
                      );
                    },
                  ),
                ),
                SizedBox(height: 75,)
              ],
            ),
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
