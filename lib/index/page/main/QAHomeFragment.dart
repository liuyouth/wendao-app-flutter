
import 'dart:math';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/index/NetManager/NetManager.dart';
import 'package:task/index/NetManager/Result.dart';
import 'package:task/index/page/main/Answer.dart';
import 'package:task/index/page/main/QAFragment.dart';
import 'package:task/index/page/main/Question.dart';
import 'package:task/index/page/main/rotate_box.dart';
import 'package:task/res/styles.dart';

class QAHomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QAHomeFragmentState();
  }
}

class _QAHomeFragmentState extends State<QAHomeFragment> {
  final PageController _pageController = new PageController();
  double _currentPage = 0.0;
  List<Question> datas = List<Question>();

  @override
  void initState() {
    super.initState();
    getQuestionList();
  }
  bool isShow = false;

  _itemclick() {
    setState(() {
      isShow = !isShow;
    });
  }
  TextEditingController _answerTextController = TextEditingController();

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xffFfffff),
          title: const Text(
            '近日趋势',
            style: TextStyles.textDarkGray14,
          ),
        ),
        backgroundColor: Color(0xffF2F5F9),
        body: new LayoutBuilder(
            builder: (context, constraints) => NotificationListener(
                  onNotification: (ScrollNotification note) {
                    setState(() {
                      _currentPage = _pageController.page;
                    });
                    return false;
                  },
                  child: PageView.custom(
                    physics: const PageScrollPhysics(
                        parent: const BouncingScrollPhysics()),
                    controller: _pageController,
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return (datas.length != 0)
                            ? QAFragment(
                                datas[index],
                                parallaxOffset: constraints.maxWidth /
                                    2.0 *
                                    (index - _currentPage),
                              )
                            : Center(child: Text("暂时还没有数据！"));
                      },
                      childCount: (datas.length == 0) ? 1 : datas.length,
                    ),
                  ),
                )),
        floatingActionButton: Container(
          height: 60,
          width: ScreenUtil.getScreenW(context),
          child: Stack(
            children: <Widget>[
              Align(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 50,
                  width: isShow ? ScreenUtil.getScreenW(context) * 0.9 : 50,
                  child: TextField(
                    controller: _answerTextController,
                    onSubmitted: (s) => fastAddTask(s),
                    style: TextStyles.textBold18,
                    decoration: InputDecoration(
                      hintText: ' Answers —— —— - - ',
                      hintStyle: TextStyles.textDarkGray14,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 300),
                ),
                alignment: Alignment.centerRight,
              ),
              Align(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: isShow ? 100 : 50,
                  curve: Curves.ease,
                  child: AnimatedContainer(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: isShow ? 500 : 300),
                    height: 46,
                    padding: EdgeInsets.only(right: isShow ? 50 : 0),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffeeeeee),
                              offset: Offset(0, 0.5),
                              blurRadius: 8.0,
                              spreadRadius: -.0)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: InkWell(child: Icon(Icons.send, size: 30)
                    ,onTap: ()=>fastAddTask(_answerTextController.text.toString()),),
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
              Align(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffeeeeee),
                            offset: Offset(0, 0.5),
                            blurRadius: 8.0,
                            spreadRadius: -.0)
                      ]),
                  child:  ToggleRotate(
                    rad:  pi /4 ,
                    curve: Curves.linear,
                    child: Icon(Icons.add, size: 30),
                    onTap: () => _itemclick(),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      );



  fastAddTask(String text) async {
    Answer answer = Answer.empty();
    answer.questionNo = datas[_currentPage.toInt()].number;
    answer.title = text;
    Answer a = await askQuestionNet(answer);
    if(a!=null){
      setState(() {
        isShow = !isShow;
      });
    }else {

    }
  }
  Future<Answer> askQuestionNet(Answer answer) async {
    ResultI<Answer> resultI = await NetManager.instance.askQuestion(answer);
    return resultI.getData();
  }
 getQuestionList() async {
    ListResult<Question> resultI = await NetManager.instance.getQuestionList(0);
    if(resultI!=null)
    setState(() {
      datas.addAll(resultI.getData());
    });

  }
}
