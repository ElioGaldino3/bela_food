class FlavorModel {
  int id;
  String ingredients;
  String name;

  FlavorModel({
    this.id,
    this.ingredients,
    this.name,
  });

  factory FlavorModel.fromJson(Map<String, dynamic> json) => FlavorModel(
        id: json["id"],
        ingredients: json["ingredients"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ingredients": ingredients,
        "name": name,
      };

  static fromJsonList(List list) {
    if (list == null) return null;

    return list.map((json) => FlavorModel.fromJson(json)).toList();
  }
}
