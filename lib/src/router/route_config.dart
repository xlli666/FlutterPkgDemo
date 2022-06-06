import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myx_pkg/src/const/enum.sys.dart';
import 'package:myx_pkg/src/util/toast.dart';

import 'route_builder.dart';
import 'route_map.dart';

/// 路由设置
Map<String, RouteBuilder> routeConfig = {}
  ..addAll(routeConfigMap);

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;

    // router.define("root",
    //     handler: rootHandler, transitionType: TransitionType.cupertino);
    routeConfig.forEach((path, page) {
      router.define(path.toString(),
          handler: page.getHandler(), transitionType: TransitionType.cupertino);
    });
  }
}

// 根路由函数
Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // return LoginPage();
    return null;
  },
);

// 404路由函数
Handler notFoundHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //print('ROUTE WAS NOT FOUND !!!');
    $toast('ROUTE WAS NOT FOUND !!!', msgType: MessageType.error);
    return Container();
  },
);
