import 'package:breakingnews/screens/favorite.dart';
import 'package:breakingnews/screens/navigator_drawer.dart';
import 'package:breakingnews/screens/popular.dart';
import 'package:breakingnews/screens/whats_new.dart';
import 'package:flutter/material.dart';




class HeadingLines extends StatefulWidget {
  @override
  _HeadingLinesState createState() => _HeadingLinesState();
}

class _HeadingLinesState extends State<HeadingLines> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override

  void initState() {
    super.initState();
    _tabController= TabController(length:3 ,vsync:this ,initialIndex: 0);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('HeadingLine News'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search) ,onPressed: (){},),
          IconButton(icon: Icon(Icons.more_vert) ,onPressed: (){},),
        ],
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: ('What Is New'),),
            Tab(text: ('Popular'),),
            Tab(text: ('Favorite'),)
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigatorDrawer(),
      body: Center(child: TabBarView(children: [
        Favorite(),
        Popular(),
        Favorite()

      ],controller: _tabController,)),

    );
  }
}
