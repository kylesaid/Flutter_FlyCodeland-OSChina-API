import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flycodeland/Common/evenbus.dart';
import 'package:flycodeland/Const/Constant.dart';
import 'package:flycodeland/Pages/LoginPage.dart';
import 'package:flycodeland/Util/DataUtil.dart';
import 'package:flycodeland/Util/Network.dart';
import 'package:flycodeland/Widgets/NewListItem.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  bool isLogin = false;
  int curPage = 1;
  List newsList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataUtil.isLogin().then((isLogin) {
      if (!mounted) return;
      setState(() {
        this.isLogin = isLogin;
      });
    });
    evenBus.on<LoginEvent>().listen((event) {
      if (!mounted) return;
      setState(() {
        this.isLogin = true;
      });
      //获取新闻列表
      getNewsList(false);
    });
    evenBus.on<LogOutEvent>().listen((event) {
      if (!mounted) return;
      setState(() {
        this.isLogin = false;
      });
    });
  }

  //NEWS_LIST
  getNewsList(bool isLoadMore) async {
    DataUtil.isLogin().then((isLogin) {
      if (isLogin) {
        DataUtil.getAccessToken().then((accessToken) {
          if (accessToken == null || accessToken.length == 0) {
            return;
          }
          Map<String, dynamic> params = Map<String, dynamic>();
          params['access_token'] = accessToken;
          params['catalog'] = 1;
          params['page'] = curPage;
          params['pageSize'] = 10;
          params['dataType'] = 'json';

          NetUtil.get(AppUrls.NEWS_LIST, params).then((data) {
            //{
            //    "newslist": [
            //        {
            //            "id": 26754,
            //            "author": "test33",
            //            "pubDate": "2013-09-17 16:49:50.0",
            //            "title": "asdfa",
            //            "authorid": 253469,
            //            "commentCount": 0,
            //            "type": 4
            //        }
            //    ],
            //    "notice": {
            //        "replyCount": 0,
            //        "msgCount": 0,
            //        "fansCount": 0,
            //        "referCount": 0
            //    }
            //}
            print('NEWS_LIST: $data');
            if (data != null && data.isNotEmpty) {
              Map<String, dynamic> map = json.decode(data);
              List _newsList = map['newslist'];
              if (!mounted) return;
              setState(() {
                if (isLoadMore) {
                  newsList.addAll(_newsList);
                } else {
                  newsList = _newsList;
                }
              });
            }
          });
        });
      }
    });
  }

  Future<Null> _pullToRefresh() async{
    curPage = 1;
    getNewsList(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if(!isLogin){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Because the limit of openapi, to get news must be logined'),
            InkWell(
              onTap: () async {
                final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWebPage()));
                if(result != null && result == 'refresh'){
                  evenBus.fire(LoginEvent());
                }
              },
              child: Text('Go to Login.'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _pullToRefresh,
      child: buildListView(),
    );
  }

  Widget buildListView() {
    if (newsList == null) {
      getNewsList(false);
      return CupertinoActivityIndicator();

    }
    return ListView.builder(
      itemCount: newsList.length,
        itemBuilder: (context, index) {
      return NewListItem(newsList: newsList[index]);
    });
  }
}

