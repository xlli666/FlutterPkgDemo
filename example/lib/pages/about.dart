import 'package:example/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myx_pkg/myx_pkg.dart';

class About extends StatefulWidget {
  About({Key key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<About> {

  @override
  void initState() {
    super.initState();
    _request();
  }

  @override
  Widget build(BuildContext context) {
    return MPage(
      title: 'ABOUT',
      child: Center(child: Text('ABOUT', style: TextStyle(color: Colors.black)),),
    );
  }

  _request() async {
    var resp = await BaseApi.dataList('/mc/120413');
    print(resp);
  }
}