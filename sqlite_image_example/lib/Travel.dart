

import 'dart:typed_data';

class Travel{

  final int? id;
  final String name;
  final Uint8List? picture;

  Travel({ this.id, required this.name, this.picture});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
   var map = {
      'name': name,
     "picture" : picture,
    };

    if (id != null) {
      map["id"] = id;
    }

    return map;

  }


  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Travel{id: $id, name: $name}';
  }
}