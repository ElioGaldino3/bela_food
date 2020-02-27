import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    int id;
    bool from;
    String message;
    int chatId;

    MessageModel({
        this.id,
        this.from,
        this.message,
        this.chatId,
    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        from: json["from"],
        message: json["message"],
        chatId: json["chatId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "message": message,
        "chatId": chatId,
    };

    static fromJsonList(List list) {
    if (list == null) return null;

    return list.map((json) => MessageModel.fromJson(json)).toList();
  }
}
