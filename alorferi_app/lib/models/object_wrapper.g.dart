// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectWrapper _$ObjectWrapperFromJson(Map<String, dynamic> json) =>
    ObjectWrapper(
      type: json['type'] as String,
      attributes: json['attributes'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ObjectWrapperToJson(ObjectWrapper instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
    };
