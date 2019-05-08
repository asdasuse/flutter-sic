import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';


class MySplashScreen extends StatefulWidget {
  @override
  State createState() => new MySplashScreenState();
}

class MySplashScreenState extends State<MySplashScreen>{
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "SIC",
        description: "Stemsend Information Center",
        pathImage: "assets/images/SIC.png",
        backgroundColor: Colors.orange,
      ),
    );
    slides.add(
      new Slide(
        title: "Sharing Data",
        description: "Bebagi informasi dan sharing data",
        pathImage: "assets/images/Screen_2.png",
        backgroundColor: Colors.blue,
      ),
    );
    slides.add(
      new Slide(
        title: "Information Center",
        description:"Mendapatkan informasi dengan mudah",
        pathImage: "assets/images/Screen_3.png",
        backgroundColor: Colors.green,
      ),
    );
  }

  void onDonePress() {
    // todo: go to next screen
    Navigator.pushNamed(context, '/sic/view/loginView');
  }

  void onSkipPress() {
    // todo: go to next screen
    Navigator.pushNamed(context, '/sic/view/loginView');
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}

