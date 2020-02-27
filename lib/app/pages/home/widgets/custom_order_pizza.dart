import 'package:bela_food/app/shared/models/pizza_order_model.dart';
import 'package:flutter/material.dart';

import 'item_pizza.dart';

class CustomOrderPizza extends StatelessWidget {
  final int index;
  final PizzaOrderModel pizzaOrderModel;
  const CustomOrderPizza(this.pizzaOrderModel, this.index, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ItemPizza(pizzaOrderModel, index),
    );
  }
}
