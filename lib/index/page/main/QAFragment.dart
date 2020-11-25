import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task/index/page/main/Answer.dart';
import 'package:task/index/page/main/main_core.dart';
import 'package:task/res/styles.dart';

import 'Question.dart';



class QAFragment extends StatelessWidget {
  QAFragment(this.data, {
    Key key,
    this.parallaxOffset = 0.0
  }) : super(key: key);

  final Question data;
  final double parallaxOffset;

  @override
  Widget build(BuildContext context) =>
     Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new SizedBox(height: 8.0),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xff5A76E5),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A76E5),
                        offset: Offset(0, 0.5),
                        blurRadius: 8.0,
                        spreadRadius: -.0)
                  ]),
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 170,
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(data.title, textAlign:TextAlign.left  , style: TextStyles.textWhite16,),
                          Text(" "+data.postUser.nikeName,style: TextStyle(color: Colors.white70))],),
                      Container(
                        height: 104,
                        child:
                        Text(data.info,maxLines: 5, overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white60),),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text(data.lastUpDateTime.toString(), style: TextStyle(color: Colors.white70)), Text(data.postTime.toString(), style: TextStyle(color: Colors.white30))],)
                    ],)
              ),
            ),
          ),
        ),
        Container(
          child: Text("eee"),
        ),
        Expanded(child: Transform(
          transform: new Matrix4.translationValues(parallaxOffset*2, 0.0, 0.0),
          child:  ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount: data.answers.length,
              itemBuilder: (ctx, index) {
                return Selector<MainVM, Answer>(
                    selector: (_, aVM) => data.answers[index],
                    shouldRebuild: (pre, next) => pre == next,
                    builder: (_, Answer value, __) => _getCell(value)
                );
              }),),
                        ),


      ],
  );

  void onTap() {
  }

  _getCell(Answer value) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                    color: Color(0x88999999),
                    offset: Offset(0, 0.5),
                    blurRadius: 8.0,
                    spreadRadius: -.0)
              ]),
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 120,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: <Widget>[
                    Text(value.title, textAlign:TextAlign.left  , style: TextStyles.textBold16,)
                  ],),
                  Text(value.info, style: TextStyle(color: Colors.white60),),

                ],)
          ),
        ),
      ),
    );
  }
}