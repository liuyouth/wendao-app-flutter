
import 'package:json_annotation/json_annotation.dart';

part 'ListParams2.g.dart';
@JsonSerializable(nullable: false)
class ListParams2{
  num pageSize;
  String searchStr;
  num currentPage;


  ListParams2({this.pageSize, this.searchStr, this.currentPage});

  factory ListParams2.fromJson(Map<String, dynamic> json) => _$ListParams2FromJson(json);

  Map<String, dynamic> toJson() => _$ListParams2ToJson(this);
}