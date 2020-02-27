import 'package:bela_food/app/pages/home/widgets/custom_subtitle.dart';
import 'package:bela_food/app/pages/home/widgets/pizza_dialog.dart';
import 'package:bela_food/app/shared/models/pizza_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';

class ItemPizza extends StatelessWidget {
  final PizzaOrderModel orderPizza;
  final int index;

  const ItemPizza(this.orderPizza, this.index, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Modular.get();
    double widthContext = MediaQuery.of(context).size.width;
    return Dismissible(
      key: ValueKey(controller.orderPizzas[index]),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        controller.orderPizzas.removeAt(index);
      },
      child: Container(
        height: 150,
        width: widthContext,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                width: widthContext * 0.16,
                child: GestureDetector(
                  child: Image.asset("assets/format-${orderPizza.format}.png"),
                  onTap: () {
                    CustomDialogs.showPizzaDialog(context, index);
                  },
                )),
            Text(orderPizza.pizzaSize.size),
            SizedBox(height: 5),
            Text(
                "R\$ ${(orderPizza.amount * orderPizza.pizzaSize.value).toStringAsFixed(2)}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: widthContext * .07,
                    height: 30,
                    child: Center(
                        child: Text(
                      "-",
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    )),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 0, 0, .3),
                    ),
                  ),
                  onTap: () {
                    controller.deincrementAmount(index);
                  },
                ),
                Observer(builder: (_) {
                  return Text(controller.orderPizzas[index].amount.toString());
                }),
                GestureDetector(
                  child: Container(
                    width: widthContext * .07,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 0, 0, .3),
                    ),
                    child: Center(
                        child: Text(
                      "+",
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    )),
                  ),
                  onTap: () {
                    controller.incrementAmount(index);
                  },
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
