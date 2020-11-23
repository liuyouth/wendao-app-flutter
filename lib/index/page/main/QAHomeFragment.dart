
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
   getQuestionList.call().then((value) => {datas.addAll(value)});
  }
  Future<List<Question>> getQuestionList() async {
    ListResult<Question> resultI = await NetManager.instance.getQuestionList(0);
    return resultI.getData();
  }
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      backgroundColor: Color(0xffFfffff),
      title: const Text('Page Demo',style: TextStyles.textDarkGray14,),
    ),
    backgroundColor: Color(0xffF2F5F9),
    body: new LayoutBuilder(builder: (context, constraints) => new NotificationListener(
      onNotification: (ScrollNotification note) {
                    setState(() {
          _currentPage = _pageController.page;
          print('eeee'+_currentPage.toString());
        });
      },
      child: new PageView.custom(
        physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
        controller: _pageController,
        childrenDelegate: new SliverChildBuilderDelegate(
              (context, index) => new QAFragment(
            datas[_currentPage.toInt()],
            parallaxOffset: constraints.maxWidth / 2.0 * (index - _currentPage),
          ),
          childCount: 10,
        ),
      ),
    )),
  );

}