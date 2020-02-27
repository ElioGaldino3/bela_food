import 'package:bela_food/app/pages/chat/chat_controller.dart';
import 'package:bela_food/app/pages/orders/orders_controller.dart';
import 'package:bela_food/app/pages/confirm/confirm_controller.dart';
import 'package:bela_food/app/pages/settings/settings_controller.dart';
import 'package:bela_food/app/app_controller.dart';
import 'package:bela_food/app/app_widget.dart';
import 'package:bela_food/app/pages/home/home_controller.dart';
import 'package:bela_food/app/pages/login/login_controller.dart';
import 'package:bela_food/app/pages/login/login_page.dart';
import 'package:bela_food/app/pages/splash/splash_controller.dart';
import 'package:bela_food/app/shared/repositories/database/custom_hasura_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/chat/chat_page.dart';
import 'pages/confirm/confirm_page.dart';
import 'pages/home/home_page.dart';
import 'pages/orders/orders_page.dart';
import 'pages/settings/settings_page.dart';
import 'shared/repositories/database/database_hasura.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController()),
        Bind((i) => OrdersController()),
        Bind((i) => SettingsController()),
        Bind((i) => CustomHasuraConnect()),
        Bind((i) => HomeController()),
        Bind((i) => LoginController()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => DatabaseHasura()),
        Bind((i) => ConfirmController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/settings', child: (_, args) => SettingsPage()),
        Router('/confirm', child: (_, args) => ConfirmPage()),
        Router('/myorders', child: (_, args) => OrdersPage()),
        Router('/chat', child: (_, args) => ChatPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
