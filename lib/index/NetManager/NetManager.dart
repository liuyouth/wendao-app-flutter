import 'dart:convert';

import 'package:task/index/NetManager/ListParams.dart';
import 'package:task/index/NetManager/NetUtil.dart';
import 'package:task/index/NetManager/Result.dart';
import 'package:task/index/page/login/user.dart';

import 'package:rxdart/rxdart.dart';
import 'package:task/index/page/main/Question.dart';

/// 所有网络请求都通过 NetManager 发起请求
class NetManager {

    static const String HOST = "http://api.wd.moi.pub/";
//  static const String HOST = "http://192.168.5.14:2001/";
//  static const String HOST = "http://172.20.10.3:2001/";
//  static const String HOST = "http://192.168.101.6:2001/";
  static NetManager get instance => NetManager();

  Future<ResultI<User>> login(String acc, String pwd) {
    return NetUtil.instance.request<User>(Method.post, "user/login",
        params: {"userName": acc, "passWord": pwd});
  }
  Future<ResultI<Question>> getQuestionList(num page){
    return NetUtil.instance.request<Question>(Method.get, "qu/", queryParameters:
    {"currentPage":0,"pageSize":20});
  }

  Future<Map<String, dynamic>> getJson(String url) {
    return NetUtil.instance.netRequestBare(NetUtil.instance.getRequestMethod(Method.get),url);
  }
}

/// 用不到 Observable !!! 不然就是回调了 直接用Futura
//  Observable<ResultI<Task>> getTaskList() {
////    return NetUtil.instance.netRequest<Task>(Method.get,"task/");
////    print(NetUtil.instance.request<Task>(Method.get,"task/", params: []).toString());
//    return Observable.fromFuture(
//        NetUtil.instance.request<Task>(Method.get,"task/", params: [])
//            ).asBroadcastStream();
//  }
/// VM 调用代码 Observable 的
//     NetManager.instance.getTaskList()
//          .listen((result) {
//        DataResponse<TaskListEntity> dataResponse;
//        print('result');
//        print(result.getData());
//        if (result is ListResult<Task>) {
//          ListResult<Task> data = result;
//          print(data.toString());
//          dataResponse = DataResponse(entity: TaskListEntity(data.getData()));
//        }
//        return dataResponse;
//      });
