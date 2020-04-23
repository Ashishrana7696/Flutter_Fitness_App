
import 'package:fitneess/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class onboard extends StatefulWidget {
  

  @override
  _onboardState createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  var pages=[
      PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: Center(
    child: Image.asset("assets/gym.jpeg", height: 175.0),
  ),
  decoration: const PageDecoration(
    pageColor:Colors.pink,
    bodyTextStyle:TextStyle(color:Colors.white),
    titleTextStyle:TextStyle(color:Colors.white,fontSize:25)
  )
),
     PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: Center(
   child: Image.asset("assets/my.jpg", height: 175.0),
  ),
   decoration: const PageDecoration(
    pageColor:Colors.pink,
    bodyTextStyle:TextStyle(color:Colors.white),
    titleTextStyle:TextStyle(color:Colors.white,fontSize:25)
  )
),
PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: Center(
   child: Image.asset("assets/gym.jpeg", height: 175.0),
  ),
   decoration: const PageDecoration(
    pageColor:Colors.lightBlueAccent,
    bodyTextStyle:TextStyle(color:Colors.white),
    titleTextStyle:TextStyle(color:Colors.white,fontSize:25)
  )
)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: IntroductionScreen(
  pages: pages,
  onDone: () {
     Navigator.pushNamed(context, "/home_screen");
  },
  onSkip: () {
   Navigator.push(
       context,
       MaterialPageRoute(builder: (context)=> homePage())
    
     );
  },
  showSkipButton: true,
  skip: const Icon(Icons.skip_next,color: Colors.white,),
  next: const Icon(Icons.arrow_back,color: Colors.white,),
  done: const Text("Let's Start", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
  dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(20.0, 10.0),
    activeColor: Colors.white,
    color: Colors.white,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0)
    )
  ),
),
    );
  }
}