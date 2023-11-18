class PoliceStation{

  final String id;
  final String name;

  PoliceStation({required this.id, required this.name});

  factory PoliceStation.fromMap(Map map) {

    return PoliceStation(
        id: map['id'],
        name: map['name']);
  }

}