import 'package:bela_food/app/shared/widgets/custom_drawer/widgets/custom_header.dart';
import 'package:bela_food/app/shared/widgets/custom_drawer/widgets/icon_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: paddingTop,
            color: Colors.black,
          ),
          CustomHeaderDrawer(),
          Expanded(child: IconSection()),
        ],
      ),
    );
  }
}
