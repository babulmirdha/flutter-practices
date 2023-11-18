import 'package:alorferi_app/models/district.dart';
import 'package:alorferi_app/models/police_station.dart';

class Address {
  final PoliceStation policeStation;
  final District district;

  Address(
      {
      required this.policeStation,
      required this.district});

  factory Address.fromMap(Map map) {

    var ps =map['police_station'];
    var dist = map['district'];

    return Address(
        policeStation:
            PoliceStation.fromMap(ps),
        district: District.fromMap(dist));
  }
}
