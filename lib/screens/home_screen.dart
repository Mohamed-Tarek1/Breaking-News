import 'package:flutter/material.dart';
import 'package:breakingnews/screens/navigator_drawer.dart';
import 'package:breakingnews/screens/whats_new.dart';
import 'popular.dart';
import 'favorite.dart';


class HomeScreen extends StatefulWidget {
  final id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
enum popmenu{
  Help,About,Contact,Settings
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search) ,onPressed: (){},),
          _popMenuButton(context),
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
      WhatsNew(),
        Popular(),
        Favorite()

      ],controller: _tabController,)),

    );
  }

 Widget _popMenuButton(BuildContext context) {
    return PopupMenuButton<popmenu>(itemBuilder: (context){
    return [PopupMenuItem<popmenu>(
      value: popmenu.About,
      child: Text('About'),
    ),PopupMenuItem<popmenu>(
      value: popmenu.Contact,
      child: Text('Contact'),
    ),PopupMenuItem<popmenu>(
      value: popmenu.Settings,
      child: Text('Setting'),

    ),
      PopupMenuItem<popmenu>(
        value: popmenu.Help,
        child: Text('Help'),
      ),];
    },
    onSelected: (popmenu menu){

    },icon: Icon(
        Icons.more_vert
      ),);
 }
}
