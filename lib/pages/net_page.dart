import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


class NetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        // todo toast
        print(json);
        var data = JSON.decode(json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: () {
                getData();
              },
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> getData() {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true, // false表示必须点击按钮才能关闭
        child: new ShowProgress(
            _getIPAddress()) //将网络请求的方法_postData作为参数传递给ShowProgress显示对话框
    );
  }
}

class ShowProgress extends StatefulWidget {
  ShowProgress(this.requestCallback);

  final Future requestCallback; //这里Null表示回调的时候不指定类型

  @override
  _ShowProgressState createState() => new _ShowProgressState();
}

class _ShowProgressState extends State<ShowProgress> {
  @override
  initState() {
    super.initState();
    print("_ShowProgressState");
    // 控件被创建时
    widget.requestCallback.then((Null) { //这里Null表示回调的时候不指定类型
      Navigator.of(context).pop(); //所以pop()里面不需要传参,这里关闭对话框并获取回调的值
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(), //获取控件实例
    );
  }
}