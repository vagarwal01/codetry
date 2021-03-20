import 'package:flutter/material.dart';
import 'package:yoga/innerPages/mudras/mudrasdetail.dart';
import 'package:yoga/innerPages/training/constants.dart';

import 'mudras.dart';

class FiveMudras extends StatelessWidget {
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Mudras _mudra = fiveMudras[index];

    return GestureDetector(
      onTap: () {
                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MudrasDetail(mudras: _mudra,),
          ),
        );

      },
          child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                  color: white,
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
                  Container(
                    margin: EdgeInsets.all(1),
                    height: 100,
                    width: 100,
                    // width: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage(_mudra.imageUrl)
                      )
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
                          _mudra.name,
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
                          top: appPadding / 2,
                          bottom: appPadding / 2
                        ),
                        child: Text(
                          _mudra.title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: black.withOpacity(0.5)),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 5,
            child: Container(
                    margin: EdgeInsets.all(1),
                    height: 60,
                    width: 60,
                    // width: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.white,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage(_mudra.icon)
                      )
                    ),
                  ),
          )
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
                'Mudras of 5 Elements',
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
            height: size.height * 0.23,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: fiveMudras.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStyles(context, index);
                }),
          ),
        )
      ],
    );
  }
}
