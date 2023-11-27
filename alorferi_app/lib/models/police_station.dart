
import 'package:json_annotation/json_annotation.dart';

part 'police_station.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class PoliceStation{

  final String id;
  final String name;

  PoliceStation({required this.id, required this.name});

  factory PoliceStation.fromJson(Map<String, dynamic> json) => _$PoliceStationFromJson(json);

  Map<String, dynamic> toJson() => _$PoliceStationToJson(this);
}