import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:breakingnews/screens/navigator_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
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
              children: <Widget>[_cardHeader(),
                _cardBody(),
              _drawLine(),
                _cardFooter()],
            ),
          ));
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/whatnew.jpg'),
            radius: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Christina Meyeres',style:  TextStyle(color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,fontSize: 16)),

                    SizedBox( width:8.0),
                    Text('@ch_meyeres' ,style:  TextStyle(color: Colors.grey),),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Fri, 22 June 2020 - 10.03'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Text('We also talk about the omomom  olm;lafm ;m'
          ';lmfk  dmmkmf jdnajf kn fnejkfn',style: TextStyle(fontSize: 18,height: 1.3,color: Colors.grey.shade900),),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: <Widget>[
          Row(
              children: <Widget>[
            IconButton(
              icon: Icon(Icons.repeat),
              color: Colors.orange,
              iconSize: 30.0,
              onPressed: () {},
            ),
            Text('25'),
          ]),
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

Widget _drawLine() {
  return Container(
    height: 1.0
    ,
    color: Colors.grey.shade200,
    margin: EdgeInsets.only(top: 16.0),
  );
}
