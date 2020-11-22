import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:task/index/page/login/user.dart';
import 'package:task/index/page/main/Answer.dart';

part 'Question.g.dart';

@JsonSerializable(nullable: false)
class Question {
  num id;
  num number;// 编号
  String title;// 标题
  String info;//详细
  num postTime;// 提交时间
  num lastUpDateTime;
  String avatar;//附图

  User postUser;
  List<Answer> answers;
  num postUserNo;// 提交用户编号


  Question(
      this.id,
      this.number,
      this.title,
      this.info,
      this.postTime,
      this.lastUpDateTime,
      this.avatar,
      this.postUser,
      this.postUserNo,
      this.answers);


  @override
  String toString() {
    return 'Question{id: $id, number: $number, title: $title, info: $info, postTime: $postTime, lastUpDateTime: $lastUpDateTime, avatar: $avatar, postUser: $postUser, answers: $answers, postUserNo: $postUserNo}';
  }

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  String getJson(){
    return jsonEncode(toJson());
  }
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  Question.empty();
}