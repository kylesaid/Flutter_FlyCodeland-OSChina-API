import 'package:flutter/material.dart';

class DrawSettingPage extends StatefulWidget {
  const DrawSettingPage({Key? key}) : super(key: key);

  @override
  _DrawSettingPageState createState() => _DrawSettingPageState();
}

class _DrawSettingPageState extends State<DrawSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
    );
  }
}

