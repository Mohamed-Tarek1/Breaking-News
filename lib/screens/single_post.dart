import 'package:flutter/material.dart';
import 'package:breakingnews/api/all_articles.dart';
class SinglePost extends StatefulWidget {
 Article article;
 SinglePost(this.article);
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.article.imageURL),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index){
              if(index ==0){
                return Container(
                  height: 500,
                  color: Colors.teal,
                );

              }else{
              return Container(
                height: 250,
                color: Colors.amberAccent,
              );}
            },
    // Builds 1000 ListTiles
    childCount: 350,
    ),
              ),

          ],

    );
  }
}
