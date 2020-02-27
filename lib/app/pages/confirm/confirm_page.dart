import 'package:bela_food/app/app_controller.dart';
import 'package:bela_food/app/pages/home/home_controller.dart';
import 'package:bela_food/app/pages/home/widgets/custom_subtitle.dart';
import 'package:bela_food/app/shared/utils/get_total.dart';
import 'package:bela_food/app/shared/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'confirm_controller.dart';

class ConfirmPage extends StatefulWidget {
  final String title;
  const ConfirmPage({Key key, this.title = "Confirm"}) : super(key: key);

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends ModularState<ConfirmPage, ConfirmController> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Modular.get();
    AppController appController = Modular.get();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomSubtitle('Carrinho'),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: homeController.orderPizzas?.length,
              itemBuilder: (context, index) {
                double widthContext = MediaQuery.of(context).size.width;
                return Container(
                  width: widthContext,
                  height: 50,
                  color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            'Pizza ${homeController.orderPizzas[index].pizzaSize.size}'),
                        Text(
                            'R\$ ${(homeController.orderPizzas[index].amount * homeController.orderPizzas[index].pizzaSize.value).toStringAsFixed(2)}')
                      ],
                    ),
                  ),
                );
              },
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Observer(builder: (_) {
                          return Text(
                              "R\$ ${getTotalFromPizzas(homeController.orderPizzas).toStringAsFixed(2)}");
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: appController.adressController,
                          decoration: InputDecoration(labelText: "Endereço"),
                        ),
                        TextField(
                            controller: controller.commentController,
                            decoration:
                                InputDecoration(labelText: "Comentário")),
                        TextField(
                            controller: controller.changeController,
                            decoration: InputDecoration(labelText: "Troco?")),
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      controller.addOrder(context);
                    },
                    color: Theme.of(context).buttonColor,
                    child: Text("Comprar!"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
