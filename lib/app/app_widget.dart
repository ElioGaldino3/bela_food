import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController controller = Modular.get();
    return Observer(builder: (_) {
      return OKToast(
        child: MaterialApp(
          navigatorKey: Modular.navigatorKey,
          title: 'Flutter Slidy',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            brightness: controller.actualBrightness,
          ),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}
