import 'package:example/pages/about.dart';
import 'package:example/pages/home.dart';
import 'package:myx_pkg/myx_pkg.dart';

abstract class RouterExample {
  // 主菜单页面
  static String home = "home";
  // 关于页面
  static String about = "about";
}

final Map<String, RouteBuilder> routeConfigExample = {
  RouterExample.home: RouteBuilder(builder: (bundle) => Home()),
  RouterExample.about: RouteBuilder(builder: (bundle) => About()),
};
