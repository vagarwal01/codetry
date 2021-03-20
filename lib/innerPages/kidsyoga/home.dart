import 'package:flutter/material.dart';
import 'package:yoga/controllers/auth.dart';
import '../../dashboard.dart';
import '../../main.dart';
import './kidsyogadata.dart';
import './kidsyogadetail.dart';
import '../training/constants.dart';
// import '../training/traininginnerpages/constants.dart';

import 'package:camera/camera.dart';

class KidsYoga extends StatefulWidget {
  final String uid;
  final List<CameraDescription> cameras;

  const KidsYoga({Key key, this.uid, this.cameras}) : super(key: key);

  @override
  _KidsYogaState createState() => _KidsYogaState();
}

class _KidsYogaState extends State<KidsYoga> {
  // KidsYogaData kydata = kypos
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    KidsYogaData kydata = kyposes[index];

    return GestureDetector(
      onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YogaPoseDetail(kydata: kydata, yogaModule: 'Kids Yoga', cameras: widget.cameras,),
          ),
        );

      },
          child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
            child: Container(
              width: size.width * 0.3,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(100.0)),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      margin: EdgeInsets.all(1),
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.only(left: 50),
                      // width: 62,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        // border: Border.all(color: Colors.black),
                        // color: Colors.red,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage(kydata.iconImage)
                        )
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: appPadding / 2,
                            ),
                        child: Text(
                          kydata.name,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: appPadding / 2,
                            ),
                        child: Text(
                          kydata.sansName,
                          style: TextStyle(
                            color: black.withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: ListView(
          children: [
            Container(
              height: size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF159957), Color(0xFF155799)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.7])),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mudratn.jpg'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Beneficial Yoga for Kids',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: appPadding / 2),
                      child: Container(
                        height: size.height * 0.20,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: kyposes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildStyles(context, index);
                            }),
                      ),
                    )
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
