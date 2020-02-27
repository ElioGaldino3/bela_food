class UserModel {
    String uid;
    String setting;
    bool isAdmin;

    UserModel({
        this.uid,
        this.setting,
        this.isAdmin,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        setting: json["setting"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "setting": setting,
        "isAdmin": isAdmin,
    };
}
