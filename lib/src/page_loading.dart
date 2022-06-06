import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'style/myx_theme.dart';

/// Loading页顶部导航设置
class AppBarState {
  AppBarState({this.title, this.backInit, this.goBack,});
  ///标题
  String title;
  ///后退是否刷新
  bool backInit;
  ///后退
  void Function(BuildContext, bool) goBack;
}

/// Loading页面
class PageLoading extends StatelessWidget {
  PageLoading({Key key, this.appBarState,}): super(key: key);
  final AppBarState appBarState;
  @override
  Widget build(BuildContext context) {
    return appBarState == null ? Container(
      color: white,
      alignment: Alignment.center,
      child: Image.asset(
        'IMGs.MeetLoading',
        width: 300,
        height: 300,
      ),
    ) : Column(children: <Widget>[
      AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        leading: InkWell(
          onTap: () => {
            appBarState.goBack(context, appBarState.backInit)
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
            size: setSize(26),
          ),
        ),
        title: Text(
          appBarState.title,
          style: TextStyle(
            color: white,
            fontSize: setSize(26),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        color: white,
        alignment: Alignment.center,
        child: Image.asset(
          'IMGs.MeetLoading',
          width: 300,
          height: 300,
        ),
      ),
    ],);
  }
}
