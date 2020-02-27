import 'dart:convert';

import 'package:bela_food/app/shared/models/user_model.dart';
import 'package:bela_food/app/shared/repositories/database/database_interface.dart';
import 'package:bela_food/app/shared/widgets/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  IDatabase _database = Modular.get();

  @observable
  TextEditingController adressController = TextEditingController();

  @observable
  Brightness brightness = Brightness.light;

  _AppControllerBase() {
    initSettings();
  }

  @observable
  String userUid = "aasdkdsahdsakhdsadsadsakh";

  @action
  changeBrightness() {
    if (brightness == Brightness.light) {
      brightness = Brightness.dark;
      userSettings.settings["mode"] = "dark";
    } else {
      brightness = Brightness.light;
      userSettings.settings["mode"] = "light";
    }
  }

  @action
  initSettings() async {
    UserModel user = await _database.getUser("uid");
    Map<String, dynamic> settings = {};
    if (user.setting == null || user.setting.isEmpty) {
      settings["adress"] = "";
      settings["mode"] = "light";
      userSettings = UserSettings(settings);
      _database.setSettings("uid", userSettings);
    } else {
      settings = json.decode(user.setting);
      userSettings = UserSettings(settings);
      if (userSettings.settings["mode"] == 'light')
        brightness = Brightness.light;
      else
        brightness = Brightness.dark;

      adressController.text = userSettings.settings["adress"];
    }
  }

  @computed
  Brightness get actualBrightness => brightness;

  @observable
  UserSettings userSettings;

  @computed
  String get actualRouter => Modular.actualRoute;

  @action
  saveSettings(var context) async {
    userSettings.settings["adress"] = adressController.text;
    if (await _database.setSettings("uid", userSettings))
      ShowToast.showCustomToast(FontAwesome.check_circle, "Salvo com sucesso!",
          context, Colors.green);
  }
}

class UserSettings {
  Map<String, dynamic> settings;
  UserSettings(this.settings);
}
