import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workout_app/pages/home_page.dart';
import 'package:workout_app/pages/intro_screens/intro_page_1.dart';
import 'package:workout_app/pages/intro_screens/intro_page_2.dart';
import 'package:workout_app/pages/intro_screens/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key:key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

// Controller to keep track of current page
PageController _controller = PageController();

// keep track of when on last page
bool onLast = false;



  @override
  Widget build(BuildContext contect) {
    return Scaffold( 
      body: Stack (
        children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLast = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),  
        ],
      ),


      // Dot Indicators
      Container(
        alignment: Alignment(0, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Skip
            GestureDetector(
              onTap: () {
                _controller.jumpToPage(2);
                          
              },
              child: Text('Skip')
              ),
            // Dots
            SmoothPageIndicator(controller: _controller, count: 3),
          
            // Next or Done
            onLast ?
            GestureDetector(
              onTap: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                    return HomePage();
              })
                ); 
               },        
              child: Text('Enter'),
              )
              :            GestureDetector(
              onTap: () {
                _controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ); 
               },        
              child: Text('Next'),
              )

          ],
        ))


        ],
      ),
      );
  }
}