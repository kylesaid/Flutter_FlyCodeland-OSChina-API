import 'package:flutter/material.dart';

class DrawBlackTweetPage extends StatefulWidget {
  const DrawBlackTweetPage({Key? key}) : super(key: key);

  @override
  _DrawBlackTweetPageState createState() => _DrawBlackTweetPageState();
}

class _DrawBlackTweetPageState extends State<DrawBlackTweetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Black Tweets'),
      ),
    );
  }
}

