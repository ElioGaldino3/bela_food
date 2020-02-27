import 'package:bela_food/app/app_controller.dart';
import 'package:bela_food/app/pages/home/home_controller.dart';
import 'package:bela_food/app/shared/models/order_model.dart';
import 'package:bela_food/app/shared/repositories/database/database_interface.dart';
import 'package:bela_food/app/shared/widgets/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'confirm_controller.g.dart';

class ConfirmController = _ConfirmControllerBase with _$ConfirmController;

abstract class _ConfirmControllerBase with Store {
  HomeController homeController = Modular.get();
  IDatabase _database = Modular.get();

  @observable
  TextEditingController commentController = TextEditingController();

  @observable
  TextEditingController changeController = TextEditingController();

  @action
  addOrder(var context) async {
    OrderModel order = OrderModel(
      comments: "${commentController.text} \n===\n ${changeController.text}",
      adress: Modular.get<AppController>().adressController.text,
      pizzaOrders: homeController.orderPizzas,
    );

    OrderModel insertedOrder = await _database.putOrder(order);
    if (insertedOrder != null) {
      ShowToast.showCustomToast(FontAwesome.check_circle,
          "Pedido feito com sucesso!", context, Colors.green);

      Modular.to.pushReplacementNamed('/home');
      homeController.orderPizzas.clear();
    }
  }
}
