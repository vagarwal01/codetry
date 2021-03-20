import 'package:flutter/material.dart';
import 'package:yoga/innerPages/mudras/mudrasdetail.dart';
import 'package:yoga/innerPages/training/constants.dart';

import 'faceyogadata.dart';
import 'faceyogadetails.dart';

class YoungLooks extends StatelessWidget {
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    FaceYogaEx _fyex = youngerLooks[index];

    return GestureDetector(
      onTap: () {
                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FaceYogaDetails(faceyogas: _fyex,),
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
                  color: Color.fromRGBO(170, 207, 211, 1.0),
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
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                        color: Colors.red,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage(_fyex.imageUrl)
                        )
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: appPadding / 2,
                            ),
                        child: Text(
                          _fyex.name,
                          style: TextStyle(
                            fontSize: 19,
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exercises For Younger Looks',
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
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: size.height * 0.20,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: youngerLooks.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStyles(context, index);
                }),
          ),
        )
      ],
    );
  }
}
