import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/common/common.dart';
import 'package:task/index/NetManager/NetManager.dart';
import 'package:task/index/NetManager/Result.dart';
import 'package:task/index/page/main/Answer.dart';
import 'package:task/index/page/main/Question.dart';
import 'package:task/packages/fast_mvvm/fast_mvvm.dart';



/**
 * MainVM
 */
class MainVM extends BaseViewModel<MainModel, MainEntity> {
  MainVM();
  ValueNotifier<bool> remember = ValueNotifier(false);
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  // User task = User.empty();
  ValueNotifier<List<Question>> dayWDFeeds = ValueNotifier(List());
  @override
  void initResultData() {

  }

  /// 修改第一个数据的时间
  void modifyFistTime() {
//    list[0].time = DateTime.now().toString();
//    vnTime.value = list[0].time;
    notifyListeners();
  }
  @override
  Future<DataResponse<MainEntity>> requestHttp({bool isLoad, int page, params}) {
    return Future.value(DataResponse(entity: MainEntity()));
  }
  @override
  Future<DataResponse<MainEntity>> requestData(bool isLoad, int page) {
    return Future.value(DataResponse(entity: MainEntity()));
  }
   @override
  void init() {
    super.init();
    var q = Question.empty();
    q.title = "wewe";
    q.info="eee";
    q.postTime = 342;

    dayWDFeeds.value.add(q);
    dayWDFeeds.value.add(q);
    dayWDFeeds.value.add(q);
    // dayWDFeeds.value.add(WDFeed(1, "question", "questioner", 902313123, [
    //   Answer(1,"天","tiaje",12831)
    // ]));
    // dayWDFeeds.value.add(WDFeed(1, "tcp协议和ip协议之间的关系是怎样的", "小黑", 902313123, [
    //   Answer(1,"TCP协议负责把数据分成若干个数据包（数据报 ） ，并且给每个数据包加上包头，包头上有相应的编号，以保证数据接收端能将数据还原为原来的格式。IP协议在每个包头再加上接收端的主机地址，这样数据找到自己要区的地方，如果传输途中出现数据丢失，则TCP协议会自动要求重传。","小白",12831)
    // ]));
    // dayWDFeeds.value.add(WDFeed(1, "Http协议在理想网络模型中的第几层", "小黑", 902313123, [
    //   Answer(1,"应用层 第一层 TCP协议在传输层 第四层 ip 协议在网络层 第五层","小白",12831)
    // ]));
  }

  void tabOnShow(int index) {
    if(index==1) {
      model.getQuestionList().then((value) {
        dayWDFeeds.value.addAll(value);
        notifyListeners();
      });
    }


  }
}

/// Todo模块的数据model
class MainModel extends BaseModel {
//   /// 登录
//   Future<User> login(String account, String pwd) async {
//     ResultI<User> data = await NetManager.instance.login(account, pwd);
//     print('ddd' + data.toString());
//     return data.data;
// //    if(data.code == 200){
// //      return true;
// //    }else {
// //      return false;
// //    }
//   }
  Future<List<Question>> getQuestionList() async {
    ListResult<Question> resultI = await NetManager.instance.getQuestionList(0);
    return resultI.getData();
  }
  /// 添加待办
//  Future<DataResponse<TaskListEntity>> addTask(Task task) async {
//    DataResponse<TaskListEntity> dataResponse;
//    ResultI<Task> data = await  NetManager.instance.addTask(task);
//    dataResponse = DataResponse(entity: TaskListEntity(data.getData()));
//    Log.d(" data "+dataResponse.toString());
//    return  dataResponse;
//  }
}

class MainEntity extends BaseEntity {


  @override
  String toString() {
    return 'TaskListEntity{list: }';
  }

  MainEntity();
}
