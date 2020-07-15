//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_custom_widget/widget/my_drawer.dart';

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

class CommentExample extends StatelessWidget {
  static final route = '/CommentExample';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Comment Example'),
            backgroundColor: ThemeData.light().primaryColorLight,
            floating: true,
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 8, right: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CommentWidget(
                      thumbnail: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.lightGreen,
                      ),
                      title: 'John Doe',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum diam non mauris sagittis feugiat. In ultricies enim risus, sed maximus diam ultricies a. In eget feugiat dui, quis mattis sem. Suspendisse at eros fermentum, congue sapien at, auctor velit. Donec congue velit vel turpis mollis fringilla. Quisque nec ipsum mollis, dictum metus sed, lobortis tortor. Ut laoreet finibus nisi. Quisque dolor mauris, volutpat in sagittis sed, tempor sit amet odio. Fusce quis nulla in libero dignissim fringilla. Sed egestas massa quis semper imperdiet. Donec quis cursus lacus. Praesent rhoncus bibendum turpis, at ornare tellus tempor sit amet. Curabitur aliquam in diam ut cursus. Sed elit neque, facilisis in ultrices malesuada, ullamcorper sit amet tortor.',
                      date: '2020/09/17 16:00'),
                  CommentWidget(
                      thumbnail: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.lightGreen,
                      ),
                      title: 'John Doe',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum diam non mauris sagittis feugiat. ',
                      date: '2020/09/17 16:00'),
                  CommentWidget(
                      thumbnail: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.lightGreen,
                      ),
                      title: 'John Doe',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum diam non mauris sagittis feugiat. In ultricies enim risus, sed maximus diam ultricies a. In eget feugiat dui, quis mattis sem. Suspendisse at eros fermentum, congue sapien at, auctor velit. Donec congue velit vel turpis mollis fringilla. Quisque nec ipsum mollis, dictum metus sed, lobortis tortor. Ut laoreet finibus nisi. Quisque dolor mauris, volutpat in sagittis sed, tempor sit amet odio. Fusce quis nulla in libero dignissim fringilla. Sed egestas massa quis semper imperdiet. Donec quis cursus lacus. Praesent rhoncus bibendum turpis, at ornare tellus tempor sit amet. Curabitur aliquam in diam ut cursus. Sed elit neque, facilisis in ultrices malesuada, ullamcorper sit amet tortor.',
                      date: '2020/09/17 16:00'),
                  CommentWidget(
                      thumbnail: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.lightGreen,
                      ),
                      title: 'John Doe',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum diam non mauris sagittis feugiat. ',
                      date: '2020/09/17 16:00'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
