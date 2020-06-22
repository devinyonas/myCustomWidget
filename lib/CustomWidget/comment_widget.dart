//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final Widget thumbnail;
  final String title, subtitle, date;
  final double titleSize, subtitleSize, dateSize;

  CommentWidget({
    this.thumbnail,
    @required this.title,
    this.subtitle = '',
    this.date = '',
    this.titleSize = 20.0,
    this.subtitleSize = 15.0,
    this.dateSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          thumbnail ?? SizedBox(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '$title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '$date',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: dateSize,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$subtitle',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
