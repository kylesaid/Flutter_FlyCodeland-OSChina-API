import 'package:flutter/material.dart';

class DrawSendTweetPage extends StatefulWidget {
  const DrawSendTweetPage({Key? key}) : super(key: key);

  @override
  _DrawSendTweetPageState createState() => _DrawSendTweetPageState();
}

class _DrawSendTweetPageState extends State<DrawSendTweetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Tweets'),
      ),
    );
  }
}

