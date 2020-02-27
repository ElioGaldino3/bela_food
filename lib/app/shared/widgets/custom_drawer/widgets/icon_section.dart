import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app_controller.dart';
import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController controller = Modular.get();
    void _goToPage(String page) {
      if (controller.actualRouter == page)
        Navigator.pop(context);
      else {
        Navigator.pop(context);
        Modular.to.pushNamed(page);
      }
    }

    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          IconTile(
            label: 'Início',
            iconData: FontAwesome.home,
            onTap: () {
              _goToPage('/home');
            },
            highlighted: controller.actualRouter == '/home',
          ),
          IconTile(
            label: 'Meus Pedidos',
            iconData: FontAwesome.reorder,
            onTap: () {
              _goToPage('/myorders');
            },
            highlighted: controller.actualRouter == '/myorders',
          ),
          Expanded(child: Container()),
          IconTile(
            label: 'Configurações',
            iconData: Icons.settings,
            onTap: () {
              _goToPage('/settings');
            },
            highlighted: controller.actualRouter == '/settings',
          ),
        ],
      );
    });
  }
}
