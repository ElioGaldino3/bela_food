import 'package:bela_food/app/app_controller.dart';
import 'package:bela_food/app/shared/models/flavor_model.dart';
import 'package:bela_food/app/shared/models/message_model.dart';
import 'package:bela_food/app/shared/models/order_model.dart';
import 'package:bela_food/app/shared/models/size_model.dart';
import 'package:bela_food/app/shared/models/user_model.dart';

abstract class IDatabase {
  Future<List<SizeModel>> getPizzaSizes();
  Future<List<FlavorModel>> getFlavors();
  Future<UserModel> getUser(String uid);
  Future<bool> setSettings(String uid, UserSettings userSettings);
  Future<OrderModel> putOrder(OrderModel order);
  Stream<List<OrderModel>> getStreamOrder();
  Stream<List<MessageModel>> getStreamChat(int chatId);
  Future<bool> insertMensage(String message, chatId);
}
