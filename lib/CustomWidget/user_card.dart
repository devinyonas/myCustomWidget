import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final bool status;

  UserCard({
    this.thumbnail,
    @required this.title,
    this.subtitle1 = '',
    this.subtitle2 = '',
    this.subtitle3 = '',
    this.status = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: thumbnail ?? Container(color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: Wrap(
                runAlignment: WrapAlignment.start,
                runSpacing: 3,
                children: <Widget>[
                  Text(
                    '$title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Text(
                    '$subtitle1',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Text(
                    '$subtitle2',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Text(
                    '$subtitle3',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: status ? Colors.green : Colors.red,
            radius: 30,
            child: Icon(
              status ? Icons.check : Icons.clear,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
