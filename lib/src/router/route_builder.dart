import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:myx_pkg/src/util/bundle.dart';


/// 路由控制
typedef HandlerFunc = Widget Function(BuildContext context, Map<String, List<String>>);

typedef Builder = Widget Function(Bundle bundle);
class RouteBuilder {
  final Builder builder;
  HandlerFunc handlerFunc;
  RouteBuilder({this.builder}) {
    this.handlerFunc = (context, _) {
      return this.builder(ModalRoute.of(context).settings.arguments as Bundle);
    };
  }
  Handler getHandler() {
    return new Handler(handlerFunc: this.handlerFunc);
  }
}
