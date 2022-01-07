import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pura/HomeScreen.dart';
import 'package:pura/menu.dart';

import 'login.dart';
class Dashboard extends StatefulWidget {
  final pageIndex;
  final param;
  final title;
  Dashboard({Key? key, this.pageIndex, this.param, this.title}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
final _drawerController = ZoomDrawerController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.Style1,
      menuScreen: Menu(),
      mainScreen: HomeScreen(controller:_drawerController,pageIndex:widget.pageIndex, title: widget.title,param:widget.param),
      borderRadius: 24.0,
      showShadow: true,
      angle: -4.0,
      backgroundColor: Colors.grey[300]!,
      slideWidth: MediaQuery.of(context).size.width*.55,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    ),
     // drawer:ZoomDrawer.of(context).open()
    );
  }
}