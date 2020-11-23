
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/index/NetManager/NetManager.dart';
import 'package:task/index/NetManager/Result.dart';
import 'package:task/index/page/main/QAFragment.dart';
import 'package:task/index/page/main/Question.dart';
import 'package:task/res/styles.dart';

class QAHomeFragment extends StatefulWidget{
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
  Future<List<Question>> getQuestionList() async {
    ListResult<Question> resultI = await NetManager.instance.getQuestionList(0);
    setState(() {
      datas.addAll(resultI.getData());
    });
    return resultI.getData();
  }
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      backgroundColor: Color(0xffFfffff),
      title: const Text('近日趋势',style: TextStyles.textDarkGray14,),
    ),
    backgroundColor: Color(0xffF2F5F9),
    // todo 添加 回复问题按钮 
    body: new LayoutBuilder(builder: (context, constraints) =>  NotificationListener(
      onNotification: (ScrollNotification note) {
                    setState(() {
          _currentPage = _pageController.page;
        });
                    return false;
      },
      child:  PageView.custom(
        physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
        controller: _pageController,
        childrenDelegate:  SliverChildBuilderDelegate(
              (context, index) {
                return (datas.length != 0)?
                QAFragment(
                  datas[index],
                  parallaxOffset: constraints.maxWidth / 2.0 *
                      (index - _currentPage),) :
                Center(child: Text("暂时还没有数据！"));
              }
          ,
          childCount: (datas.length == 0)? 1 : datas.length ,
        ),
      ),
    )),
  );

}