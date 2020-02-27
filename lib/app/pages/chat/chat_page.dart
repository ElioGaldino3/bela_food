import 'package:bela_food/app/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:bela_food/app/shared/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomHeader(),
          Expanded(
            child: Container(
              color: Colors.black26,
              child: Observer(builder: (_) {
                if (controller.messages == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: controller.messages[index].from
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              controller.messages[index].message,
                              textAlign: controller.messages[index].from
                                  ? TextAlign.right
                                  : TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: controller.messages[index].from
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Mensagem"),
                      onSubmitted: (_) {
                        controller.sendMessage(textController.text, context);
                        textController.clear();
                      },
                    ),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      controller.sendMessage(textController.text, context);
                      textController.clear();
                    },
                    icon: Icon(
                      FontAwesome.send,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
