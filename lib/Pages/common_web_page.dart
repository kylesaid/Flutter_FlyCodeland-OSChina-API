import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flycodeland/Const/Constant.dart' show AppColor;

class CommonWebPage extends StatefulWidget {
  final String title;
  final String url;

  CommonWebPage({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  _CommonWebPageState createState() => _CommonWebPageState();
}

class _CommonWebPageState extends State<CommonWebPage> {
  bool isLoading = true;
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //listen url change
    _flutterWebviewPlugin.onStateChanged.listen((state) {
      if (!mounted) return;

      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoading = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _appBarTitle = [
      Text(
        widget.title,
        style: TextStyle(color: AppColor.APPBAR_COLOR),
      ),
    ];

    if (isLoading) {
      _appBarTitle.add(SizedBox(width: 10.0));
      _appBarTitle.add(CupertinoActivityIndicator());
    }

    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Row(
          children: _appBarTitle,
        ),
        iconTheme: IconThemeData(color: AppColor.APPBAR_COLOR),
      ),
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
    );
  }
}
