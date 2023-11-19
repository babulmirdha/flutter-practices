// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      policeStation: PoliceStation.fromJson(
          json['police_station'] as Map<String, dynamic>),
      district: District.fromJson(json['district'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'police_station': instance.policeStation,
      'district': instance.district,
    };
