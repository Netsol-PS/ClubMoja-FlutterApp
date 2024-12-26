import 'package:json_annotation/json_annotation.dart';

part 'country_data.g.dart';

@JsonSerializable()
class CountryData {
  @JsonKey(name: "flag")
  final String? countryFlag;

  @JsonKey(name: "countryCode")
  final String? countryCode;

  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "countryName")
  final String? countryName;

  CountryData({this.countryFlag, this.countryCode, this.id, this.countryName});

  /// Factory method to deserialize JSON into `CountryData`.
  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  /// Method to serialize `CountryData` into JSON.
  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}
