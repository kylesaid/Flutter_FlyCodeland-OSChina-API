import "package:flutter/material.dart";
import "package:hello_oschina/pages/BarRightView.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _naviBarOffstage = false;

  @override
  void initState() {
    // TODO: implement initState
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage("assets/images/btn_back_dark_normal.png"),
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const SearchBar(
          leading: Icon(Icons.search),
          hintText: "搜索软件、博客、用户",
          hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
          shadowColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        actions: <Widget>[
          RightView(
              title: "搜索",
              rightClick: () {
                print("search something");
              }),
        ],
      ),
    );
  }
}
