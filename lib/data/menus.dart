import 'dart:convert';

class Menu {
  String name;

  Menu({
    this.name,
  });

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(name: json["name"]);

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}

class Menus {
  List<Menu> foods;
  List<Menu> drinks;

  Menus({
    this.foods,
    this.drinks,
  });

  factory Menus.fromMap(Map<String, dynamic> json) => Menus(
        foods: List<Menu>.from(json["foods"].map((x) => Menu.fromMap(x))),
        drinks: List<Menu>.from(json["drinks"].map((x) => Menu.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toMap())),
      };
}

MenuResponse menuResponseFromMap(String str) =>
    MenuResponse.fromMap(json.decode(str));

String menuResponseToMap(MenuResponse data) => json.encode(data.toMap());

class MenuResponse {
  MenuResponse({
    this.menus,
  });

  List<Menus> menus;

  factory MenuResponse.fromMap(Map<String, dynamic> json) => MenuResponse(
        menus: List<Menus>.from(json["foods"].map((x) => Menus.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "menu": List<dynamic>.from(menus.map((x) => x.toMap())),
      };
}
