import 'package:bot_toast/bot_toast.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:myx_pkg/myx_pkg.dart';
import 'package:simple_moment/simple_moment.dart';

import 'routers/route_example.dart';
import 'util/moment_local_CN.dart';

GlobalKey mainGlobalKey = GlobalKey();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

// void main() {
//   runApp(MyApp());
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(
//     //表示是否在控制台显示调试信息
//     debug: true,
//   );
//   final FluroRouter router = FluroRouter();
//   Routes.configureRoutes(router);
//   Application.router = router;
//   WidgetsFlutterBinding.ensureInitialized();
//   //设置moment本地化信息
//   Moment.setLocaleGlobally(LocaleCN());
//   //状态栏
//   FlutterStatusbarManager.setColor(Color.fromARGB(0, 0, 0, 0), animated: true);
//   runApp(MultiProvider(
//     providers: [
//       Provider<UserStore>(create: (_) => UserStore()),
//       Provider<AppStore>(create: (_) => AppStore()),
//     ],
//     child: MyApp(),
//   ));
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  routeConfig..addAll(routeConfigExample);
  final FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  WidgetsFlutterBinding.ensureInitialized();
  //设置moment本地化信息
  Moment.setLocaleGlobally(LocaleCN());
  //状态栏
  FlutterStatusbarManager.setColor(Color.fromARGB(0, 0, 0, 0), animated: true);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        750.0,
        1334.0,
      ),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouterExample.home,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          platform: TargetPlatform.iOS,
        ),
        key: mainGlobalKey,
        navigatorKey: navigatorKey,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

