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
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20.0),
          child: Column(
            children: <Widget>[
              Text('${newsList['title']}',
                style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0,),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                Text('@${newsList['author']} ${newsList['pubDate'].toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 14.0,color: Color(0xffaaaaaa)),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.message,color: Color(0xffaaaaaa),),
                    Text('${newsList['commentCount']}',
                    style: TextStyle(color: Color(0xffaaaaaa),fontSize: 14.0),),
                  ],
                ),
               ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

