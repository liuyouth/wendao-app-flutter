import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:task/index/index_router.dart';
import 'package:task/index/page/main/QAHomeFragment.dart';
import 'package:task/index/page/main/Question.dart';
import 'package:task/index/page/main/main_core.dart';
import 'package:task/packages/fast_mvvm/fast_mvvm.dart';
import 'package:task/res/styles.dart';
import 'package:task/routers/fluro_navigator.dart';

import '../login/user.dart';
import 'main_core.dart';
import 'main_core.dart';
import 'main_core.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainPageState();
}

class MainPageState extends State<MainPage>
    with BaseViewOfState<MainPage, MainVM>, TickerProviderStateMixin {
  TabController _tabController;
  List colors = [Color(0xffF2F5F9), Colors.pinkAccent, Colors.orangeAccent];
  int currentIndex = 1;

  @override
  ViewConfig<MainVM> initConfig(BuildContext context) {
    return false
        ? ViewConfig<MainVM>(vm: MainVM(), empty: null)
        : ViewConfig<MainVM>.noRoot(vm: MainVM(), empty: null);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        _vm.tabOnShow(_tabController.index);

        print('index ' + _tabController.index.toString());
        setState(() {
          currentIndex = _tabController.index;
        });
      });
    _tabController.animateTo(currentIndex,
        duration: Duration(milliseconds: 100), curve: Curves.ease);

  }

  @override
  void mixinBuild(BuildContext context) {
    super.mixinBuild(context);
  }
  MainVM _vm;
  QAHomeFragment _qaHomeFragment;
  @override
  Widget vmBuild(BuildContext context, MainVM vm, Widget child, Widget state) {
    _vm = vm;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: colors[0],
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.web_asset, size: 30),
          Icon(Icons.account_box, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          print("index==" + index.toString());
          setState(() {
            currentIndex = index;
          });
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 100), curve: Curves.ease);
        },
      ),
      body: TabBarView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          Container(
            color: colors[0],
            child: getNavigationView(vm),
          ),
          Container(
            color: colors[0],
            child: getDayView(vm),
          ),
          Container(
            color: colors[0],
            child: getMeView(vm),
                      )
                    ],
                  ),
                );
              }
            
              getNavigationView(MainVM vm) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 50,
                      child: Text("展示app 拥有的功能"),
                    ),
                    getView("Todo","记录非周期性事件",Color(0xff5A76E5),
                            ()=> NavigatorUtils.push(vm.context, IndexRouter.taskPage)),
                    getView("闻达","看到想办法达到",Color(0xff104377),
                        ()=>NavigatorUtils.push(vm.context, IndexRouter.indexPage)),
            
            
                  ],
                );
              }
            
              getView(String s,String info, Color color,GestureTapCallback onTap) {
                return InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: color,
                          boxShadow: [
                            BoxShadow(
                                color: color,
                                offset: Offset(0, 0.5),
                                blurRadius: 8.0,
                                spreadRadius: -.0)
                          ]),
                      margin: EdgeInsets.only(left: 20, right: 50),
                      height: 60,
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(s, textAlign:TextAlign.left  , style: TextStyles.textWhite14,),
                              Text(info, style: TextStyle(color: Colors.white60),),
                            ],)
                      ),
                    ),
                  ),
                );
              }
            getDayView(MainVM vm){
    return _qaHomeFragment == null ? _qaHomeFragment=QAHomeFragment() : _qaHomeFragment;
            }
              // getDayView(MainVM vm) {
              //
              //   return Column(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.only(top: 40),
              //         height: 30,
              //         child: Text("闻道"),
              //       ),
              //       Container(
              //         width: 430,
              //         height: 180,
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           padding: EdgeInsets.all(5),
              //           itemCount: vm.dayWDFeeds.value.length,
              //           itemBuilder: (ctx, index) {
              //             return Selector<MainVM, Question>(
              //               selector: (_, aVM) => aVM.dayWDFeeds.value[index],
              //               shouldRebuild: (pre, next) => pre == next,
              //               builder: (_, Question value, __) =>
              //                   _wd_feed_item(context,vm, value),
              //             );
              //           },
              //         ),
              //       ),
              //
              //       getView("闻达","看到想办法达到",Color(0xff104377),
              //               ()=>NavigatorUtils.push(vm.context, IndexRouter.indexPage)),
              //
              //
              //     ],
              //   );
              // }
            
              getBox(String s, String info, String date, String asker, String answerer,Color color, Function() onTap) {
                return InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: color,
                          boxShadow: [
                            BoxShadow(
                                color: color,
                                offset: Offset(0, 0.5),
                                blurRadius: 8.0,
                                spreadRadius: -.0)
                          ]),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 170,
                      width: 360,
                      child: Padding(
                          padding: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text(s, textAlign:TextAlign.left  , style: TextStyles.textWhite16,),
                                  Text(" "+asker,style: TextStyle(color: Colors.white70))],),
                              Container(
                                height: 104,
                                child:
                              Text(info,maxLines: 5, overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white60),),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [ Text(answerer, style: TextStyle(color: Colors.white70)), Text(date, style: TextStyle(color: Colors.white30))],)
                    ],)
                      ),
                    ),
                  ),
                );
              }
            
              getMeView(MainVM vm) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 50,
                      child: Text("闻道"),
                    ),
            //         ZefyrEditor(
            //   controller: _controller,
            //   focusNode: _focusNode,
            //   autofocus: true,
            //   embedBuilder: customZefyrEmbedBuilder,   // embedBuilder是处理图片上传的function
            //   // readOnly: true,  // readOnly 就比较明显，编辑状态还是只读状态
            // ),
                  ]);
              }

  _wd_feed_item(BuildContext context, MainVM vm,Question value) {
    // var info = "暂时还未有达者回答，快来发表见解";
    // var answerer = "达者为师";
    // if(value.answers!=null)
    // if(value.answers.length>0){
    //   info = value.answers[0].title;
    //   answerer = value.answers[0].info;
    // }
    if(value.postUser==null)
      value.postUser = User.fromName("佚名");
    return getBox(value.title, value.info, value.postTime.toString(), value.postUser.nikeName, "TAG", Color(0xff5A76E5),
      ()=> NavigatorUtils.push(vm.context, IndexRouter.taskPage));
  }
}
