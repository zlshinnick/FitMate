import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[200],
        child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold)
                          ),
                          Lottie.network('https://assets9.lottiefiles.com/packages/lf20_qmrxbp0w.json'),
                          SizedBox(height: 50)
                  ],
          ),
        ));
  }
}
