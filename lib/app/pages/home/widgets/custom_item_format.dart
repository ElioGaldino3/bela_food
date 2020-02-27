import 'package:bela_food/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomItemFormat extends StatelessWidget {
  final int format;
  final bool isSelected;

  const CustomItemFormat(this.format, this.isSelected, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Modular.get();
    double widthPage = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        controller.setFormat(format);
      },
      child: Container(
        height: 120,
        width: widthPage * 0.25,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height: 60, child: Image.asset("assets/format-$format.png")),
              Text(getNameForFormat(format), style: TextStyle(fontSize: 12),)
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}

String getNameForFormat(int format) {
  switch (format) {
    case 1:
      return 'Inteira';
    case 2:
      return 'Metade';
    case 3:
      return "3 sabores";
    case 4:
      return '4 sabores';
    default:
      return '';
  }
}
