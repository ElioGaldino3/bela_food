import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  const IconTile({this.label, this.iconData, this.onTap, this.highlighted});

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            color: highlighted ? Theme.of(context).accentColor : Theme.of(context).unselectedWidgetColor),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Theme.of(context).accentColor : Theme.of(context).unselectedWidgetColor,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}
