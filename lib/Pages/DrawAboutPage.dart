import 'package:flutter/material.dart';

class DrawAboutPage extends StatefulWidget {
  const DrawAboutPage({Key? key}) : super(key: key);

  @override
  _DrawAboutPageState createState() => _DrawAboutPageState();
}

class _DrawAboutPageState extends State<DrawAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
    );
  }
}

