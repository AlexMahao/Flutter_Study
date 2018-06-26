import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/ui_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 依然使用scaffold布局
      // scaffold 已经实现了appBar的位置，所以直接通过属性声明
      appBar: new AppBar(title: new Text("flutter")), // 构造Appbar对象
      body: new Container( // 一个常用的布局控件，其下包含一个子控件，能够声明padding,margin,decoration等等
        constraints: BoxConstraints.expand(), // 控件大小，尽可能的大
        decoration: new BoxDecoration(color: Colors.grey), // 背景
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(top: 20.0),
        child: new Column( // 列控件
          children: <Widget>[
            new RaisedButton( // 默认包含点击特效
              onPressed: () {
                // 页面跳转，
                Navigator.of(context).pushNamed(PageList.STATELESS_PAGE);
              },
              color: Colors.blue,
              child: new Text("无状页面展示",
                style: new TextStyle(color: Colors.white),),
            ),
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new RaisedButton(
                onPressed: () {
                  // 页面跳转
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) {
                        return new UIPage();
                      }));
                },
                color: Colors.blue,
                child: new Text("有状态页面展示",
                  style: new TextStyle(
                      color: Colors.white),),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PageList.NET_PAGE);
                },
                color: Colors.blue,
                child: new Text("网络请求",
                  style: new TextStyle(
                      color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}


