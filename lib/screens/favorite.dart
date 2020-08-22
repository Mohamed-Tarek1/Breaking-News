import 'package:flutter/material.dart';
import'dart:math';
class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}
Random random = Random();
List<Color> colorsList = [
  Colors.red,
  Colors.teal,
  Colors.deepOrange,
  Colors.indigo,
  Colors.brown,
  Colors.purple
];
class _FavoriteState extends State<Favorite> {




  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,position){
      return Card(
        child: Column(
          children: <Widget>[
    _authorRow()
            ,
      _newsItemRow(),

          ],

        ) ,
      );

    }, itemCount: 20,);
  }
}
Widget _authorRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 16),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Michael Adams',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text(
                    '15 Min .',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Life Style',
                    style: TextStyle(
                      color: _getRandomColor(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      IconButton(
        icon: Icon(Icons.bookmark_border),
        onPressed: () {},
        color: Colors.grey,
      ),
    ],
  );
}

Color _getRandomColor() {
  return colorsList[random.nextInt(colorsList.length)];
}
Widget _newsItemRow(){
  return Row(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/whatnew.jpg'),
              fit: BoxFit.cover),
        ),
        width: 124,
        height: 124,
        margin: EdgeInsets.only( right: 16 ),
      ),
      Expanded(
        child: Column(
          children: <Widget>[
            Text(
              'Tech Tent: Old phones and safe social',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            Text(
              'We also talk about the future of work as the robots advance, and we ask whether a retro phone',
              style: TextStyle(color: Colors.grey, fontSize: 16 , height: 1.25),
            ),
          ],
        ),
      ),
    ],
  );
}
