import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flycodeland/Const/Constant.dart' show AppColor, AppUrls;
import 'package:flycodeland/Pages/LoginPage.dart';
import 'package:flycodeland/Common/evenbus.dart';
import 'package:flycodeland/Pages/my_message_page.dart';
import 'package:flycodeland/Pages/profile_detail_page.dart';
import 'package:flycodeland/Util/DataUtil.dart';
import 'package:flycodeland/Util/Network.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List menuTitles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];
  List menuIcons = [
    Icons.message,
    Icons.print,
    Icons.error,
    Icons.phone,
    Icons.send,
    Icons.people,
    Icons.person,
  ];

  String userAvator = '';
  String userName = 'Click Head Image To Login';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _showUerInfo();

    evenBus.on<LoginEvent>().listen((event) {
      _getUserInfo();
    });

    evenBus.on<LogOutEvent>().listen((event) {
      _showUerInfo();
    });
  }

  _getUserInfo() {
    DataUtil.getAccessToken().then((value) {
      if (value == null || value.length == 0) {
        return;
      }
      Map<String, dynamic> params = Map<String, dynamic>();
      params['access_token'] = value;
      params['dataType'] = 'json';
      print('accessToken: $value');

      NetUtil.get(AppUrls.OPENAPI_USER, params).then((data) {
        print('data:$data');
        Map<String, dynamic> map = json.decode(data);
        if (mounted) {
          setState(() {
            userAvator = map['avator'];
            userName = map['name'];
          });
          DataUtil.saveUserInfo(map);
        }
      });
    });
  }

  _showUerInfo() {
    DataUtil.getUserInfo().then((user) {
      if (mounted) {
        setState(() {
          if (user != null) {
            userAvator = user.avator;
            userName = user.name;
          } else {}
          userAvator = '';
          userName = '';
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    evenBus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildHeader();
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(menuTitles[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              DataUtil.isLogin().then((isLogin) {
                // if (isLogin) {
                  switch (index) {
                    case 0:
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyMessagePage()));
                      break;
                  }
                // } else {
                //   _login();
                // }
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
          );
        },
        itemCount: menuTitles.length + 1);
  }

  _login() async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginWebPage()));
    if (result != null && result == 'refresh') {
      //Login successful
      evenBus.fire(LoginEvent());
    }
  }

  Container _buildHeader() {
    return Container(
      height: 150.0,
      color: AppColor.THEME_COLOR,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: userAvator == ''
                  ? Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColor.APPBAR_COLOR, width: 2.0),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/ic_avatar_default.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Image.asset(
                      'assets/images/ic_avatar_default.png',
                      width: 60.0,
                      height: 60.0,
                    ),
              onTap: () {
                DataUtil.isLogin().then((isLogin) {
                  if (isLogin) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileDetailPage()));
                  } else {
                    _login();
                  }
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              userName,
              style: TextStyle(color: AppColor.APPBAR_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}
