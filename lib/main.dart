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
          itemExtent: 110.0, // each item height from each other
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
                decoration: const BoxDecoration(color: Colors.red),
              ),
              title: 'Flutter 1.2 Release - Continual updates to the framework',
              subtitle: 'Flutter once again improves and makes updates.',
              author: 'Flutter',
              publishDate: 'Feb 26',
              readDuration: '12 mins',
            ),
          ],
        ),
      ),
    );
  }
}
