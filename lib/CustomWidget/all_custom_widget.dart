export 'youtube_like_card.dart';
export 'article_card.dart';
export 'user_card.dart';
export 'tabBar_dialog.dart';
export 'comment_widget.dart';
export 'FormBuilderExample.dart';
export 'shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:my_custom_widget/widget/photo_image_picker.dart';

import '../widget/my_drawer.dart';

class DialogWidgetList extends StatelessWidget {
  static final route = '/DialogWidgetList';
  const DialogWidgetList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialog Widget List')),
      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await openCamOrDirDialog();
                },
                child: Text('PHOTO AND IMAGE PICKER'))
          ],
        ),
      ),
    );
  }
}
