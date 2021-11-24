import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flycodeland/Const/Constant.dart' show AppUrls,AppColor,AppUrls;
import 'package:flycodeland/Models/userInfo.dart';
import 'package:flycodeland/Util/DataUtil.dart';
import 'package:flycodeland/Util/Network.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  late UserInfo _userInfo;
  late File _portrait;

  _getDetailInfo() {
    DataUtil.getAccessToken().then((accessToken) {
      print('accessToken: $accessToken');
      //拼装请求
      Map<String, dynamic> params = Map<String, dynamic>();
      params['dataType'] = 'json';
      params['access_token'] = accessToken;
      NetUtil.get(AppUrls.MY_INFORMATION, params).then((data) {
        // {"gender":1,"joinTime":"2014-09-03 10:01:47","city":"长沙","fansCount":0,"portrait":"https://www.oschina.net/img/portrait.gif","expertise":["手机软件开发","软件开发管理"],"platforms":["Android","C/C++"],"uid":2006874,"lastLoginTime":"2019-04-09 22:33:03","province":"湖南","name":"Damon2019","followersCount":0,"favoriteCount":0,"notice":{"referCount":0,"replyCount":0,"msgCount":0,"fansCount":0}}
        print('MY_INFORMATION: $data');
        if (data != null && data.isNotEmpty) {
          Map<String, dynamic> map = json.decode(data);
          UserInfo userInfo = UserInfo(uid: map['uid'],
              name: map['name'],
              gender: map['gender'],
              province: map['province'],
              city: map['city'],
              platforms: map['platforms'],
              expertise: map['expertise'],
              joinTime: map['joinTime'],
              lastLoginTime: map['lastLoginTime'],
              portrait: map['portrait'],
              fansCount: map['fansCount'],
              favoriteCount: map['favoriteCount'],
              followersCount: map['followersCount'],
              notice: map['notice']);

          setState(() {
            _userInfo = userInfo;
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getDetailInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '我的资料',
          style: TextStyle(
            color: AppColor.APPBAR_COLOR,
          ),
        ),
        iconTheme: IconThemeData(color: AppColor.APPBAR_COLOR),
      ),
      body: buildSingleChildScrollView(),
    );
  }

  Widget buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: _userInfo == null
          ? Center(
        child: CupertinoActivityIndicator(),
      )
          : Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '头像',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(_userInfo.portrait),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '昵称',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    _userInfo.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '加入时间',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.joinTime,
                  // _joinTime.split(' ')[0],
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '所在地区',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    _userInfo.city,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '开发平台',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      // 'Android,C/C++,J2ME/K-Java,Python,.NET/C#',
                      _userInfo.platforms.toString(),
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '专长领域',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      // '手机软件开发，服务器开发，软件开发管理',
                      _userInfo.expertise.toString(),
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '粉丝数',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.fansCount.toString(),
                  style: TextStyle(fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '收藏数',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.favoriteCount.toString(),
                  style: TextStyle(fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '关注数',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.followersCount.toString(),
                  style: TextStyle(fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
