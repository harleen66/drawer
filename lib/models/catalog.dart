// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;

  static List<Item> items;
  //  = [
  //   Item(
  //       id: 1,
  //       name: "iphone 12 pro",
  //       desc: "Apple iphone 12th generation",
  //       price: 999,
  //       color: "#33505A",
  //       image:
  //           "https://images.unsplash.com/photo-1528795259021-d8c86e14354c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1vYmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  // ];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  Item({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  });
  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //     id: map["id"],
  //     name: map["name"],
  //     desc: map["desc"],
  //     price: map["price"],
  //     color: map["color"],
  //     image: map["image"],
  //   );
  // }
  // toMap() => {
  //       'id': id,
  //       'name': name,
  //       'desc': desc,
  //       'price': price,
  //       'color': color,
  //       'image': image,
  //     };

  Item copyWith({
    int id,
    String name,
    String desc,
    num price,
    String color,
    String image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
