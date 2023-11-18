import 'package:alorferi_app/models/address.dart';
import 'package:alorferi_app/models/district.dart';
import 'package:alorferi_app/models/police_station.dart';

class Library {
  final String id;
  final String name;
  final String logo_url;
  final Address address;

  Library({required this.id, required this.logo_url, required this.name, required this.address});

  factory Library.fromMap(Map<String, dynamic> map) {

    var address = map['attributes']['address'];

   return Library(
      id: map['attributes']['id'],
      logo_url: map['attributes']['logo_url'],
      name: map['attributes']['name'],
     address: Address.fromMap(address)
    );
  }

}
