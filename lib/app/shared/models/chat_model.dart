class ChatModel {
    int id;
    int orderId;
    String userUid;

    ChatModel({
        this.id,
        this.orderId,
        this.userUid,
    });

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        orderId: json["orderId"],
        userUid: json["userUid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "userUid": userUid,
    };
}
