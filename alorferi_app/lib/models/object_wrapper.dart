import 'package:json_annotation/json_annotation.dart';

part 'object_wrapper.g.dart';

@JsonSerializable()
class ObjectWrapper {
  final String type;

  final Map<String, dynamic> attributes;

  ObjectWrapper({required this.type, required this.attributes});

  factory ObjectWrapper.fromJson(Map<String, dynamic> json) =>
      _$ObjectWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectWrapperToJson(this);

}
