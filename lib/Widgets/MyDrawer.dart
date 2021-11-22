import 'package:flutter/material.dart';
import 'package:flycodeland/Pages/DrawAboutPage.dart';
import 'package:flycodeland/Pages/DrawBlackTweetPage.dart';
import 'package:flycodeland/Pages/DrawSendTweetPage.dart';
import 'package:flycodeland/Pages/DrawSettingPage.dart';

class MyDrawer extends StatelessWidget {
  final String headImagePath;
  final List menuIcons;
  final List menuTitles;

  MyDrawer(
      {Key? key,
      required this.headImagePath,
      required this.menuIcons,
      required this.menuTitles})
      : assert(headImagePath != null),
        assert(menuIcons != null),
        assert(menuTitles != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0, //Shadow
      child: ListView.separated(
          padding: const EdgeInsets.all(0.0),
          itemCount: menuTitles.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Image.asset(headImagePath, fit: BoxFit.cover);
            }
            index -= 1;

            return ListTile(
              leading: Icon(menuIcons[index]),
              title: Text(menuTitles[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pop(context);//关闭抽屉
                switch (index) {
                  case 0:
                    _naviPush(context, DrawSendTweetPage());
                    break;
                  case 1:
                    _naviPush(context, DrawBlackTweetPage());
                    break;
                  case 2:
                    _naviPush(context, DrawAboutPage());
                    break;
                  case 3:
                    _naviPush(context, DrawSettingPage());
                    break;
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            if (index == 0) {
              return Divider(
                height: 0.0,
              );
            }else {
              return Divider(
                height: 1.0,
              );
            }
          },
      ));
  }

  _naviPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
