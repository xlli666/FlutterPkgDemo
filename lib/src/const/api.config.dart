/*
 * @description: 系统配置
 * @author: lixuelong
 * @Date: 2022-02-22 17:50:02
 */
import 'api.instance.dart';

/// 地址配置
final String baseUrl = 'http://192.168.11.209:8018/nem'; // api地址
final String mqttBase = '192.168.222.126:1883:admin:admin'; // 消息服务配置
String get baseUrlEMDC => ApiInstance.getInstance().mBaseUrlEMDC;
String _baseUrlEMDC = 'http://192.168.10.6:8087/scada';
String tokenEMDC = '';

final List mServiceConfigList = [
  {
    'typeCode': 0,
    'typeName': '内网',
    'baseUrl': baseUrl,
    'mqttStr': mqttBase,
    'baseUrlEMDC': _baseUrlEMDC,
  },
  {
    'typeCode': 1,
    'typeName': '外网',
    'baseUrl': 'http://60.172.168.234:8000/app',
    'mqttStr': '60.172.168.234:1883:admin:admin',
    'baseUrlEMDC': _baseUrlEMDC,
  },
  {
    'typeCode': 2,
    'typeName': '自定义',
    'baseUrl': baseUrl,
    'mqttStr': mqttBase,
    'baseUrlEMDC': _baseUrlEMDC,
  },
];

/// token
final String tokenStore = "token";

/// 用户信息
final String userInfoStore = "userinfo";

/// 工作中心
final String workCenterId = "workcenterid";
final String workCenterName = "workcenter";
final String workCenterInfoStore = "workcenterinfo";

/// APP信息
final String appInfoStore = "appinfo";

/// 串口状态
// final String ttysStatueStore = "ttysStatueInfo";
/// 打印机信息
final String printerInfoStore = "printerinfo";
final String printerName = "blueName";
final String printerAddress = "blueAddress";

/// 服务器配置
final String serverInfoStore = "serverinfo";

/// 保养工单对象
final String maintainOrderInfoStore = "maintainOrderInfo";

/// 维修工单对象
final String repairOrderInfoStore = "repairOrderInfo";

/// 工序预报工对象
final String procedurePreReportDetailStore = "procedurePreReportDetail";

/// 工序最终报工对象
final String procedureFinReportDetailStore = "procedureFinReportDetail";

/// 产线类型
final String procedureListTypeStore = "procedureListType";
