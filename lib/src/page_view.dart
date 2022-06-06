import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'page_loading.dart';
import 'style/airplane_header.dart';
import 'style/myx_theme.dart';
import 'style/status_bar.dart';
import 'util/navigator_util.dart';

_backBefore() {}

/// 通用视图页面
class MPage extends StatelessWidget {
  MPage({
    Key key,
    @required this.child,
    this.title = "",
    this.right,
    this.backgroundColor = const Color(0xFFf1f1f1),
    this.loading = false,
    this.enableAppBar = true,
    this.showBack = true,
    this.backInit = false,
    this.floatingActionButton,
    this.customAppBar,
    this.drawerKey,
    this.contentKey,
    this.endDrawer,
    this.drawer,
    this.backBefore = _backBefore,
    this.onRefresh,
    this.showNativeHeader = false,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  ///页面内容
  final Widget child;

  ///页面标题
  final String title;

  ///导航栏右侧内容
  final Widget right;

  ///自制顶部导航栏
  final Widget customAppBar;

  ///抽屉
  final Widget endDrawer;
  final Widget drawer;

  ///抽屉Key
  final GlobalKey drawerKey;

  ///页面主体Key
  final GlobalKey contentKey;

  ///浮动按钮
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  ///加载状态
  final bool loading;

  ///显示返回按钮
  final bool showBack;

  ///启用顶部导航栏
  final bool enableAppBar;

  ///后退传参（用于前一个页面判断是否更新数据）
  final bool backInit;

  ///背景色
  final Color backgroundColor;

  ///后退之前
  final void Function() backBefore;

  ///刷新页面
  final Future Function() onRefresh;

  ///启用原始刷新头部
  final bool showNativeHeader;

  ///后退逻辑 -- TODO 待修改
  final void Function(BuildContext, bool) goBack = (BuildContext context, isInit) => {
    $Router.back(context, init: isInit)
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        //增加一个点击事件，使得点击APP空白处收起软键盘
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          floatingActionButton: !loading ? floatingActionButton : null,
          floatingActionButtonLocation: floatingActionButtonLocation ?? null,
          backgroundColor: backgroundColor,
          extendBody: true,
          endDrawer: endDrawer,
          drawer: drawer,
          drawerEdgeDragWidth: 0,
          body: PageViewContent(
            child: child,
            key: contentKey,
            loading: loading,
            enableAppBar: enableAppBar,
            onRefresh: onRefresh,
            showNativeHeader: showNativeHeader,
          ),
          appBar: enableAppBar ? customAppBar == null ? PreferredSize(
            preferredSize: Size(maxWidth, 50.0),
            child: AppBar(
              actions: <Widget>[
                Container(
                  child: right,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 15.0,),
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.blue,
              leading: showBack ? InkWell(
                onTap: () => goBack(context, backInit),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ) : Container(),
              title: Text(
                title,
              ), //设置标题
              elevation: 0.0, //设置阴影辐射范围
            ),
          ) : customAppBar : null,
        ),
      ),
    );
  }
}

class PageViewContent extends StatefulWidget {
  PageViewContent({
    Key key,
    this.child,
    this.loading,
    this.enableAppBar,
    this.onRefresh,
    this.showNativeHeader,
  }) : super(key: key);

  ///页面内容
  final Widget child;

  ///加载状态
  final bool loading;

  ///启用顶部导航拦
  final bool enableAppBar;

  ///刷新页面
  final Future Function() onRefresh;

  ///启用原始刷新头部
  final bool showNativeHeader;

  @override
  _PageViewContentState createState() => _PageViewContentState();
}

class _PageViewContentState extends State<PageViewContent> {

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(),
      child: Stack(
        fit: StackFit.expand,
        children: widget.enableAppBar ? <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: widget.child,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedSwitcher(
              transitionBuilder: (child, anim) {
                return FadeTransition(child: child, opacity: anim);
              },
              duration: Duration(milliseconds: 300),
              child: widget.loading ? PageLoading() : Container(),
            ),
          ),
        ] : [
          EasyRefresh(
            onRefresh: () async {
              if (widget.onRefresh != null) {
                await widget.onRefresh();
              }
            },
            header: widget.showNativeHeader ? MaterialHeader() : FlyHeader(),
            footer: BezierBounceFooter(),
            child: widget.child,
          ),
          StatusBarGray(),
        ],
      ),
    );
  }
}
