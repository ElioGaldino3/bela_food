import 'package:flutter/material.dart';

class CustomSubtitle extends StatelessWidget {
  final String subtitle;

  const CustomSubtitle(this.subtitle, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(subtitle, style: TextStyle(
        fontSize: 12.0,
        color: Theme.of(context).hintColor
      ),),
    );
  }
}
