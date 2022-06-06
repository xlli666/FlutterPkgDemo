import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:myx_pkg/src/const/api.config.dart';
import 'package:myx_pkg/src/const/api.instance.dart';
import 'package:myx_pkg/src/const/emdc.config.dart';
import 'package:myx_pkg/src/const/enum.sys.dart';
import 'package:myx_pkg/src/event/global_event_bus.dart';
import 'package:myx_pkg/src/event/login_event.dart';

import 'logger.dart';
import 'storage.dart';
import 'toast.dart';
import 'tools.dart';

baseRequest(request, onError) async {
  BaseOptions baseOptions = new BaseOptions(
    baseUrl: ApiInstance.getInstance().mBaseUrl,
    connectTimeout: 30000,
    sendTimeout: 30000,
    receiveTimeout: 30000,
    headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    },
  );

  BaseOptions options = baseOptions;
  try {
    var token = await Storage.get(tokenStore);
    if (token != null && token.toString().isNotEmpty) {
      options.headers.putIfAbsent('token', () => token);
    }
  } catch (e) {
    Logger.d(e);
  }

  CookieJar cookieJar = CookieJar();

  // Dio dio = new Dio(); // 使用默认配置
  Dio dio = new Dio(options);
  RequestOptions requestOptions;

  dio.interceptors
    ///Cookie管理
    ..add(CookieManager(cookieJar))
    // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
    ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      requestOptions = options;
      // 在请求被发送之前做一些事情
      print('\n================== 请求数据 ==========================');
      print('url:${options.uri.toString()}');
      print('headers:${options.headers}');
      print('method:${options.method}');
      print('queryParameters:${options.queryParameters}');
      print('data:${options.data}');
      print('================== 请求数据 END==========================\n');
      return options;
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理
      print('\n================== 响应数据 ==========================');
      print('url:${requestOptions.method}  ${requestOptions.uri.toString()}');
      print('code = ${response.statusCode}');
      Logger.d('data = ${response.data}');
      print('\n================== 响应数据 END======================');
      // $hideLoading(key);
      return response;
    }, onError: (DioError e) {
      // 当请求失败时做一些预处理
      print('\n================== 错误响应数据 ======================');
      print('url:${requestOptions.method}  ${requestOptions.uri.toString()}');
      print('type = ${e.type ?? ''}');
      print('message = ${e.message ?? ''}');
      if (e.type == DioErrorType.RESPONSE) {
        Logger.d('response = ${e.response.data ?? ''}');
      }
      print('\n================== 错误响应数据 END======================');
      onError(e);
      throw e;
    },))
    ///加入缓存策略
    ..add(DioCacheManager(
      CacheConfig(
        baseUrl: ApiInstance.getInstance().mBaseUrl,
        maxMemoryCacheCount: 200,
      ),
    ).interceptor);

  try {
    return request(dio);
  } catch (e) {
    Logger.d(e);
    throw e;
  }
}

request(MethodType method, String url, {
  data,
  Map<String, dynamic> param,
  loading = true,
  mock = false,
  loadText = "加载中...",
  Options options,
  String baseUrl,
}) async {
  //进行Loading
  CancelFunc key;
  if (loading) {
    key = $showLoading(text: loadText);
  }
  // 请求成功操作
  success(Dio dio) async {
    if (mock) {
      dio.options.baseUrl = 'http://192.168.252.198:3001/mock/960/nem';
    }
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
      if (baseUrl == baseUrlEMDC) {
        if (!useEMDC) {
          return;
        }
        if (param == null) param = {};
        param.addAll({'access_token': tokenEMDC});
      }
    }
    Response response = await (method == MethodType.post ? dio.post(
      url,
      data: data,
      queryParameters: param,
      options: options,
    ) : dio.get(
      url,
      queryParameters: param,
      options: options,
    ));
    var res = response.data;
    await delayHandler(20);
    $hideLoading(key);
    return res;
  }
  // 请求失败处理
  onError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      $toast("网络连接超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      if (e.response.data != null) {
        Map<String, dynamic> response = json.decode(e.response.data);
        if (response.containsKey("message")) {
          $toast(response["message"]);
          // 删除存储的token
          Storage.remove(tokenStore);
          // 退出到调用EventBus的页面
          GlobalEventBus().event.fire(LoginEvent());
        } else if (response.containsKey("msg")) {
          $toast(response["msg"]);
        } else {
          $toast("接口错误，请稍后重试");
        }
      }
    } else {
      $toast("网络错误，请稍后重试");
    }
    $hideLoading(key);
  }

  return baseRequest(success, onError);
}