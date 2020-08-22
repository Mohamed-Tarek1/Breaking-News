import 'package:flutter/material.dart';
class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,posistion){
    return Card(
      child: _drawSingleRow() ,
    );

    });
  }
}
Widget _drawSingleRow() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Row(

      children: <Widget>[

        Image(image: ExactAssetImage("assets/images/whatnew.jpg"),fit:BoxFit.cover,height: 100,width: 100,),
        SizedBox(width: 10,),
        Expanded(
            child: Column(

              children: <Widget>[
                Text('The world global warming Annual Summer',maxLines: 2,style:
                TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height: 8,),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Michael Adams',),
                    Row(children: <Widget>[Icon(
                        Icons.timer
                    ),
                      Text('15 Min')
                    ],)

                  ],

                )

              ],

            ))

      ],

    ),
  );
}
