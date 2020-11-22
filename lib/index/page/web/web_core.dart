import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:oktoast/oktoast.dart';
import 'package:task/common/common.dart';
import 'package:task/index/NetManager/NetManager.dart';
import 'package:task/index/NetManager/Result.dart';
import 'package:task/index/page/web/WebTask.dart';
import 'package:task/packages/fast_mvvm/fast_mvvm.dart';
import 'package:task/util/toast.dart';


import 'user.dart';

/**
 * ToDoVM
 */
class WebVM extends BaseViewModel<WebModel, LoginEntity> {
  WebVM();

  ValueNotifier<bool> isInput = ValueNotifier(false);
  InAppWebViewController controller;
  User task = User.empty();
  TextEditingController textEditingController = TextEditingController();

  TextEditingController infoEditingController = TextEditingController();
  AudioPlayer audioPlayer = AudioPlayer();

  ValueNotifier<bool> isPlaying = ValueNotifier(false);

  @override
  void initResultData() {}

  void fastAddTask({String text}) async {

  }



  @override
  void init() {
    super.init();
  }
}

class WebModel extends BaseModel {

}

class LoginEntity extends BaseEntity {
  User user;

  @override
  String toString() {
    return 'TaskListEntity{list: $user}';
  }

  LoginEntity(this.user);
}
