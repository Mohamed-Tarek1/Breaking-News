import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          drawHeader(desc:'Description.........',header:'Header' ,),
          Padding(
            padding: const EdgeInsets.all(10.0),

              child:   _drawSectionTitle('Top Stories'),

          ),
            _drawTopStories(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left :8.0,bottom: 8.0),
                    child: _drawSectionTitle('Recently Updates'),
                  ),
                  _drawRecntlyUpdatesCard(Colors.orange,'sports'),
                  _drawRecntlyUpdatesCard(Colors.teal,'politics'),
                  SizedBox(height: 40,)
                ],
              ),
            )
        ],),
      )

    );
  }

  Widget _drawTopStories() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
      child: Card(

        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _drawSingleRow()
              ,
              _drawDivider()
              ,_drawSingleRow(),
              _drawDivider()
              ,
              _drawSingleRow(),
              _drawDivider(),
            ],



          ),
        ),


      ),

    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }

   Widget _drawSectionTitle(String s) {
    return Text(s,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,
        color: Colors.grey.shade400),);
   }

 Widget _drawRecntlyUpdatesCard(Color color , String type ) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image : ExactAssetImage('assets/images/whatnew.jpg'),
              fit: BoxFit.cover,
    )  ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.25,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
            padding: EdgeInsets.only(left :24.0,right: 16.0, top: 2.0),
            decoration: BoxDecoration(
              color: color ,
                borderRadius: BorderRadius.circular(4),
            ),
              child: Text(type,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),),

            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0,bottom: 8.0),
            child: Text(
                'Ferari is high speed'
              ,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,

            ),
            ),
          )
          ,
          Padding(
            padding: const EdgeInsets.only(left: 16.0,bottom: 8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer
                ,color:Colors.grey.shade400,size: 14 ,),
                Text('15 Min',style: TextStyle(color: Colors.grey.shade400,fontSize: 12),)
              ],
            ),
          )
        ],
      ),
    );
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








class drawHeader extends StatelessWidget {
   final  String header,desc;

   drawHeader({ this.header, this.desc}) ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/whatnew.jpg'),
              fit: BoxFit.cover,
            )
          ),
          width:MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height * 0.27,
        child: Center(
          child: Column(

    mainAxisAlignment: MainAxisAlignment.center ,
    children: <Widget>[
    Text(header,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,
    fontSize: 20),textAlign: TextAlign.center,),
    SizedBox(height: 8.0,),
      Text(desc,style: TextStyle(color: Colors.white,fontSize: 15,
    ),textAlign: TextAlign.center,)
    ],
          ),
        )
        ),],
    );
  }
}