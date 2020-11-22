// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['id'] as num,
    json['number'] as num,
    json['title'] as String,
    json['info'] as String,
    json['postTime'] as num,
    json['lastUpDateTime'] as num,
    json['avatar'] as String,
    User.fromJson(json['postUser'] as Map<String, dynamic>),
    json['postUserNo'] as num,
    (json['answers'] as List)
        .map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'title': instance.title,
      'info': instance.info,
      'postTime': instance.postTime,
      'lastUpDateTime': instance.lastUpDateTime,
      'avatar': instance.avatar,
      'postUser': instance.postUser,
      'answers': instance.answers,
      'postUserNo': instance.postUserNo,
    };
