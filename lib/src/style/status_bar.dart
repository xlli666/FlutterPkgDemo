import 'package:flutter/cupertino.dart';

import 'myx_theme.dart';

///* 父元素必须是Stack
class StatusBarGray extends StatelessWidget {
  const StatusBarGray({Key key}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      width: maxWidth,
      height: statusBarHeight,
      child: Container(
        width: maxWidth,
        height: statusBarHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(160, 70, 70, 70),
              Color.fromARGB(70, 70, 70, 70),
              Color.fromARGB(0, 70, 70, 70)
            ],
          ),
        ),
      ),
    );
  }
}
