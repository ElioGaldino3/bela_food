import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[
        Container(
          height: paddingTop,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 50,
                  child: Image.asset('assets/logo.png'),
                ),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Container(
                height: 25,
                child: Image.network(
                    'https://www.infoescola.com/wp-content/uploads/2011/02/bandeira-do-brasil.gif'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
