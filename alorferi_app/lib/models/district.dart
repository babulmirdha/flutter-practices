class District {
  final String id;
  final String name;

  District({required this.id, required this.name});

  factory District.fromMap(Map map) {

    return District(
        id: map['id'],
        name: map['name']);
  }

}
