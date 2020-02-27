import 'dart:convert';

import 'package:bela_food/app/app_controller.dart';
import 'package:bela_food/app/shared/models/flavor_model.dart';
import 'package:bela_food/app/shared/models/message_model.dart';
import 'package:bela_food/app/shared/models/order_model.dart';
import 'package:bela_food/app/shared/models/size_model.dart';
import 'package:bela_food/app/shared/models/user_model.dart';
import 'package:bela_food/app/shared/repositories/database/database_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'custom_hasura_connect.dart';

class DatabaseHasura implements IDatabase {
  final CustomHasuraConnect _connection = Modular.get();

  @override
  Future<List<SizeModel>> getPizzaSizes() async {
    final query = r"""
      query getSizes {
        pizzaSize {
          id
          size
          value
        }
      }
    """;

    var data = await _connection.client.query(query);

    return SizeModel.fromJsonList(data['data']['pizzaSize']);
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final query = r"""
      query getUser($uid: String!){
        user(where: {uid: {_eq: $uid}}) {
          uid
          setting
          isAdmin
        }
      }
    """;

    var data = await _connection.client
        .query(query, variables: {"uid": "aasdkdsahdsakhdsadsadsakh"});

    return UserModel.fromJson(data['data']['user'][0]);
  }

  @override
  Future<bool> setSettings(String uid, UserSettings userSettings) async {
    final query = r"""
      mutation MyMutation($uid: String!, $settings: String!) {
        update_user(where: {uid: {_eq: $uid}}, _set: {setting: $settings}) {
          affected_rows
        }
      }
    """;

    var data = await _connection.client.mutation(query, variables: {
      "uid": "aasdkdsahdsakhdsadsadsakh",
      "settings": json.encode(userSettings.settings)
    });

    return data['data']['update_user']['affected_rows'] > 0;
  }

  @override
  Future<List<FlavorModel>> getFlavors() async {
    final query = r"""
      query getFlavors {
        flavor(order_by: {name: asc}) {
          id
          ingredients
          name
        }
      }
    """;

    var data = await _connection.client.query(query);

    return FlavorModel.fromJsonList(data['data']['flavor']);
  }

  @override
  Future<OrderModel> putOrder(OrderModel order) async {
    var query = r"""
        mutation putOrder($date: date!, $userUid: String!, $comments: String!, $adress: String!, $pizzaOrders: pizzaOrder_arr_rel_insert_input!) {
          insert_order(objects: {date: $date, userUid: $userUid, comments: $comments, adress: $adress, pizzaOrders: $pizzaOrders}) {
            affected_rows
            returning {
              id
              date
              comments
              adress
              isFinished
              status
              user {
                uid
                setting
                isAdmin
              }
              pizzaOrders {
                id
                amount
                format
                pizzaSize {
                  id
                  size
                  value
                }
                flavorPizzas {
                  id
                  flavor {
                    id
                    ingredients
                    name
                  }
                }
              }
              chat {
                id
                orderId
                userUid
              }
            }
          }
        }
    """;

    var data = await _connection.client.mutation(query, variables: {
      "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "userUid": Modular.get<AppController>().userUid,
      "comments": order.comments,
      "adress": order.adress,
      "pizzaOrders": {"data": order.pizzaOrders}
    });

    final queryChat = r"""
      mutation createChat($orderId: Int!, $userUid: String!) {
        insert_chat(objects: {orderId: $orderId, userUid: $userUid, chat_messages: {data: {from: false, message: "Olá, já estamos preparando seu pedido!"}}}) {
          affected_rows
        }
      }
    """;
    OrderModel insertedModel =
        OrderModel.fromJson(data['data']['insert_order']['returning'][0]);

    await _connection.client.mutation(queryChat, variables: {
      "orderId": insertedModel.id,
      "userUid": Modular.get<AppController>().userUid
    });

    return insertedModel;
  }

  @override
  Stream<List<OrderModel>> getStreamOrder() {
    final query = r"""
      subscription getSubOrders($userUid: String!) {
        order(where: {userUid: {_eq: $userUid}, isFinished: {_eq: false}}) {
          id
          date
          comments
          adress
          isFinished
          status
          user {
            uid
            setting
            isAdmin
          }
          pizzaOrders {
            id
            amount
            format
            pizzaSize {
              id
              size
              value
            }
            flavorPizzas {
              id
              flavor {
                id
                ingredients
                name
              }
            }
          }
          chat {
            id
            orderId
            userUid
          }
        }
      }
    """;

    return _connection.client.subscription(query, variables: {
      "userUid": Modular.get<AppController>().userUid
    }).map((json) => OrderModel.fromJsonList(json["data"]["order"]));
  }

  @override
  Stream<List<MessageModel>> getStreamChat(int chatId) {
    final query = r"""
      subscription MySubscription($chatId: Int!) {
        chat_message(where: {chatId: {_eq: $chatId}}) {
          id
          from
          message
          chatId
        }
      }
    """;

    return _connection.client.subscription(query, variables: {
      "chatId": chatId
    }).map((json) => MessageModel.fromJsonList(json["data"]["chat_message"]));
  }

  @override
  Future<bool> insertMensage(String message, chatId) async {
    final query = r"""
      mutation insertMessage($chatId: Int!, $from: Boolean!, $message: String!) {
        insert_chat_message(objects: {chatId: $chatId, from: $from, message: $message}) {
          affected_rows
        }
        }
    """;

    var data = await _connection.client.mutation(query,
        variables: {"chatId": chatId, "from": true, "message": message});

    return data['data']['insert_chat_message']['affected_rows'] > 0;
  }
}
