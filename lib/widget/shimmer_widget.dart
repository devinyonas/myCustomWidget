import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerMultipleContainer(
    {int pItemCount = 1,
    double pHeight = 150,
    String timeoutText = 'Timeout! Failed to load data',
    Function onTimeOut = null}) {
  return FutureBuilder(
      future: Future.delayed(Duration(seconds: 10)),
      builder: (c, s) {
        if (s.connectionState == ConnectionState.done) {
          if (onTimeOut != null) onTimeOut();
          return Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Text(
                timeoutText,
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: pItemCount,
            itemBuilder: (context, index) {
              return Card(
                  child: Container(
                height: pHeight,
              ));
            },
          ),
        );
      });
}

Widget shimmerGridView({
  int pItemCount = 1,
  int pCrossAxisCount = 1,
  double pMainAxisSpacing = 10,
  double pCrossAxisSpacing = 10,
  double pHeight = 150,
  double pWidth = 150,
  String timeoutText = 'Timeout! Failed to load data',
  Function onTimeOut = null,
  Widget timeOutWidget = null,
}) {
  return FutureBuilder(
      future: Future.delayed(Duration(seconds: 10)),
      builder: (c, s) {
        if (s.connectionState == ConnectionState.done) {
          if (onTimeOut != null) onTimeOut();
          return timeOutWidget ??
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    timeoutText,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: pCrossAxisCount,
              mainAxisSpacing: pMainAxisSpacing,
              crossAxisSpacing: pCrossAxisSpacing,
            ),
            itemCount: pItemCount,
            itemBuilder: (context, index) {
              return Card(
                  child: Container(
                height: pHeight,
                width: pWidth,
              ));
            },
          ),
        );
      });
}
