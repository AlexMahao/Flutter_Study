import 'package:flutter/material.dart'; // 导包


//void main() {
//  runApp(new MaterialApp( // 可以运用MaterialApp的样式 构造了基础的路由方式
//    home: new StatelessPage() // 创建布局
//  ));
//}

class StatelessPage extends StatelessWidget {
  // 基于flutter 一切都是控件的原理，我们自定义一个Widget来完成页面实现

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 基本布局框架，大部分使用该控件进行基本布局
        body: new Stack( // stack 可以允许其子widget简单的堆叠在一起
            children: <Widget>[
              new Align( // 可以将其子widget对齐，并可以根据子widget的大小自动调整大小。
                alignment: Alignment.center, // 属性
                child: getText("center"),
              ),
              new Align(
                alignment: Alignment.center,
                child: new GestureDetector( // 定义手势控件，提供一些默认回调方法。
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: new Icon(Icons.close),
                ),
              ),
              new Align(
                alignment: Alignment.topLeft,
                child: getText("topLeft"),
              ),
              new Align(
                alignment: Alignment.topCenter,
                child: getText("topCenter"),
              ),
              new Align(
                alignment: Alignment.topRight,
                child: getText("topRight"),
              ), new Align(
                alignment: Alignment.centerLeft,
                child: getText("centerLeft"),
              ),
              new Align(
                alignment: Alignment.centerRight,
                child: getText("centerRight"),
              ),
              new Align(
                alignment: Alignment.bottomCenter,
                child: getText("bottomCenter"),
              ),
              new Align(
                alignment: Alignment.bottomLeft,
                child: getText("bottomLeft"),
              ),
              new Align(
                alignment: Alignment.bottomRight,
                child: getText("bottomRight"),
              ),
            ]
        )
    );
  }

  Text getText(String title) {
    return new Text(title, style: new TextStyle(color: Colors.black));
  }
}