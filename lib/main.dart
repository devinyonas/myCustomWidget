import 'package:flutter/material.dart';
import 'package:my_custom_widget/CustomWidget/all_custom_widget.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom Widget Showcase"),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
//          itemExtent: 120.0, // each item height from each other
          children: [
            YoutubeListItem(
              user: 'Flutter',
              viewCount: 999000,
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
              title: 'The Flutter YouTube Channel',
            ),
            ArticleCard(
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.pink),
              ),
              title: 'Flutter 1.2 Release - Continual updates to the framework',
              subtitle: 'Flutter continues to improve and expand its horizons.'
                  'This text should max out at two lines and clip',
              author: 'Dash',
              publishDate: 'Dec 28',
              readDuration: '5 mins',
            ),
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
            UserCard(
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              title: 'John Doe',
              subtitle1:
                  'Squad abecede /Users/admin1/Development/IdeaProjects/my_custom_widget/lib/main.dart',
//              subtitle2: 'regiment 123',
              subtitle3:
                  '/Users/admin1/Development/IdeaProjects/my_custom_widget/lib/main.dart',
              trailing: CircleAvatar(
                backgroundColor: true ? Colors.green : Colors.red,
                radius: 30,
                child: Icon(
                  true ? Icons.check : Icons.clear,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _openDialog(context);
            }),
      ),
    );
  }

  _openDialog(BuildContext context) async {
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) => TabBarDialog(),
    );
    print(result);
  }
}
