import 'package:flutter/material.dart';
import 'package:my_custom_widget/CustomWidget/all_custom_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          padding: const EdgeInsets.all(8.0),
          itemExtent: 120.0, // each item height from each other
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
            UserCard(
//              thumbnail: Container(
//                decoration: const BoxDecoration(color: Colors.blueGrey),
//              ),
              title: 'John Doe',
              subtitle1:
                  'Squad abecede /Users/admin1/Development/IdeaProjects/my_custom_widget/lib/main.dart',
              subtitle2: 'regiment 123',
              subtitle3:
                  '/Users/admin1/Development/IdeaProjects/my_custom_widget/lib/main.dart',
              status: true,
            ),
          ],
        ),
      ),
    );
  }
}
