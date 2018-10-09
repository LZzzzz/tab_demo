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
  var tabImages;
  int _tabIndex = 0;
  var appBarTitles = ['Home', 'Find', 'Setting'];

  @override
  Widget build(BuildContext context) {
    initData();
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)),
            BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)),
            BottomNavigationBarItem(
                icon: getTabIcon(2),
                title: getTabTitle(2)),
          ],
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
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

  //根据选择获得对应的normal或是press的icon
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  //获取bottomTab的颜色和文字
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xFF00D145)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }


    void initData() {
      //初始化选中和未选中的icon
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ]
      ];
    }

    /*
   * 根据image路径获取图片
   */
    Image getTabImage(path) {
      return new Image.asset(path, width: 20.0, height: 20.0);
    }
  }
