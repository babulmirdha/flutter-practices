import 'package:alorferi_app/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'library.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Library {

  String? id;
  String? name;
  String? logo_url;
  String? web_site_url;
  String? mobile;
  // Address? address;

  Library({this.id, this.logo_url, this.name, this.mobile, this.web_site_url});

  factory Library.fromJson(Map<String, dynamic> json) => _$LibraryFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryToJson(this);

}
