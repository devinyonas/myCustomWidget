import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Widget thumbnail, trailing;
  final String title, subtitle1, subtitle2, subtitle3;
  final double titleSize, subtitle1Size, subtitle2Size, subtitle3Size;

  UserCard({
    this.thumbnail,
    @required this.title,
    this.subtitle1 = '',
    this.subtitle2 = '',
    this.subtitle3 = '',
    this.titleSize = 20.0,
    this.subtitle1Size = 15.0,
    this.subtitle2Size = 15.0,
    this.subtitle3Size = 15.0,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            thumbnail != null
                ? AspectRatio(
                    aspectRatio: 1.0,
                    child: thumbnail,
                  )
                : SizedBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: Wrap(
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 3,
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
                    Text(
                      '$subtitle1',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: subtitle1Size,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '$subtitle2',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: subtitle2Size,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '$subtitle3',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: subtitle3Size,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            trailing ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
