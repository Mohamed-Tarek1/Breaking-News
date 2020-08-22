import 'package:breakingnews/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen =prefs.getBool('seen');
  Widget _screen = OnBoarding();
  if(seen == true &&seen !=null )
    _screen = HomeScreen();
  else
    _screen=OnBoarding();
  runApp(MyApp(_screen));
}
 class MyApp extends StatelessWidget {
 Widget _screen ;
 MyApp(this._screen);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: this._screen,


     );


   }
 }
 