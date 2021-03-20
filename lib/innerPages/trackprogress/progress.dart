import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoga/innerPages/training/constants.dart';

import './progressdata.dart';

class Progress extends StatelessWidget {
  final String uid;

  const Progress({Key key, this.uid}) : super(key: key);

  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    ProgressData progress = progresslt[index];

    return Padding(
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
                    image: AssetImage(progress.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2, top: appPadding / 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This Day\'s Progress: ${progress.pct} %',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.select_all,
                            color: black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            'Total Yoga Poses: ${progress.tYoga}',
                            style: TextStyle(
                              color: black.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            'Completed By You: ${progress.dYoga}',
                            style: TextStyle(
                              color: black.withOpacity(0.5),
                            ),
                          )
                        ],
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
            ),
            child: Text(''),
          ),
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: progresslt.length,
            itemBuilder: (context, index) {
              return _buildCourses(context, index);
            },
          ))
        ],
      ),
    );
  }
}
