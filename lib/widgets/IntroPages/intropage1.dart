import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {

  @override 
  Widget build(BuildContext context){
    return Container(
      color: Color.fromARGB(255, 10, 134, 118),
      child: Center(
       child:Lottie.asset(
         'assets/animations/girl-with-books.json',
         height: 300,
       ),
       
      )
    );
  }
}