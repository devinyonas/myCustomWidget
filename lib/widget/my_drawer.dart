import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_custom_widget/CustomWidget/all_custom_widget.dart';

class MyDrawer extends StatelessWidget {
  Widget LoadingContainer() {
    return Container(
      color: Colors.grey,
    );
  }

  void NavigatorPopPushRoute(BuildContext context, String route) {
    //POP UNTIL CANNOT POP//
    Navigator.of(context).popUntil((route) {
      return !Navigator.of(context).canPop();
    });
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
                ),
              ),
            ),
            child: SizedBox(),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    ListTile(
                      title: Text("Flutter Youtube List"),
                      onTap: () {
                        NavigatorPopPushRoute(
                            context, YoutubeListExample.route);
                      },
                    ),
                    ListTile(
                      title: Text("Article Card"),
                      onTap: () {
                        NavigatorPopPushRoute(
                            context, ArticleCardExample.route);
                      },
                    ),
                    ListTile(
                      title: Text("Comment Widget"),
                      onTap: () {
                        NavigatorPopPushRoute(context, CommentExample.route);
                      },
                    ),
                    ListTile(
                      title: Text("User Card"),
                      onTap: () {
                        NavigatorPopPushRoute(context, UserCardExample.route);
                      },
                    ),
                    // ListTile(
                    //   title: Text("FormBuilder Example"),
                    //   onTap: () {
                    //     NavigatorPopPushRoute(
                    //         context, FormBuilderExample.route);
                    //   },
                    // ),
                    ListTile(
                      title: Text("Shimmer Loading List Example"),
                      onTap: () {
                        NavigatorPopPushRoute(context, LoadingListPage.route);
                      },
                    ),
                    ListTile(
                      title: Text("Dialog Widget List"),
                      onTap: () {
                        NavigatorPopPushRoute(context, DialogWidgetList.route);
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
