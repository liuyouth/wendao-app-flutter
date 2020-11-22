// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListParams2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListParams2 _$ListParams2FromJson(Map<String, dynamic> json) {
  return ListParams2(
    pageSize: json['pageSize'] as num,
    searchStr: json['searchStr'] as String,
    currentPage: json['currentPage'] as num,
  );
}

Map<String, dynamic> _$ListParams2ToJson(ListParams2 instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'searchStr': instance.searchStr,
      'currentPage': instance.currentPage,
    };
