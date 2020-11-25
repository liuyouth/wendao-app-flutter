import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:task/index/page/login/user.dart';

part 'Answer.g.dart';

@JsonSerializable(nullable: false)
class Answer {
  num id;
  String answer;
  String answerer;
  int postDateTime;
  num number;// 编号
  num questionNo;// 问题编号
  String title;// 答案标题
  String info;//答案详细
  num postTime;// 提交时间
  num lastUpDateTime;
  String avatar;//附图

  User postUser;
  num postUserNo;

  Answer(
      this.id,
      this.answer,
      this.answerer,
      this.postDateTime,
      this.number,
      this.questionNo,
      this.title,
      this.info,
      this.postTime,
      this.lastUpDateTime,
      this.avatar,
      this.postUser,
      this.postUserNo);

  @override
  String toString() {
    return 'Answer{id: $id, answer: $answer, answerer: $answerer, postDateTime: $postDateTime, number: $number, questionNo: $questionNo, title: $title, info: $info, postTime: $postTime, lastUpDateTime: $lastUpDateTime, avatar: $avatar, postUser: $postUser, postUserNo: $postUserNo}';
  } // 提交用户编号


  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  String getJson(){
    return jsonEncode(toJson());
  }
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
  Answer.empty();
}