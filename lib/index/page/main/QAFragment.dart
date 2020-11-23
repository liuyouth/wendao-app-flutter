import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Widget build(BuildContext context) => new Center(
    child: new Center(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
            width: 360,
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
          new SizedBox(height: 40.0),
          new Transform(
            transform: new Matrix4.translationValues(parallaxOffset, 0.0, 0.0),
            child: const Text('Yet another line of text'),
          ),
        ],
      ),
    ),
  );

  void onTap() {
  }
}