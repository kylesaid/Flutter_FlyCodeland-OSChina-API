import 'package:flutter/material.dart';

class NewListItem extends StatelessWidget {

  final Map<String,dynamic> newsList;

  NewListItem({Key? key,required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffaaaaaa),
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text('@${newsList['author']} ${newsList['pubDate'].toString().split(' ')[0]}'),
            Row(
              children: <Widget>[
                Icon(Icons.message),
                Text('${newsList['commentCount']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

