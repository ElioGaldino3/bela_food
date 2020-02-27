import 'dart:convert';

import 'package:bela_food/app/shared/models/size_model.dart';

import 'flavor_model.dart';

PizzaOrderModel pizzaOrderModelFromJson(String str) =>
    PizzaOrderModel.fromJson(json.decode(str));

String pizzaOrderModelToJson(PizzaOrderModel data) =>
    json.encode(data.toJson());

class PizzaOrderModel {
  int id;
  int amount;
  int format;
  SizeModel pizzaSize;
  List<FlavorPizza> flavorPizzas;

  PizzaOrderModel({
    this.id,
    this.amount,
    this.format,
    this.pizzaSize,
    this.flavorPizzas,
  });

  factory PizzaOrderModel.fromJson(Map<String, dynamic> json) =>
      PizzaOrderModel(
        id: json["id"],
        amount: json["amount"],
        format: json["format"],
        pizzaSize: SizeModel.fromJson(json["pizzaSize"]),
        flavorPizzas: List<FlavorPizza>.from(
            json["flavorPizzas"].map((x) => FlavorPizza.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "format": format,
        "pizzaSizeId": pizzaSize.id,
        "flavorPizzas": {
          "data": List<dynamic>.from(flavorPizzas.map((x) => x.toJson()))
        },
      };
}

class FlavorPizza {
  int id;
  FlavorModel flavor;

  FlavorPizza({
    this.id,
    this.flavor,
  });

  factory FlavorPizza.fromJson(Map<String, dynamic> json) => FlavorPizza(
        id: json["id"],
        flavor: FlavorModel.fromJson(json["flavor"]),
      );

  Map<String, dynamic> toJson() => {
        "flavorId": flavor.id,
      };
}
