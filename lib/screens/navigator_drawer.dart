import 'package:breakingnews/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:breakingnews/nav_menu/nav_menu.dart';
import 'package:breakingnews/nav_menu/heading_lines.dart';
import 'package:breakingnews/nav_menu/twitter_feeds.dart';
import 'package:breakingnews/nav_menu/instagram_feeds.dart';
import 'package:breakingnews/nav_menu/facebook_feeds.dart';

class NavigatorDrawer extends StatefulWidget {
  @override
  _NavigatorDrawerState createState() => _NavigatorDrawerState();
}

class _NavigatorDrawerState extends State<NavigatorDrawer> {
  List <NavMenu> navigationmenu =[
    NavMenu(title: 'Explore',destination: ()=> HomeScreen()),
    NavMenu(title: 'HeadingLines',destination: ()=> HeadingLines()),
    NavMenu(title: 'Twitter Feeds',destination: ()=> TwitterFeeds()),
    NavMenu(title: 'Instagram Feeds',destination: ()=> InstgramFeeds()),
    NavMenu(title: 'Facebook Feeds',destination: ()=> FacebookFeeds()),
    NavMenu(title: 'Settings',destination: ()=> HomeScreen()),
    NavMenu(title: 'Logout',destination: ()=> HomeScreen()),
  ];


  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView.builder(itemBuilder: (context,position){
        return Padding(
          padding: const EdgeInsets.only(left :20.0,top: 24.0),
          child: ListTile(
            title: Text(navigationmenu[position].title,
            style: TextStyle(color: Colors.grey.shade700,fontSize: 22,fontStyle: FontStyle.italic),),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
            ),

            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return navigationmenu[position].destination();
              }));
            },
          ),
        );

      },
        itemCount : navigationmenu.length,
      ),
    );
  }
}
