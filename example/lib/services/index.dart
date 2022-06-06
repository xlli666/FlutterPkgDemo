import 'package:myx_pkg/myx_pkg.dart';

class BaseApi {
  static dataList(ulrStr, {
    Map<String, dynamic> param,
    mock = false,
  }) async {
    try {
      var response = await request(
        MethodType.post,
        ulrStr,
        data: param,
        loading: false,
        mock: mock,
      );
      return response['data'];
    } catch (e) {
      return null;
    }
  }
}