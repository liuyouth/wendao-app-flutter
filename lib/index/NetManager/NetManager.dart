import 'dart:convert';

import 'package:task/index/NetManager/ListParams.dart';
import 'package:task/index/NetManager/NetUtil.dart';
import 'package:task/index/NetManager/Result.dart';
import 'package:task/index/page/login/user.dart';

import 'package:rxdart/rxdart.dart';
import 'package:task/index/page/main/Answer.dart';
import 'package:task/index/page/main/Question.dart';

/// 所有网络请求都通过 NetManager 发起请求
class NetManager {

    // static const String HOST = "http://api.wd.moi.pub/";
    static const String HOST = "http://192.168.5.3:2010/";
//  static const String HOST = "http://192.168.5.14:2001/";
//  static const String HOST = "http://172.20.10.3:2001/";
//  static const String HOST = "http://192.168.101.6:2001/";
  static NetManager get instance => NetManager();

  Future<ResultI<User>> login(String acc, String pwd) {
    return NetUtil.instance.request<User>(Method.post, "user/login",
        params: {"userName": acc, "passWord": pwd});
  }
  Future<ResultI<Answer>> askQuestion(Answer answer) {
    return NetUtil.instance.request(Method.post,"ask/",params: answer.getJson());
  }
  Future<ResultI<Question>> getQuestionList(num page){
    return NetUtil.instance.request<Question>(Method.get, "qu/", queryParameters:
    {"currentPage":0,"pageSize":20});
  }

  Future<Map<String, dynamic>> getJson(String url) {
    return NetUtil.instance.netRequestBare(NetUtil.instance.getRequestMethod(Method.get),url);
  }


}
