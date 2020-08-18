import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_custom_widget/CustomWidget/FormBuilderExample.dart';
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
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    print(brightness);
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light(),
      initialRoute: YoutubeListExample.route,
      routes: <String, WidgetBuilder>{
        YoutubeListExample.route: (BuildContext context) =>
            new YoutubeListExample(),
        ArticleCardExample.route: (BuildContext context) =>
            new ArticleCardExample(),
        CommentExample.route: (BuildContext context) => new CommentExample(),
        UserCardExample.route: (BuildContext context) => new UserCardExample(),
        LoadingListPage.route: (BuildContext context) => new LoadingListPage(),
        FormBuilderExample.route: (BuildContext context) =>
            new FormBuilderExample(),
      },
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
