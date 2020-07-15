import 'package:flutter/material.dart';
import 'package:my_custom_widget/widget/my_drawer.dart';

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate · $readDuration ★',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ArticleCard extends StatelessWidget {
  ArticleCard({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: thumbnail,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: _ArticleDescription(
                title: title,
                subtitle: subtitle,
                author: author,
                publishDate: publishDate,
                readDuration: readDuration,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArticleCardExample extends StatelessWidget {
  static final route = '/ArticleCardExample';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Article Card Example'),
            floating: true,
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 8, right: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ArticleCard(
                    thumbnail: Container(
                      decoration: const BoxDecoration(color: Colors.pink),
                    ),
                    title: 'Flutter 1.0 Launch',
                    subtitle:
                        'Flutter continues to improve and expand its horizons.'
                        'This text should max out at two lines and clip',
                    author: 'Dash',
                    publishDate: 'Dec 28',
                    readDuration: '5 mins',
                  ),
                  ArticleCard(
                    thumbnail: Container(
                      decoration: const BoxDecoration(color: Colors.blue),
                    ),
                    title:
                        'Flutter 1.2 Release - Continual updates to the framework',
                    subtitle: 'Flutter once again improves and makes updates.',
                    author: 'Flutter',
                    publishDate: 'Feb 26',
                    readDuration: '12 mins',
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
