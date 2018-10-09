import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tab_demo/page/page_1.dart';
import 'package:tab_demo/page/page_2.dart';
import 'package:tab_demo/page/page_3.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book), title: Text('Book')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), title: Text('Setting')),
        ]),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return switchPage(index);
            },
          );
        });
  }

  Widget switchPage(int index) {
    switch (index) {
      case 0:
        return Page1();
        break;
      case 1:
        return Page2();
        break;
      case 2:
        return Page3();
        break;
    }
  }
}
