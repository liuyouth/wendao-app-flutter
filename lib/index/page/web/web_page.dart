import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:task/packages/fast_mvvm/fast_mvvm.dart';

import 'web_core.dart';

class WebPage extends StatelessWidget with BaseView<WebVM> {
  const WebPage({
    Key key,
    this.configState = true,
  }) : super(key: key);

  /// 是否全局刷新
//  final bool rootRefresh;
  final bool configState;
  @override
  ViewConfig<WebVM> initConfig(BuildContext context) {
    return false
        ? ViewConfig<WebVM>(vm: WebVM(), empty: null)
        : ViewConfig<WebVM>.noRoot(vm: WebVM(), empty: null);
  }

  @override
  Widget vmBuild(BuildContext context, WebVM vm, Widget child, Widget state) {
    return Scaffold(
        backgroundColor: Color(0xffF2F5F9),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),

              ///总高度 不管用
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x80ccd7e9),
                      offset: Offset(1.0, 2.0),
                      blurRadius: 8.0,
                      spreadRadius: .2),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                height: 125,
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: TextField(
                          minLines: 3,
                          maxLines: 5,
                          autofocus: true,
                          onSubmitted: (value) {
                          },
                          controller: vm.textEditingController,
                          decoration: InputDecoration(
                            labelText: 'input 输入您预设好的触发 trigger ',
                            contentPadding: EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            fillColor: Colors.blue.shade50,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                        valueListenable: vm.isInput,
                        builder: (_, value, __) {
                          return IconButton(
                            icon:
                                Icon(value ? Icons.delete : Icons.insert_link),
                            onPressed: () => {
                              //
                            },
                          );
                        }),
                    IconButton(
                      icon: Icon(Icons.redo),
                    )
                  ],
                ),
              ),
            ),
            // Row(
            //   children: [
            //     FlatButton(
            //       textColor: Colours.dark_text,
            //       child: const Text("输入",
            //           style: TextStyle(fontSize: Dimens.font_sp18)),
            //       onPressed: () => _login(vm),
            //     ),
            //     FlatButton(
            //       textColor: Colours.text_gray,
            //       child: const Text("解析",
            //           style: TextStyle(fontSize: Dimens.font_sp18)),
            //       onPressed: () =>
            //           executionCode(vm, vm.textEditingController.text),
            //     ),
            //   ],
            // ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: InAppWebView(
                initialUrl:
                    "http://m10.music.126.net/20201014000358/6d4f475723320dd2455daf15d3366c64/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/3095294234/34c7/d75f/deeb/7fad0c8b3c7eb1e6e5b04f894f75acc6.mp3",
                // initialUrl: "https://www.yisu.com/cdn/huodong.html?f=baidu&plan=CDN&unit=hexinci&keyword=cdn&e_creative=38481602964",
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: true,
                )),
                onWebViewCreated: (InAppWebViewController controller) {
                  vm.controller = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                  print('正在加载' + url);
                },
                onReceivedServerTrustAuthRequest:
                    (InAppWebViewController controller,
                        ServerTrustChallenge challenge) async {
                  return ServerTrustAuthResponse(
                      action: ServerTrustAuthResponseAction.PROCEED);
                },
                onLoadError: (InAppWebViewController controller, String url,
                    int code, String message) {
                  print('error ' + message);
                },
                onLoadStop:
                    (InAppWebViewController controller, String url) async {},
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  // setState(() {
                  //   this.progress = progress / 100;
                  // });
                },
              ),
            ),
          ],
        ));
  }
}
