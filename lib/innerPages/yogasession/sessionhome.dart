import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:yoga/innerPages/training/constants.dart';
import 'package:yoga/innerPages/yogasession/sessiondata.dart';
import 'package:yoga/innerPages/yogasession/sessionyogadetail.dart';
import './yogasan.dart';
import 'package:yoga/main.dart';
import 'package:yoga/controllers/auth.dart';

class SessionHome extends StatefulWidget {
  final String uid;
  final List<CameraDescription> cameras;

  const SessionHome({Key key, this.uid, this.cameras}) : super(key: key);

  @override
  _SessionHomeState createState() => _SessionHomeState();
}

class _SessionHomeState extends State<SessionHome> {
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    SessionData sdata = allYogas[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SessionYogaDetail(
                      sessionData: sdata,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(10, 15))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(sdata.imageurl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding, top: appPadding / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sdata.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          sdata.benefits,
                          style: TextStyle(
                            color: black.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yoga Poses For Today',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: primary),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: allYogas.length,
            itemBuilder: (context, index) {
              return _buildCourses(context, index);
            },
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(
                child: RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YogaAsana(
                            cameras: widget.cameras,
                            asan: 'Urdhva Hastasana',
                            yoganum: 1,
                            percent: 0,
                          ))),
              color: Colors.yellow,
              child: Text('Start'),
            )),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
