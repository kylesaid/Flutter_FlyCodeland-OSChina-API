import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flycodeland/Util/Network.dart';
import 'package:flycodeland/Util/DataUtil.dart';
import 'package:flycodeland/Const/Constant.dart' show AppColor,AppInfos,AppUrls;
import 'package:flutter/cupertino.dart';

import 'dart:convert';

class LoginWebPage extends StatefulWidget {
  const LoginWebPage({Key? key}) : super(key: key);

  @override
  _LoginWebPageState createState() => _LoginWebPageState();
}

class _LoginWebPageState extends State<LoginWebPage> {
  FlutterWebviewPlugin _webviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _webviewPlugin.onUrlChanged.listen((url) {
      print('login :$url');
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
      //      https://www.dongnaoedu.com/?code=6hHYoH&state=
      if (url != null && url.length > 0 && url.contains('?code=')) {
        //登录成功了
        //提取授权码code
        String code = url.split('?')[1].split('&')[0].split('=')[1];
        Map<String, dynamic> params = Map<String, dynamic>();
        params['client_id'] = AppInfos.client_id;
        params['client_secret'] = AppInfos.CLIENT_SECRET;
        params['grant_type'] = 'authorization_code';
        params['redirect_uri'] = AppInfos.REDIRECT_URI;
        params['code'] = '$code';
        params['dataType'] = 'json';
        NetUtil.get(AppUrls.OAUTH2_TOKEN, params).then((data) {
//{"access_token":"aa105aaf-ca4f-4458-822d-1ae6a1fa33f9","refresh_token":"daae8b80-3ca6-4514-a8ae-acb3a82c951c","uid":2006874,"token_type":"bearer","expires_in":510070}
          print('$data');
          if (data != null) {

            Map<String, dynamic> map = json.decode(data);
            if (map != null && map.isNotEmpty) {
              //保存token等信息
              DataUtil.saveLoginInfo(map);
              //弹出当前路由，并返回refresh通知我的界面刷新数据
              Navigator.pop(context, 'refresh');
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _webviewPlugin.close();
  }

  @override
  Widget build(BuildContext context){
    List<Widget> _appBarTitle = [
      Text('登录开源中国',style: TextStyle(color: AppColor.APPBAR_COLOR)),
    ];

    if(isLoading) {
      _appBarTitle.add(SizedBox(width: 10.0,));
      _appBarTitle.add(CupertinoActivityIndicator());
    }

    return WebviewScaffold(url: AppUrls.OAUTH2_AUTHORIZE +
        '?response_type=code&client_id=' +
        AppInfos.client_id +
        '&redirect_uri=' +
        AppInfos.REDIRECT_URI,
      appBar: AppBar(
        title: Row(
          children: _appBarTitle,
        ),
      ),
withJavascript: true,
      withZoom: true,
    );
  }


}
