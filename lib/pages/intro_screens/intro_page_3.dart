import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[200],
      child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'FIT!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold)
                          ),
                          Lottie.network('https://assets7.lottiefiles.com/packages/lf20_8wcbr8x0.json'),
                          SizedBox(height: 50)
                  ],
          ),
        ));
  }
}



