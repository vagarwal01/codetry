import 'dart:ui';

// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga/innerPages/faceyoga/home.dart';
// import 'package:yoga/innerPages/dashboard/yogacarousel.dart';
import 'package:yoga/main.dart';
import './innerPages/medidation/medHome.dart';
import 'package:yoga/innerPages/kidsyoga/home.dart';
import 'controllers/auth.dart';
import 'innerPages/feedback.dart';
import 'innerPages/mudras/home.dart';
import 'innerPages/trackprogress/tphome.dart';
import 'innerPages/training/home.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Dashboard extends StatefulWidget {
  final FlutterTts flutterTts = FlutterTts();
  final String uid;
  final List<CameraDescription> cameras;

  Dashboard({Key key, this.uid, this.cameras}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Future speak() async {
      await widget.flutterTts.speak('hello');
    }

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
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: <Widget>[
              // YogaCarousel(),
              Container(
                height: 200,
                // width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/yoga1.jpg'),
                    fit: BoxFit.fill,
                  ),
                  // shape: BoxShape.circle,
                ),
              ),
              // Container(
              //   height: 200,
              //   child: Image(image: AssetImage('assets/yoga1.jpg'),)
              // ),
              SizedBox(
                height: 40,
              ),
              GridDashboard(
                uid: widget.uid,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Have Some Doubts ??',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              YogaFAQ(),
            ],
          ),
        ),
      ),
    );
  }
}

class GridDashboard extends StatelessWidget {
  String uid;
  GridDashboard({this.uid});

  Items item1 = new Items(
    title: "Get Started",
    subtitle: "Click here to get personalised yoga trainer",
    img: "assets/getStarted.png",
    navPage: "FeedBack",
  );
  Items item2 = new Items(
    title: "Track Progress",
    subtitle: "Click here to know your Progress",
    img: "assets/trackProgress.png",
    navPage: "TPHome",
  );
  Items item3 = new Items(
    title: "Face Yoga",
    subtitle: "Click here to get special yogasans for face",
    img: "assets/faceYoga.png",
    navPage: "FaceYoga",
  );
  Items item4 = new Items(
    title: "Kids Yoga",
    subtitle: "Click here to get yogasans specially for kids",
    img: "assets/trackProgress.png",
    navPage: "KidsYoga",
  );
  Items item5 = new Items(
    title: "Mudras",
    subtitle: "Click here to explore different mudras",
    img: "assets/mudra.png",
    navPage: "MudrasHome",
  );
  Items item6 = new Items(
    title: "Meditation",
    subtitle: "Click here to meditate and relax",
    img: "assets/medidate.png",
    navPage: "MedHomePage",
  );
  Items item7 = new Items(
    title: "Invite Friends",
    subtitle: "Click here to compete with your friends",
    img: "assets/friends.png",
    navPage: "",
  );
  Items item8 = new Items(
    title: "LeaderBoard",
    subtitle: "Click here to know where you stand",
    img: "assets/leaderboard.png",
    navPage: "",
  );

  void navigation(page, context) {
    if (page == 'FeedBack') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FeedBack(
                    uid: uid,
                    cameras: cameras,
                  )));
    } else if (page == 'MudrasHome') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MudrasHome(
                    uid: uid,
                  )));
    } else if (page == 'FaceYoga') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FaceYogaHome(
                    uid: uid,
                  )));
    } else if (page == 'KidsYoga') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => KidsYoga(
                    uid: uid,
                    cameras: cameras,
                  )));
    } else if(page == 'MedHomePage') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MedHomePage()));
    } else if (page == 'TPHome') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TPHome(
                    uid: uid,
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TrainingHomePage(
                    uid: uid,
                    cameras: cameras,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8
    ];
    return GridView.count(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              print(data.navPage);
              navigation(data.navPage, context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(170, 207, 211, 1.0),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 50,
                  ),
                  Text(data.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900)),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(data.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          );
        }).toList());
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  String navPage;
  Items({this.title, this.subtitle, this.img, this.navPage});
}

class MyFAQS {
  String _title, _body;
  bool _expanded;

  MyFAQS(this._title, this._body, this._expanded);

  @override
  String toString() {
    return 'MyFAQS(_title: $_title, _body: $_body, _expanded: $_expanded)';
  }

  bool get expanded => _expanded;
  set expanded(bool value) {
    _expanded = value;
  }

  get body => _body;
  set body(value) {
    _body = value;
  }

  String get title => _title;
  set title(String value) {
    _title = value;
  }
}

class YogaFAQ extends StatefulWidget {
  @override
  _YogaFAQState createState() => _YogaFAQState([
        MyFAQS(
            "What Is Yoga?",
            "The word yoga, from the Sanskrit word yuj, means to yoke or bind, and is often interpreted as “union” or a method of discipline. A male who practices yoga is called a yogi, a female practitioner, a yogini.",
            false),
        MyFAQS(
            "What are the benefits of doing yoga?",
            "The practice of Yoga includes a very holistic approach to health. It includes practices which focus on the well being of the body, mind and soul. Initially the benefits are very subtle but over a period of time when it becomes a way of life, the benefits are very obvious.",
            false),
        MyFAQS(
            "I’m Not Flexible, Can I Do Yoga?",
            "Yes! You are a perfect candidate for yoga. Many people think that they need to be flexible to begin yoga, but that’s a little bit like thinking that you need to be able to play tennis in order to take tennis lessons. Come as you are and you will find that yoga practice will help you become more flexible.",
            false),
        MyFAQS(
            "Are there any side-effects of doing yoga?",
            "When done under proper supervision of a trained yoga teacher, there are no side effects. If at all the effects are only positive.",
            false),
        MyFAQS(
            "Can the practice of yoga help in alleviating incurable diseases?",
            "Yoga is not a substitute for medicine. However it does help the body mind complex to cope with stresses. Many patients with incurable diseases have experienced a remarkable transformation after doing The Art of Living courses. You can visit the section on Yoga Experiences.",
            false),
        MyFAQS(
            "Which is the best time for practising yoga?",
            "The best time to do yoga practice is early in the morning, when your stomach is empty, and you have a minimum number of distractions. It is also recommended that you repeat your practices late in the afternoon, or early evening before dinner.",
            false),
        MyFAQS(
            "What should be the duration of a yoga practise session?",
            "Aim at doing your practices - for at least one hour every day in the beginning. If you do not have one hour every day, do your practices for whatever duration you can, however small it may be. Be regular and consistent in your practice. 20 minutes of daily practice is better than two hours of occasional practice.",
            false)
      ]);
}

class _YogaFAQState extends State<YogaFAQ> {
  List<MyFAQS> _list;
  _YogaFAQState(this._list);
  _onExpansion(int index, bool isExpanded) {
    setState(() {
      _list[index].expanded = !(_list[index].expanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ExpansionPanel> myList = [];
    int ii = _list.length;
    for (int i = 0; i < ii; i++) {
      var expansionData = _list[i];
      myList.add(ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                expansionData._title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              expansionData._body,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
          isExpanded: expansionData._expanded));
    }
    return new SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: Color.fromRGBO(170, 207, 211, 1.0),
          ),
          child: new ExpansionPanelList(
            children: myList,
            expansionCallback: _onExpansion,
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
