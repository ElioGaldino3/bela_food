import 'package:bela_food/app/shared/models/message_model.dart';
import 'package:bela_food/app/shared/repositories/database/database_interface.dart';
import 'package:bela_food/app/shared/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  IDatabase _database = Modular.get();

  @observable
  int chatId;

  @computed
  ObservableList<MessageModel> get messages =>
      _messagesStream?.value?.asObservable();

  @observable
  ObservableStream<List<MessageModel>> _messagesStream;

  @action
  startChat() {
    _messagesStream = _database.getStreamChat(chatId).asObservable();
  }

  @action
  sendMessage(String message, var context) {
    if (message == null || message.isEmpty) {
      ShowToast.showCustomToast(AntDesign.exclamationcircle,
          "Escreva algo para enviar", context, Theme.of(context).primaryColor);
    } else {
      _database.insertMensage(message, chatId);
    }
  }
}
