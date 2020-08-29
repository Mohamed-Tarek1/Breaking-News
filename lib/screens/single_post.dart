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
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.teal,
      ),
    );
  }
}
