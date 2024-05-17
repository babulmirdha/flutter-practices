import 'dart:typed_data';

class Travel {
  final int? id;
  final String name;
  final Uint8List? picture;

  Travel({this.id, required this.name, this.picture});

  Map<String, dynamic> toMap() {
    var map = {
      'name': name,
      "picture": picture,
    };

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  @override
  String toString() {
    return 'Travel{id: $id, name: $name}';
  }
}
