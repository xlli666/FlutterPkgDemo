/// 前端页面传数据 put-get
class Bundle {
  Map<String, dynamic> _map = {};
  _setValue(var k, var v) => _map[k] = v;
  _getValue(String k) {
    if (!_map.containsKey(k)) {
      return null;
      // throw Exception("你使用$k在payload不存在，请检查你的key名字是否正确，或确定key是否存在payload");
    }
    return _map[k];
  }

  putInt(String k, int v) => _setValue(k, v);
  putString(String k, String v) => _setValue(k, v);
  putBool(String k, bool v) => _setValue(k, v);
  putList<V>(String k, List<V> v) => _setValue(k, v);
  putMap<K, V>(String k, Map<K, V> v) => _setValue(k, v);

  int getInt(String k) => _getValue(k) as int;
  String getString(String k) => _getValue(k) as String;
  bool getBool(String k) => _getValue(k) as bool;
  List getList<V>(String k) => _getValue(k) as List;
  Map getMap<K, V>(String k) => _getValue(k) as Map;

  /// 检验是否包含key
  bool checkKey(String k) {
    if (!_map.containsKey(k)) {
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return _map.toString();
  }
}
