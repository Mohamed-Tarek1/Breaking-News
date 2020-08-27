import 'dart:ffi';
import 'package:breakingnews/data_utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:breakingnews/api/api_articles.dart';
import 'dart:async';
import 'package:breakingnews/api/all_articles.dart';
class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  ApiArticles api = ApiArticles();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: api.fetchAllArticles(),
    builder: (context,AsyncSnapshot snapShot){

      switch (snapShot.connectionState)
      {
        case ConnectionState.active :
            return connectionError();
          break;
        case ConnectionState.none :
          return noData();
          break;
        case ConnectionState.waiting:
            return Loading();
          break;
        case ConnectionState.done:
          if (snapShot.error != null) {
            return error(snapShot.error);
          } else {
            List<Article> posts = snapShot.data;
            return ListView.builder(itemBuilder: (context,position){
              return Card (
                child: _drawSingleRow(posts[position]),
              );

            },
              itemCount: posts.length,
            // ignore: missing_return
            );

          }

          break;
      }


    },
    );
  }
}
Widget _drawSingleRow(Article article) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Row(

      children: <Widget>[

        Image(image: NetworkImage(article.imageURL),fit:BoxFit.cover,height: 100,width: 100,),
        SizedBox(width: 10,),
        Expanded(
            child: Column(

              children: <Widget>[
                Text(article.title,maxLines: 2,style:
                TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height: 8,),


              ],

            ))

      ],

    ),
  );
}
