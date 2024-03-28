import 'package:flutter/material.dart';
import 'package:hello_oschina/pages/SearchPage.dart';
import 'package:hello_oschina/pages/SummaryNewPage.dart';
class SummaryPage extends StatefulWidget {

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> with SingleTickerProviderStateMixin {

  final List<Tab> _tabs = <Tab>[
    const Tab(text: "关注"),
    const Tab(text: "软件"),
    const Tab(text: "最新"),
    const Tab(text: "推荐"),
    const Tab(text: "问答"),
    const Tab(text: "博客"),
    const Tab(text: "英文"),
  ];
  final List<Widget> _tabBars = [
    const Center(child: Tab(text: "关注")),
    const Center(child: Tab(text: "软件")),
    const SummaryNewPage(),
    const Center(child: Tab(text: "推荐")),
    const Center(child: Tab(text: "问答")),
    const Center(child: Tab(text: "博客")),
    const Center(child: Tab(text: "英文")),
  ];

  late TabController _tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.index = 2;
    setState(() {

    });

    //监听器
    _tabController.addListener(() {
      //点击切换tab的时候执行了一个动画效果，滑动切换的时候是没有的，在这个过程中触发了一次Listener,所以触发了两次addListener方法
      // 解决点击tab执行2次的问题
      if(_tabController.index ==_tabController.animation?.value) {
        //实现自定义的功能
        print(_tabController.index);
      }

      //作者：清风折柳
      //链接：https://juejin.cn/post/6913840909658521608
      //来源：稀土掘金
      //著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    });
  }

  void pressSearchButton(){
    print("go search page");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // MaterialApp 的 ThemeData设置useMaterial3为true会去掉阴影
        // 设置false去掉下划线会显示阴影，需要设置阴影高度elevation为0
        elevation: 0,
        title: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabs: _tabs,
          labelStyle: const TextStyle(fontSize: 24.0,fontWeight: FontWeight.w900),
          unselectedLabelStyle: const TextStyle(fontSize: 14.0,fontWeight: FontWeight
              .w900),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const ImageIcon(
              AssetImage("assets/images/ic_search.png")  ,
              //ImageIcon 默认为白色，需设置为想要的颜色
              color: Colors.black,
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabBars,
      ),
    );
  }
}
