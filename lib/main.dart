import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_oschina/common/ThemeUtils.dart';
import 'package:hello_oschina/pages/FindPage.dart';
import 'package:hello_oschina/pages/MyPage.dart';
import 'package:hello_oschina/pages/PostTopicPage.dart';
import 'package:hello_oschina/pages/SummaryPage.dart';
import 'package:hello_oschina/pages/TweetsPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyClient());
}

class MyClient extends StatefulWidget {
  const MyClient({super.key});

  @override
  State<MyClient> createState() => MyClientState();
}

class MyClientState extends State<MyClient> {
  final Color selectedTabTextColor = const Color(0xff63ca6c);
  final Color normalTabTextColor = const Color(0xff969696);
  Color themeColor = ThemeUtils.defaultColor;

  //当前tab坐标
  int _tabIndex = 0;

  //tabBar 图标集合
  late List<List<Image>> tabImages;

  //app主体
  late IndexedStack _body;

  //设置tabBar上的所有页面
  final List<Widget> pages = [
    SummaryPage(),
    TweetsPage(),
    PostTopicPage(),
    FindPage(),
    MyPage()
  ];

  //获取tabIcon并设置尺寸大小
  Image getTabIcon(path) {
    return Image.asset(path, width: 24.0, height: 24.0);
  }

  //设置tab icon
  Image getNowTabIcon(int nowIndex) {
    return nowIndex == _tabIndex
        ? tabImages[nowIndex][1]
        : tabImages[nowIndex][0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabImages = [
      [
        getTabIcon('assets/images/tabBar/ic_home_synthesize_normal.png'),
        getTabIcon('assets/images/tabBar/ic_home_synthesize_select.png'),
        getTabIcon('assets/images/tabBar/ic_home_synthesize_night_normal.png')
      ],
      [
        getTabIcon('assets/images/tabBar/ic_home_tweet_normal.png'),
        getTabIcon('assets/images/tabBar/ic_home_tweet_select.png'),
        getTabIcon('assets/images/tabBar/ic_home_tweet_night_normal.png')
      ],
      [
        Image.asset('assets/images/tabBar/ic_home_add.png',
            width: 44.0, height: 44.0),
        Image.asset('assets/images/tabBar/ic_home_add.png',
            width: 44.0, height: 44.0),
      ],
      [
        getTabIcon('assets/images/tabBar/ic_home_discover_normal.png'),
        getTabIcon('assets/images/tabBar/ic_home_discover_select.png'),
        getTabIcon('assets/images/tabBar/ic_home_discover_night_normal.png')
      ],
      [
        getTabIcon('assets/images/tabBar/ic_home_user_normal.png'),
        getTabIcon('assets/images/tabBar/ic_home_user_select.png'),
        getTabIcon('assets/images/tabBar/ic_home_user_night_normal.png')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      index: _tabIndex,
      children: pages,
    );

    return MaterialApp(
      theme: ThemeData(
          primaryColor: themeColor,
          //去除TabBar下划线 plan1
          useMaterial3: false,
          //去除TabBar下划线 plan2
          // tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent)
          ),
      builder: EasyLoading.init(),
      home: Scaffold(
        body: _body,
        bottomNavigationBar:
            //第二种，创建后中间的加号label不能省略
            //showSelectedLabels和showUnselectedLabels只能全局设置，不能控制单个的BottomNavigationBarItem
            //感觉如果需要实现，就只能去考虑自定义一个底部的TabBar了
            //The argument [icon] should not be null and the argument [label] should not be null when used in a Material Design's [BottomNavigationBar].
            //     BottomNavigationBar(
            //   items: <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(icon: getNowTabIcon(0), label: '综合'),
            //     BottomNavigationBarItem(icon: getNowTabIcon(1), label: '动弹'),
            //     BottomNavigationBarItem(icon: getNowTabIcon(2), label: ""),
            //     BottomNavigationBarItem(icon: getNowTabIcon(3), label: '发现'),
            //     BottomNavigationBarItem(icon: getNowTabIcon(4), label: '我的'),
            //   ],
            //   type: BottomNavigationBarType.fixed,
            //   selectedItemColor: selectedTabTextColor,
            //   unselectedItemColor: normalTabTextColor,
            //   selectedLabelStyle: const TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            //   unselectedLabelStyle: const TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            //   currentIndex: _tabIndex,
            //   // showSelectedLabels: false,
            //   // showUnselectedLabels: false,
            //   backgroundColor: Colors.white,
            //   onTap: (index) {
            //     setState(() {
            //       _tabIndex = index;
            //     });
            //   },
            // ),

            //第一种，创建无法改变tabBar的label字体
            CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getNowTabIcon(0), label: '综合'),
            BottomNavigationBarItem(icon: getNowTabIcon(1), label: '动弹'),
            BottomNavigationBarItem(icon: getNowTabIcon(2)),
            BottomNavigationBarItem(icon: getNowTabIcon(3), label: '发现'),
            BottomNavigationBarItem(icon: getNowTabIcon(4), label: '我的'),
          ],
          activeColor: selectedTabTextColor,
          inactiveColor: normalTabTextColor,
          currentIndex: _tabIndex,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
