// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  Computed<ObservableList<MessageModel>> _$messagesComputed;

  @override
  ObservableList<MessageModel> get messages => (_$messagesComputed ??=
          Computed<ObservableList<MessageModel>>(() => super.messages))
      .value;

  final _$chatIdAtom = Atom(name: '_ChatControllerBase.chatId');

  @override
  int get chatId {
    _$chatIdAtom.context.enforceReadPolicy(_$chatIdAtom);
    _$chatIdAtom.reportObserved();
    return super.chatId;
  }

  @override
  set chatId(int value) {
    _$chatIdAtom.context.conditionallyRunInAction(() {
      super.chatId = value;
      _$chatIdAtom.reportChanged();
    }, _$chatIdAtom, name: '${_$chatIdAtom.name}_set');
  }

  final _$_messagesStreamAtom =
      Atom(name: '_ChatControllerBase._messagesStream');

  @override
  ObservableStream<List<MessageModel>> get _messagesStream {
    _$_messagesStreamAtom.context.enforceReadPolicy(_$_messagesStreamAtom);
    _$_messagesStreamAtom.reportObserved();
    return super._messagesStream;
  }

  @override
  set _messagesStream(ObservableStream<List<MessageModel>> value) {
    _$_messagesStreamAtom.context.conditionallyRunInAction(() {
      super._messagesStream = value;
      _$_messagesStreamAtom.reportChanged();
    }, _$_messagesStreamAtom, name: '${_$_messagesStreamAtom.name}_set');
  }

  final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase');

  @override
  dynamic startChat() {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction();
    try {
      return super.startChat();
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendMessage(String message, dynamic context) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction();
    try {
      return super.sendMessage(message, context);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'chatId: ${chatId.toString()},messages: ${messages.toString()}';
    return '{$string}';
  }
}
