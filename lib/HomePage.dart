import 'package:flutter/material.dart';
import 'package:flycodeland/Pages/FindPage.dart';
import 'package:flycodeland/Pages/NewsList.dart';
import 'package:flycodeland/Pages/ProfilePage.dart';
import 'package:flycodeland/Pages/TweetPage.dart';
import 'package:flycodeland/Widgets/MyDrawer.dart';
import 'package:flycodeland/Widgets/navigation_item_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appTitle = ['News', 'Moment', 'Find', 'Mine'];
  late List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: 'News',
          iconPath: 'assets/images/ic_nav_news_normal.png',
          selIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: 'Moment',
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          selIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: 'Find',
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          selIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: 'My',
          iconPath: 'assets/images/ic_nav_my_normal.png',
          selIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];

    _pages = [NewsListPage(), TweetPage(), FindPage(), ProfilePage()];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          _appTitle[_currentIndex],
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _pages[_currentIndex];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navigationIconViews.map((view) => view.item).toList(),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 1), curve: Curves.ease);
        },
      ),
      drawer: MyDrawer(
        headImagePath: 'assets/images/cover_img.jpg',
        menuIcons: [Icons.send, Icons.home, Icons.people, Icons.settings],
        menuTitles: ['Send Tweet', 'Black Tweet', 'About Us', 'Settings'],
      ),
    ));
  }
}
