import 'package:flutter/material.dart';

class Webview extends StatefulWidget {
  String title;
  String param;
  Webview({Key? key,required this.title,required this.param}) : super(key: key);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
