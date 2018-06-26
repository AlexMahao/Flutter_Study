import 'package:flutter/material.dart';
import 'package:flutter_app/pages/net_page.dart';
import 'package:flutter_app/pages/stateless_page.dart';
import 'package:flutter_app/pages/ui_page.dart';

import './pages/home_page.dart';


void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
    routes: <String, WidgetBuilder>{
      PageList.UI_PAGE:
          (BuildContext context) => new UIPage(),
      PageList.STATELESS_PAGE:
          (BuildContext context) => new StatelessPage(),
      PageList.NET_PAGE:
          (BuildContext context) => new NetPage(),
    },
  ));
}

class PageList {
  static const String UI_PAGE = "ui_page";
  static const String STATELESS_PAGE = "stateless_page";
  static const String NET_PAGE = "net_page";
}