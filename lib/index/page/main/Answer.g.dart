// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    json['id'] as num,
    json['answer'] as String,
    json['answerer'] as String,
    json['postDateTime'] as int,
    json['number'] as num,
    json['questionNo'] as num,
    json['title'] as String,
    json['info'] as String,
    json['avatar'] as String,
    json['postUserNo'] as num,
    json['postTime'] as num,
    json['lastUpDateTime'] as num,
  )..postUser = User.fromJson(json['postUser'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'answerer': instance.answerer,
      'postDateTime': instance.postDateTime,
      'number': instance.number,
      'questionNo': instance.questionNo,
      'title': instance.title,
      'info': instance.info,
      'postTime': instance.postTime,
      'lastUpDateTime': instance.lastUpDateTime,
      'avatar': instance.avatar,
      'postUser': instance.postUser,
      'postUserNo': instance.postUserNo,
    };
