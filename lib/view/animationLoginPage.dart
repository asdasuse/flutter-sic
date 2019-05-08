import 'package:flutter/material.dart';

class StartAnimation extends StatefulWidget {
  @override
  _StartAnimationState createState() => _StartAnimationState();
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new Container(
        width: 320.0, 
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(const Radius.circular(30.0)),
        ),
        child: Center(
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.3),
          ),
        ),
      ),
    );
  }
}