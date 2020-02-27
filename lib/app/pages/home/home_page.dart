import 'package:bela_food/app/pages/home/home_controller.dart';
import 'package:bela_food/app/pages/home/widgets/custom_order_pizza.dart';
import 'package:bela_food/app/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:bela_food/app/shared/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/custom_item_format.dart';
import 'widgets/custom_subtitle.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Modular.get();
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomHeader(),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomSubtitle('Formato'),
                        Observer(builder: (_) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CustomItemFormat(
                                  1, controller.selectedFormats[0]),
                              CustomItemFormat(
                                  2, controller.selectedFormats[1]),
                            ],
                          );
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        Observer(builder: (_) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CustomItemFormat(
                                  3, controller.selectedFormats[2]),
                              CustomItemFormat(
                                  4, controller.selectedFormats[3]),
                            ],
                          );
                        }),
                  ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        CustomSubtitle('Meu Carrinho'),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Observer(builder: (_) {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: controller.orderPizzas.length,
                                itemBuilder: (context, index) {
                                  return CustomOrderPizza(
                                      controller.orderPizzas[index], index);
                                },
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text("Faça Já o Seu Pedido"),
            onPressed: () {
              Modular.to.pushNamed('/confirm');
            },
          )
        ],
      ),
    );
  }
}
