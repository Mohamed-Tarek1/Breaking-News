
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:breakingnews/screens/navigator_drawer.dart';

class InstgramFeeds extends StatefulWidget {
  @override
  _InstgramFeedsState createState() => _InstgramFeedsState();
}

class _InstgramFeedsState extends State<InstgramFeeds> {
  Color like = Colors.grey;
  TextStyle _hashtagStyle =TextStyle(color: Colors.orange);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feeds'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
            ),
          )
        ],
      ),
      drawer: NavigatorDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, position) {
          return Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _cardHeader(),
                     _cardHashtags(),
                    _cardBody(),
                    _cardFooter()],
                ),
              ));
        },
        itemCount: 20,
      ),
    );
  }


  Widget _cardHeader() { return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/whatnew.jpg'),
                radius: 24,
              ),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Christina Meyeres',style:  TextStyle(color: Colors.grey.shade900,
                      fontWeight: FontWeight.w600,fontSize: 16)),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Fri, 22 June 2020 - 10.03'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon( Icons.favorite,size: 27 ,color: like,),
                      onPressed: (){
                        setState(() {
                        });
                      },
                    ),
                    Transform.translate(
                      offset :Offset(-12,0),
                      child: Text('25',style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13
                      ),),
                    )
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('we should do our best to get and reach our dream '
              ,
              style: TextStyle(
                  fontSize: 15,color: Colors.grey.shade900
              ),),
          ),
        ],
      ),
    ),
  );}


  Widget _cardHashtags() {

    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(child: Text('#advance',style:_hashtagStyle,),onPressed: (){},),
        ],

      ),
    );
  }


  Widget _cardBody(){
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.25,
      child: Image(
        image: ExactAssetImage('assets/images/whatnew.jpg'),fit: BoxFit.cover,
      ),
    );
  }
  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: <Widget>[

                FlatButton(child: Transform.translate(
                    offset: Offset(-12,0)
                    ,child: Text('25 COMMENTS',style: TextStyle(color: Colors.orange),)),onPressed: (){},),


          Row(
            children: <Widget>[
              FlatButton(child: Text('SHARE',style: TextStyle(color: Colors.orange),),onPressed: (){}),
              FlatButton(child: Text('OPEN',style: TextStyle(color: Colors.orange)),onPressed: (){}),
            ],
          )
        ],
      ),
    );
  }


}
