import 'package:alorferi_app/models/district.dart';
import 'package:alorferi_app/models/police_station.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Address {

  @JsonKey(name: 'police_station')
  final PoliceStation policeStation;
  final District district;

  Address(
      {
      required this.policeStation,
      required this.district});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

}
