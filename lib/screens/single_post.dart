import 'package:flutter/cupertino.dart';
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
      body: CustomScrollView(

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
                  return _drawPostDetails();
                }else if(index>0&&index<=25){
    return _comments();
                }else{
                return _addComment();
                }
              },

      childCount: 27,
      ),
                ),

            ],

      ),
    );
  }

  Widget _drawPostDetails() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(widget.article.desc,style: TextStyle(
          fontSize: 18.0,
          height: 1.1,
          letterSpacing: 1.2
        ),),
      ),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            height: 2.0,
            color: Colors.grey.shade100,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:8.0,top: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/images/whatnew.jpg'),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("the publisher"),
                  Text("time"),
                ],)
              ],
            ),
          ),
            Text("the comment on the article"),
        ],
      ),
    );
  }

  Widget _addComment() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Row(
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:'Write your Comment here!',

              filled: true,
              contentPadding: EdgeInsets.only(left: 16,top: 16,bottom: 16)
            ),
          ),
        ),
        FlatButton(
          child: Text("SEND",style: TextStyle(
            color: Colors.blue,
            fontSize: 18
          ),),
          onPressed: (){

          },
        )
      ],
      ),
    );
  }
}
