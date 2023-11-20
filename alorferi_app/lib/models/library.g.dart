// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Library _$LibraryFromJson(Map<String, dynamic> json) => Library(
      id: json['id'] as String?,
      logo_url: json['logo_url'] as String?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      mobile: json['mobile'] as String?,
      web_site_url: json['web_site_url'] as String?,
    );

Map<String, dynamic> _$LibraryToJson(Library instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logo_url,
      'web_site_url': instance.web_site_url,
      'mobile': instance.mobile,
      'address': instance.address,
    };
