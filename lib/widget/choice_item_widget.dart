import 'package:flutter/material.dart';

class ChoiceItemWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  const ChoiceItemWidget({this.title, this.isSelected, this.onTap}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          ),
        ),
      ),
    );
  }
}
