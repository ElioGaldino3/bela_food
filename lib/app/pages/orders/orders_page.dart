import 'package:bela_food/app/pages/chat/chat_controller.dart';
import 'package:bela_food/app/pages/home/widgets/custom_subtitle.dart';
import 'package:bela_food/app/shared/utils/get_total.dart';
import 'package:bela_food/app/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:bela_food/app/shared/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'orders_controller.dart';

class OrdersPage extends StatefulWidget {
  final String title;
  const OrdersPage({Key key, this.title = "Orders"}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends ModularState<OrdersPage, OrdersController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              child: CustomSubtitle('Meus pedidos'),
              alignment: Alignment.centerLeft,
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              if (controller.myOrders == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.myOrders?.length,
                itemBuilder: (context, index) {
                  var dateFormat = DateFormat('dd-MM');
                  return GestureDetector(
                    onTap: () {
                      Modular.get<ChatController>().chatId =
                          controller.myOrders[index].chat[0].id;
                      Modular.get<ChatController>().startChat();
                      Modular.to.pushNamed('/chat');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.black26,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(dateFormat
                                .format(controller.myOrders[index].date)),
                            Row(
                              children: <Widget>[
                                Text("Status: "),
                                Text(
                                    "${controller.myOrders[index].status}", style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
