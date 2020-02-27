import 'package:bela_food/app/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:bela_food/app/shared/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_controller.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key key, this.title = "Settings"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState
    extends ModularState<SettingsPage, SettingsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    AppController appController = Modular.get();
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                TextField(
                    controller: appController.adressController,
                    decoration: InputDecoration(labelText: "Endereço")),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Modo Dark: "),
                    Observer(builder: (_) {
                      return Switch(
                          value: appController.brightness == Brightness.dark,
                          onChanged: (_) {
                            appController.changeBrightness();
                          });
                    })
                  ],
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          RaisedButton(
            onPressed: () {
              appController.saveSettings(context);
              Modular.to.pushReplacementNamed('/home');
            },
            color: Theme.of(context).buttonColor,
            child: Text("Salvar"),
          )
        ],
      ),
    );
  }
}
