import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget wProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget wProgressIndicatorWithFuture() {
  return Center(
    child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 10)),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            return Material(
              child: Container(
                child: Center(
                  child: Text(
                    'Gagal memuat data',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        }),
  );
}

Future showLoadingOverlay() {
  return Get.dialog(
      Container(
        color: Colors.transparent,
        child: Center(
          child: wProgressIndicator(),
        ),
      ),
      barrierDismissible: false);
}

void closeOverlay({bool all = false}) {
  Get.back(closeOverlays: all);
}
