// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      countryFlag: json['flag'] as String?,
      countryCode: json['countryCode'] as String?,
      id: (json['id'] as num?)?.toInt(),
      countryName: json['countryName'] as String?,
    );

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'flag': instance.countryFlag,
      'countryCode': instance.countryCode,
      'id': instance.id,
      'countryName': instance.countryName,
    };
