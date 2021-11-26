import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flycodeland/Const/Constant.dart' show AppUrls,AppColor;
import 'package:flycodeland/Util/DataUtil.dart';
import 'package:flycodeland/Util/Network.dart';

class NewsDetailPage extends StatefulWidget {
  final int id;

  const NewsDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isLoading = true;
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();
  String url = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //监听url变化
    _flutterWebviewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        if (mounted) {
          setState(() {
            isLoading = true;
          });
        }
      }
    });

    DataUtil.getAccessToken().then((token) {
      //token !=null
      Map<String, dynamic> params = Map<String, dynamic>();
      params['access_token'] = token;
      params['dataType'] = 'json';
      params['id'] = widget.id;
      NetUtil.get(AppUrls.NEWS_DETAIL, params).then((data) {
        if (data != null && data.isNotEmpty) {
          Map<String, dynamic> map = json.decode(data);
          print('NEWS_DETAIL: $map');
          if (!mounted) return;
          setState(() {
            url = map['url'];
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _appBarTitle = [
      Text(
        '资讯详情',
        style: TextStyle(
          color: AppColor.APPBAR_COLOR,
        ),
      ),
    ];

    if (isLoading) {
      _appBarTitle.add(SizedBox(
        width: 10.0,
      ));
      _appBarTitle.add(CupertinoActivityIndicator());
    }

    return url == null
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : WebviewScaffold(
            url: url,
            appBar: AppBar(
              title: Row(
                children: _appBarTitle,
              ),
              iconTheme:IconThemeData(color:AppColor.APPBAR_COLOR), //0412 added
            ),
            withJavascript: true,
            //允许执行js
            withLocalStorage: true,
            //允许本地存储
            withZoom: true, //允许网页缩放
          );
  }
}
