import 'package:flutter/material.dart';
import 'package:flycodeland/Pages/common_web_page.dart';
import 'package:flycodeland/Pages/find_scan_page.dart';
import 'package:flycodeland/Pages/find_shake_page.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<Map<String, IconData>> blocks = [
    {
      '开源众包': Icons.pageview,
      '开源软件': Icons.speaker_notes_off,
      '码云推荐': Icons.screen_share,
      '代码骗贷': Icons.assignment,
    },
    {
      '扫一扫': Icons.camera_alt,
      '摇一摇': Icons.camera,
    },
    {
      '码云封面人物': Icons.person,
      '线下活动': Icons.android,
    }
  ];

  void _handlerItemClick(String title) {
    switch (title) {
      case '开源众包':
        _navToWebPage(title, 'https://zb.oschina.net/');
        break;
      case '扫一扫':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FindScanPage()));
        // final String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FindScanPage()));
        // if(result != null && result.length > 0){
        //   print('result:$result');
        // }
        break;
      case '摇一摇':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FindShakePage()));
        break;
    }
  }

  void _navToWebPage(String title, String url) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CommonWebPage(title: title, url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (context, blockIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                // top: BorderSide(
                //   width: 1.0,
                //   color: Color(0xffaaaaaa),
                // ),
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0xffaaaaaa),
                ),
              ),
            ),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, itemIndex) {
                  return InkWell(
                    onTap: () {
                      _handlerItemClick(
                          blocks[blockIndex].keys.elementAt(itemIndex));
                    },
                    child: ListTile(
                      leading:
                          Icon(blocks[blockIndex].values.elementAt(itemIndex)),
                      title: Text(blocks[blockIndex].keys.elementAt(itemIndex)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
                separatorBuilder: (context, itemIndex) {
                  return Divider(
                    height: 2.0,
                    color: Color(0xffaaaaaa),
                  );
                },
                itemCount: blocks[blockIndex].length),
          );
        });
  }
}
