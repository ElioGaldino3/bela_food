import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double widthPage = MediaQuery.of(context).size.width;
    double heightPage = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: widthPage * 0.45,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              "Bela Food",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            SizedBox(height: heightPage * 0.13),
            Container(
              width: widthPage * 0.45,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(AntDesign.google),
                    Text('Fazer Login'),
                  ],
                ),
                onPressed: () {
                  Modular.to.pushReplacementNamed('/home');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
