import 'dart:convert';

class CatalogModel {
  static List<Item> items = []; // Initialize the items list

 static  Item getById(int id) {
    return items.firstWhere(
          (element) => element.id == id,
      orElse: () => Item(
        id: -1, // Use a value that indicates a placeholder
        name: 'Unknown',
        desc: 'Unknown description',
        price: 0,
        color: 'Unknown color',
        image: 'https://via.placeholder.com/150', // Placeholder image URL
      ),
    );
  }
  static Item getByPosition(int pos)=>items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
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
    return {
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
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.price == price &&
        o.color == color &&
        o.image == image;
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
