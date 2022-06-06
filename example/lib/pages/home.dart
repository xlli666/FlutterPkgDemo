import 'package:example/routers/route_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myx_pkg/myx_pkg.dart';

class Home extends StatefulWidget {
  Home({Key key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MPage(
      title: 'HOME',
      child: Center(
        child: GestureDetector(
          child: Text('HOME - tap to about', style: TextStyle(color: Colors.blue),),
          onTap: () {
            $Router.push(context, RouterExample.about);
          },
        ),
      ),
    );
  }

}