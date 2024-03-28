import 'package:flutter/material.dart';
import 'package:hello_oschina/common/ThemeUtils.dart';

class RightView extends StatelessWidget {
  String title;
  VoidCallback rightClick;

  RightView({super.key, required this.title, required this.rightClick});

  @override
  Widget build(BuildContext context) {

    var containView;

    if (title != Null) {
      containView = Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: rightClick,
          child: Text(
            title,
            style: const TextStyle(color: ThemeUtils.defaultColor, fontSize: 18.0),
          ),
        ),
      );
    } else {
      containView = const Text("");
    }
    return containView;
  }
}
