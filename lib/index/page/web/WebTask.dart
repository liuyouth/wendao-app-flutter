// part 'WebTask.g.dart';
// @JsonSerializable(nullable: false)
import 'dart:convert';

class WebTask{
  String trigger; // 触发
  TaskTarget target;// 目标
  String importScript;
  String readyScript;
  List<WebTaskStep> steps;// 步骤

  // factory WebTask.fromJson(Map<String, dynamic> json) => _$WebTaskFromJson(json);
  // String getJson(){return jsonEncode(toJson());}
  // Map<String, dynamic> toJson() => _$WebTaskToJson(this);
  // WebTask.empty();
}
class WebTaskStep{
  StepType type; // 步骤类型
  String json; // 元数据
  String script; // 脚本
  bool needResult;

  WebTaskStep(this.type, this.json, this.script,
      this.needResult); // 是否承接返回值到下一个步骤 亦 最终返回json


}

enum StepType{
  INJECTION,EXECUTE,NET
}
enum TaskTarget{
  AUDIO,VIDEO,TEXT,PICTURE
}


