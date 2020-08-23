import 'package:breakingnews/api/api_articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:breakingnews/page_model.dart';
import 'home_screen.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {


  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);


  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
        'Welcome',
        '1- Making friends is easy as waving your hand back and forth in easy step',
        Icons.fiber_new,
        'assets/images/background.jpg'));
    pages.add(PageModel(
        'Alarm',
        '2- Making friends is easy as waving your hand back and forth in easy step',
        Icons.access_alarms,
        'assets/images/backfround2.jpg'));
    pages.add(PageModel(
        'Print',
        '3- Making friends is easy as waving your hand back and forth in easy step',
        Icons.map,
        'assets/images/background3.jpg'));
    pages.add(PageModel(
        'Map',
        '4- Making friends is easy as waving your hand back and forth in easy step',
        Icons.ac_unit,
        'assets/images/background4.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Align(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Transform.translate(
                            child: Icon(
                              pages[index].icon,
                              color: Colors.white,
                              size: 120,
                            ),
                            offset: Offset(0, -70),
                          ),
                          Text(
                            pages[index].title,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                    ),
                  )
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index){
              _pageViewNotifier.value=index;
            },
          ),

          Transform.translate(
            child: Align(
                alignment: Alignment.center,
                child:_displayPAgeIndicators(pages.length),),
            offset: Offset(0,156),
          ),
          Align(

            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.blue.shade900,
                  child: Text('Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      _updateSeen();
                    return HomeScreen();
                    },));

                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _displayPAgeIndicators(int length){
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.white,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.blue.shade900,
        ),
      ),
    );

  }

  void _updateSeen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);

  }

}
