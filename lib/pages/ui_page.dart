import 'package:flutter/material.dart';


// 无状态 Widget
// StatelessWidget中可以包含StatefulWidget .

// 那么对于绘图树中，只需要检查StatefulWidget中，是否包含状态的变更，如果状态变更，重新构建他的控件对象。而State从某种角度来说是个永久对象，它里面存储了一些必要信息，
// 有状态Widget


//是否创建

class UIPage extends StatefulWidget {
  int num = 0;

  @override
  State<StatefulWidget> createState() {
    print("createState:${num}");
    return new _UIPageState();
  }
}

class _UIPageState extends State<UIPage> {
  int num = 0;
  int count = 0;

  @override
  initState() {
    print("build:${num}---count:${count}");
  }

  void add() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    num++;
    print("build:${num}");
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("计数器"),
      ),
//      body: new Column(
//        children: <Widget>[
//          new Text("点击次数：${count}"),
//          new _ClickButton()
//        ],
//      ),
      body: new Center(
          child: new Text("点击次数：${count}"),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            add();
          },
          child: new Icon(Icons.add)
      ),
    );
  }
}

class _ClickButton extends StatefulWidget {
  int num = 0;


  _ClickButton(){
    print("_ClickButton construct");
  }

  @override
  State<StatefulWidget> createState() {
    // 不一定每次都走，根据是否有setState标记，来进行布局重建。也就是说`StatefulWidget`只是为了一次显示，最终的状态保存是根据`State`
    num++;
    print("_ClickButton createState ${num}");
    return new _ClickButtonState();
  }
}

class _ClickButtonState extends State<_ClickButton> {

  int num = 0;

  _ClickButtonState(){
    print("_ClickButtonState construct");
  }

  @override
  initState() {
    print("_ClickButton initState");
  }

  void increase() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_ClickButton build");
    return new Center(
      child: new GestureDetector(
        onTap: () => increase(),
        child: new Text("点击次数：${num}"),
      ),
    );
  }
}

