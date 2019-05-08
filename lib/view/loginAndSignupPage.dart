import 'package:flutter/material.dart';
import 'package:sic/view/homePage.dart';

class LoginView extends StatefulWidget {
  @override
  const LoginView({Key key}) : super(key: key);
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(
        children: <Widget>[_showBody()],
      ),
    );
  }

  Widget _showBody() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              _showInputEmail(),
              _showInputPassword(),
              _signInButton(),
              _signInGoogle(),
              _flatButtonSignUp(),
            ],
          ),
        ));
  }

    Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(50.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/icon/icon.png'),
          radius: 45.0,
        ),
      ),
    );
  }

  Widget _showInputEmail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.white),
          icon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _showInputPassword() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          icon: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _flatButtonSignUp() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 15.0, 0.0, 0.0),
      child: Text(
        "Don't have an acount ? Sign up here",
        style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            letterSpacing: 0.3,
            fontWeight: FontWeight.w200),
      ),
    );
  }

  Widget _signInGoogle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          color: Colors.blue[400],
          child: Center(
              child: new Text(
            "Sign In Google",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue[400],
          child: Center(
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/sic/view/homePage');
          },
        ),
      ),
    );
  }
}
