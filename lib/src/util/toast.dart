import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myx_pkg/src/const/enum.sys.dart';
import 'package:myx_pkg/src/style/myx_theme.dart';


/// 轻提示
$toast(
  String text, {
  MessageType msgType,
}) {
  BotToast.showText(
      text: text.toString().replaceAll(new RegExp(r'<[^>]+>'), '') ?? '',
      textStyle: TextStyle(fontSize: setSize(26), color: white),
      borderRadius: BorderRadius.all(Radius.circular(6)),
      contentColor: $setColor(msgType),
      duration: Duration(seconds: 3)); //popup a text toast;
}

/// 设置轻提示背景颜色
Color $setColor(MessageType msgType) {
  Color cColor = Color.fromARGB(210, 0, 0, 0);
  switch (msgType) {
    case MessageType.error:
      cColor = Colors.red;
      break;
    case MessageType.warn:
      cColor = Colors.amber;
      break;
  }
  return cColor;
}

/// 显示加载框
CancelFunc $showLoading({String text = "加载中..."}) {
  CancelFunc key;
  key = BotToast.showCustomLoading(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      toastBuilder: (textCancel) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            // constraints: BoxConstraints(maxWidth: setWidth(260)),
            child: Card(
              color: Color.fromARGB(220, 0, 0, 0),
              elevation: 10,
              margin: EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6),),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    height: setHeight(66),
                    child: SpinKitWave(
                      color: Color.fromARGB(210, 229, 52, 57),
                      size: setSize(14),
                      duration: Duration(milliseconds: 1000),
                    ),
                  ),
                  Offstage(
                    offstage: text.isEmpty,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 6),
                      child: Text(
                        text,
                        style: TextStyle(color: white, fontSize: setSize(26),),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
  return key;
}

/// 隐藏加载框
$hideLoading(CancelFunc hide) {
  if (hide != null) {
    hide();
  }
}
