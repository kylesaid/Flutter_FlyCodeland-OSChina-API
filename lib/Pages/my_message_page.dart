import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flycodeland/Const/Constant.dart';
import 'package:flycodeland/Util/DataUtil.dart';
import 'package:flycodeland/Util/Network.dart';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({Key? key}) : super(key: key);

  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  List<String> _tabTitles = ['@Me','Comment','Private'];
  List _tabIcons = [Icons.people,Icons.comment,Icons.privacy_tip];
  int curPage = 1;
  List messageList = [];


  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _tabTitles.length,
      child: new Scaffold(
        appBar:AppBar(
          elevation: 0.0,
          title: Text('Message Center',
            style: TextStyle(color: AppColor.APPBAR_COLOR),
          ),
          iconTheme: IconThemeData(color: AppColor.APPBAR_COLOR,),
          bottom: TabBar(
            tabs: choices.map((Choice choice) => Tab(text: choice.title,icon:Icon(choice.icon),)).toList(),
          ),
        ),
        body: TabBarView(
children: [
  Center(child: Text('Empty Content')),
  Center(child: Text('Empty Content')),
  _buildMessageList(),
],
        ),
      ),
    );
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    _getMessageList();
    return null;
  }

  _buildMessageList(){
    if(messageList == null){
      _getMessageList();
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return RefreshIndicator(child: ListView.separated(itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child:Row(
          children: <Widget>[
            Image.network(messageList[index]['portrait']),
            SizedBox(width: 10.0,),
            Expanded(
              child:Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${messageList[index]['sendername']}',
                        style: TextStyle(fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('${messageList[index]['pubDate']}',
                        style: TextStyle(fontSize: 12.0,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                  Text('${messageList[index]['content']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],)
        );
    }, separatorBuilder: (context,index){
      return Divider(height: 1.0,);
    }, itemCount: messageList.length
    ), onRefresh: _pullToRefresh);
  }

  void _getMessageList(){
    DataUtil.isLogin().then((isLogin){
      if(isLogin){
        DataUtil.getAccessToken().then((accessToken){
          print('accessToken:$accessToken');
          Map<String, dynamic> params = Map<String,dynamic>();
          params['dataTypes'] = 'json';
          params['page'] = curPage;
          params['pageSize'] = 10;
          params['access_token'] = accessToken;
          NetUtil.get(AppUrls.MESSAGE_LIST, params).then((data){
            print('MESSAGE_LIST:$data');
            if(data != null && data.isNotEmpty){
              Map<String,dynamic> map = json.decode(data);
              var _messageList = map['messageList'];
              setState(() {
                messageList = _messageList;
              });
            }
          });
        });
      }
    });
  }
}
class Choice {
  const Choice({required this.title,required this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '@Me', icon: Icons.people),
  const Choice(title: 'Comment', icon: Icons.comment),
  const Choice(title: 'Private', icon: Icons.privacy_tip),
];
