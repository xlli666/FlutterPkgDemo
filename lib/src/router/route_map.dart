import 'package:myx_pkg/src/scan/scan_page.dart';

import 'route_builder.dart';

abstract class RouterMap {
  // 摄像头扫描
  static String scanner = "scanner";
  // 大图查看
  static String pagePhotoView = "page_photo_view";
  // 蓝牙扫描
  static String scanBluetooth = "scan_bluetooth";
}

final Map<String, RouteBuilder> routeConfigMap = {
  RouterMap.scanner: RouteBuilder(builder: (bundle) => ScanPage()),
};
