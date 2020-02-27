import 'package:bela_food/app/shared/models/pizza_order_model.dart';

import 'chat_model.dart';
import 'user_model.dart';

class OrderModel {
  int id;
  DateTime date;
  String comments;
  String adress;
  bool isFinished;
  String status;
  UserModel user;
  List<PizzaOrderModel> pizzaOrders;
  List<ChatModel> chat;

  OrderModel(
      {this.id,
      this.date,
      this.comments,
      this.adress,
      this.isFinished,
      this.status,
      this.user,
      this.pizzaOrders,
      this.chat});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        comments: json["comments"],
        adress: json["adress"],
        isFinished: json["isFinished"],
        status: json["status"],
        user: UserModel.fromJson(json["user"]),
        pizzaOrders: List<PizzaOrderModel>.from(
            json["pizzaOrders"].map((x) => PizzaOrderModel.fromJson(x))),
        chat: List<ChatModel>.from(
            json["chat"].map((x) => ChatModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "comments": comments,
        "adress": adress,
        "isFinished": isFinished,
        "status": status,
        "user": user.toJson(),
        "pizzaOrders": List<dynamic>.from(pizzaOrders.map((x) => x.toJson())),
        "chat": List<dynamic>.from(chat.map((x) => x.toJson())),
      };

  static fromJsonList(List list) {
    if (list == null) return null;

    return list.map((json) => OrderModel.fromJson(json)).toList();
  }
}
