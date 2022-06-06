import 'api.config.dart';

class ApiInstance {
  // 系统最终使用的url
  String mqttIp;
  int mqttPort;
  String mqttUsername;
  String mqttPassword;

  String mBaseUrl;
  String mBaseUrlEMDC;

  // 服务器配置使用的url
  int typeCode; // 类型: 0-内网, 1-外网, 2-自定义
  List serviceConfigList;

  static ApiInstance instance;

  static ApiInstance getInstance() {
    if (null == instance) {
      instance = ApiInstance();
      instance.typeCode = 0;
      instance.serviceConfigList = mServiceConfigList;
    }
    Map _map = instance.serviceConfigList
        .singleWhere((element) => element['typeCode'] == instance.typeCode);
    instance.mBaseUrl = _map['baseUrl'];
    instance.mqttIp = _map['mqttStr'].split(':')[0];
    instance.mqttPort = int.tryParse(_map['mqttStr'].split(':')[1]);
    instance.mqttUsername = _map['mqttStr'].split(':')[2];
    instance.mqttPassword = _map['mqttStr'].split(':')[3];
    instance.mBaseUrlEMDC = _map['baseUrlEMDC'];
    return instance;
  }
}
