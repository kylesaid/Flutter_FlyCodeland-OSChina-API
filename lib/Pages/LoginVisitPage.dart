import 'dart:convert';

import "package:flutter/material.dart";
import 'package:hello_oschina/common/LocalStorage.dart';
import 'package:webview_flutter/webview_flutter.dart';


import '../models/login_token_entity.dart';


class LoginVisitPage extends StatefulWidget {
  const LoginVisitPage({super.key});

  @override
  State<LoginVisitPage> createState() => _LoginVisitPageState();
}

class _LoginVisitPageState extends State<LoginVisitPage> {
  late WebViewController controller;

  String client_id = 'i4rLJxsmURDhf0jRgrYp';
  String client_secret = 'w6Rbh1jDK4dIqlKToAtCMLPHJrI7fsNg';

  String redirect_url = 'https://www.baidu.com/';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {

          },
          onUrlChange: (UrlChange urlChange) {
            // if (urlChange.url.startsWith("https://www.baidu.com/?code=")){
            //
            // }
            print(urlChange.url);
          },
          onPageFinished: (String url) async {
            //step4 判断是否进入action/openapi/token
            if(url.startsWith('https://www.oschina.net/action/openapi/token?')) {
              //step5 调用js方法获取到access_token
              String message = await controller.runJavaScriptReturningResult(
                  "document.getElementsByTagName('pre')[0].innerText").toString();
              print(message);
              //{"access_token":"96e09aa9-b3e0-43ae-a884-4a5ffaf74b5c","refresh_token":"db83d6b0-039d-4aaf-995d-2867d2a316b8","uid":2822841,"token_type":"bearer","expires_in":336581}
              //转为model
              LoginTokenEntity entity = LoginTokenEntity.fromJson(jsonDecode(message));

              //step6 本地化存储access_token
              LocalStorage.save('access_token', entity.accessToken!);
              Navigator.pop(context);
            }
          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            String destination = request.url;
            //step1 判断是否为回调地址的跳转，并获取code
            if (destination.startsWith('https://www.baidu.com/?code=')) {
              print("enter code= $destination");
              int start = 'https://www.baidu.com/?code='.length;
              String code = destination.substring(start, start + 6);
              print("code:$code");

              if (code.isNotEmpty) {
                //step3 访问获取token
                controller.loadRequest(Uri.parse(
                    "https://www.oschina.net/action/openapi/token?client_id=$client_id&client_secret=$client_secret&redirect_uri=$redirect_url&code=$code&dataType=json&grant_type=authorization_code"));

                return NavigationDecision.prevent;
              }
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.oschina.net/action/oauth2/authorize?client_id=$client_id&response_type=code&redirect_uri=$redirect_url'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('开源中国认证授权'),
        titleTextStyle: const TextStyle(color: Colors.black,fontSize: 18.0),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage("assets/images/btn_back_dark_normal.png"),
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
