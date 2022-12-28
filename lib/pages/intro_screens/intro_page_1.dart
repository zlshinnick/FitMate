import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink[200],
        child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Lets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold)
                          ),
                          Lottie.network('https://assets9.lottiefiles.com/packages/lf20_p1ftxhgu.json'),
                          SizedBox(height: 50)
                  ],
          ),
        ));
  }
}
