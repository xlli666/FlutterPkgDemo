import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 项目主颜色
const Color mainColor = Color(0xFF5383ec);

/// 白色
const Color white = Color(0xFFFFFFFF);

/// 蓝色
const Color blue = Color(0xFF508cee);

const Color scaffoldBackgroundColor = Color(0xFFFAFAFA);

const Color pageBColor = Color(0xf1f1f1);

///主要文字颜色
const Color textprimary = Color(0xFF303133);
// 常规文字颜色
const Color textregular = Color(0xFF606266);
// 次要文字颜色
const Color textsecondary = Color(0xFF909399);
// 占位符文字颜色
const Color textplaceholder = Color(0xFFc0c4cc);
const Color borderplaceholder = Color(0xFFE6E6E6);

/// 大小不变化 - 根据宽度或高度中的较小者进行调整
num fixSize(num value) {
  if (value == null) return null;
  if (value < 0) {
    num _value = -value;
    return -_value.r;
  }
  return value.r;
}

/// 根据屏幕设置宽度
num setWidth(num value) {
  if (value == null) return null;
  if (value < 0) {
    num _value = -value;
    return -_value.w;
  }
  return value.w;
  /*
  if (value < 0) {
    num _value = -value;
    return -ScreenUtil().setWidth(_value);
  } else {
    return ScreenUtil().setWidth(value);
  }*/
}

/// 根据屏幕设置高度
num setHeight(num value) {
  if (value == null) return null;
  if (value < 0) {
    num _value = -value;
    return -_value.h;
  }
  return value.h;
  /*
  if (value < 0) {
    num _value = -value;
    return -ScreenUtil().setHeight(_value);
  } else {
    return ScreenUtil().setHeight(value);
  }*/
}

/// 根据屏幕设置字体大小
num setSize(num value) {
  return value.sp;
}

/// 屏幕宽度
// num maxWidth = MediaQueryData.fromWindow(window).size.width;
num maxWidth = 1.sw;

/// 屏幕高度
// num maxHeight = MediaQueryData.fromWindow(window).size.height;
num maxHeight = 1.sh;

/// 状态栏高度
// final statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
final statusBarHeight = ScreenUtil().statusBarHeight;

/// 快捷设置边框
class MBorder {
  static final Color borderColor = Color(0xffebedf0);

  static final BoxBorder horizontal = new Border(
      left: BorderSide(color: borderColor),
      right: BorderSide(color: borderColor));
  static final BoxBorder vertical = new Border(
      bottom: BorderSide(color: borderColor),
      top: BorderSide(color: borderColor));
  static final BoxBorder right =
      new Border(right: BorderSide(color: borderColor));
  static final BoxBorder bottom =
      new Border(bottom: BorderSide(color: borderColor));
  static final BoxBorder top = new Border(top: BorderSide(color: borderColor));
  static final BoxBorder left =
      new Border(left: BorderSide(color: borderColor));
  static final BoxBorder all = new Border.all(color: borderColor);
}

/// 快捷设置文字样式
TextStyle setFont({
  double fontSize = 28,
  color = textprimary,
  fontWeight = FontWeight.normal,
  double lineHeight,
}) {
  var style = TextStyle(
    fontSize: setSize(fontSize),
    color: color,
    height: lineHeight,
    fontWeight: fontWeight,
  );
  return style;
}

/// 16进制转颜色对象
Color hexToColor(String s) {
  // 如果传入的十六进制颜色值不符合要求，返回默认值
  if (s == null ||
      s.length != 7 ||
      int.tryParse(s.substring(1, 7), radix: 16) == null) {
    s = '#999999';
  }

  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}

// 主题列表
final Map<int, Map<String, Color>> themeColor = {
  0: {
    //blue0
    "primaryColor": Color(0xff334287),
    "primaryColorDark": Color(0xff303a66),
    "colorAccent": Color(0xff344aad),
    "colorPrimaryLight": Color(0xff7c8bcf),
  },
  1: {
    //blue1
    "primaryColor": Color(0xff2196F3),
    "primaryColorDark": Color(0xff1976D2),
    "colorAccent": Color(0xff448AFF),
    "colorPrimaryLight": Color(0xffBBDEFB),
  },
  2: {
    //red
    "primaryColor": Color(0xffF44336),
    "primaryColorDark": Color(0xffD32F2F),
    "colorAccent": Color(0xffFF5252),
    "colorPrimaryLight": Color(0xffFFCDD2),
  },
  3: {
    //green
    "primaryColor": Color(0xff4caf50),
    "primaryColorDark": Color(0xff388E3C),
    "colorAccent": Color(0xff8BC34A),
    "colorPrimaryLight": Color(0xffC8E6C9),
  },
  4: {
    //pink
    "primaryColor": Color(0xffE91E63),
    "primaryColorDark": Color(0xffC2185B),
    "colorAccent": Color(0xffFF4081),
    "colorPrimaryLight": Color(0xffF8BBD0),
  },
  5: {
    //purple
    "primaryColor": Color(0xff673AB7),
    "primaryColorDark": Color(0xff512DA8),
    "colorAccent": Color(0xff7C4DFF),
    "colorPrimaryLight": Color(0xffD1C4E9),
  },
  6: {
    //grey
    "primaryColor": Color(0xff9E9E9E),
    "primaryColorDark": Color(0xff616161),
    "colorAccent": Color(0xff9E9E9E),
    "colorPrimaryLight": Color(0xffF5F5F5),
  },
  7: {
    //black
    "primaryColor": Color(0xff333333),
    "primaryColorDark": Color(0xff000000),
    "colorAccent": Color(0xff666666),
    "colorPrimaryLight": Color(0xff999999),
  },
};

//////////////////其他颜色搭配///////////////////////////
/// 蓝色背景 边框
const Color primaryColor = Color(0xFFcce5ff);
const Color primaryBorderColor = Color(0xFFb8daff);

// 浅灰背景及边框
const Color secondaryColor = Color(0xFFe2e3e5);
const Color secondaryBorderColor = Color(0xFFd6d8db);
const Color threeBorderColor = Color(0xFFededed);
const Color fourBorderColor = Color(0xFFABABAB);

// success背景及边框
const Color successColor = Color(0xFFd4edda);
const Color successBorderColor = Color(0xFFc3e6cb);

// danger
const Color dangerColor = Color(0xFFf8d7da);
const Color dangerBorderColor = Color(0xFFf5c6cb);

// warning
const Color warningColor = Color(0xFFfff3cd);
const Color warningBorderColor = Color(0xFFffeeba);

// info
const Color infoColor = Color(0xFFd1ecf1);
const Color infoBorderColor = Color(0xFFbee5eb);

// dark
const Color darkColor = Color(0xFFd6d8d9);
const Color darkBorderColor = Color(0xFFc6c8ca);

// 背景色
const Color bgblue = Color(0xFF007bff);
const Color bgindigo = Color(0xFF6610f2);
const Color bgpurple = Color(0xFF6f42c1);
const Color bgpink = Color(0xFFe83e8c);
const Color bgred = Color(0xFFdc3545);
const Color bgorange = Color(0xFFfd7e14);
const Color bgyellow = Color(0xFFffc107);
const Color bggreen = Color(0xFF28a745);
const Color bgteal = Color(0xFF20c997);
const Color bgcyan = Color(0xFF17a2b8);
const Color bggray = Color(0xFF6c757d);
const Color bggraydark = Color(0xFF343a40);
const Color bgprimary = Color(0xFF007bff);
const Color bgsecondary = Color(0xFF6c757d);
const Color bgsuccess = Color(0xFF28a745);
const Color bginfo = Color(0xFF17a2b8);
const Color bgwarning = Color(0xFFffc107);
const Color bgdanger = Color(0xFFdc3545);
const Color bglight = Color(0xFFf8f9fa);
const Color bgdark = Color(0xFF343a40);

/// 菜单颜色
final Map<int, Color> menuRandomColor = {
  0: bgsuccess,
  1: bgwarning,
  2: bginfo,
  3: bgpink,
  4: bgdanger,
  5: bgprimary,
  6: bgyellow,
  7: bgred,
  8: bgteal,
  9: bgorange,
  10: bgdark,
  11: bgindigo,
  12: bggray,
  13: bgcyan,
  14: bgpurple
};
