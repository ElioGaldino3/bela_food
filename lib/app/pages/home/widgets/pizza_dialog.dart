import 'package:bela_food/app/pages/home/home_controller.dart';
import 'package:bela_food/app/shared/models/pizza_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_subtitle.dart';

class CustomDialogs {
  static showPizzaDialog(var context, int index) {
    double widthContext = MediaQuery.of(context).size.width;
    HomeController controller = Modular.get();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Pizza"),
        content: Column(
          children: <Widget>[
            Container(
              width: widthContext * .3,
              child: Image.asset(
                  "assets/format-${controller.orderPizzas[index].format}.png"),
            ),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return Text(
                "Você pode escolher mais ${controller.orderPizzas[index].format - controller.orderPizzas[index].flavorPizzas.length} sabor(es)",
                style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).unselectedWidgetColor),
              );
            }),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomSubtitle('Escolha')),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.flavors.length,
                          itemBuilder: (context, indexFlavor) {
                            double widthContextList =
                                MediaQuery.of(context).size.width;
                            return GestureDetector(
                              child: Observer(
                                builder: (_) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 4),
                                    width: widthContextList,
                                    height: 50,
                                    color: controller
                                                .orderPizzas[index].flavorPizzas
                                                .indexWhere((flavorPizza) =>
                                                    flavorPizza.flavor.id ==
                                                    controller
                                                        .flavors[indexFlavor]
                                                        .id) !=
                                            -1
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).backgroundColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            controller
                                                .flavors[indexFlavor].name,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controller.flavors[indexFlavor]
                                                .ingredients,
                                            style: TextStyle(fontSize: 10),
                                            overflow: TextOverflow.fade,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              onTap: () {
                                controller.addFlavor(index, indexFlavor);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      controller.changeSize('left', index);
                    },
                    icon: Icon(AntDesign.left),
                  ),
                  Text(controller.orderPizzas[index].pizzaSize.size),
                  IconButton(
                    onPressed: () {
                      controller.changeSize('right', index);
                    },
                    icon: Icon(AntDesign.right),
                  ),
                ],
              );
            })
          ],
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text("Pronto"),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryIconTheme.color,
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}
