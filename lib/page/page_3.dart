import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tab_demo/item.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        child: Container(
            color: Color(0xFFEFEFF4),
            child: CustomScrollView(slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text('Setting'),
              ),
              SliverSafeArea(
                  top: false,
                  sliver: SliverList(
                    delegate: new SliverChildListDelegate(<Widget>[
                      SettingsItem(
                        label: 'Airplane Mode',
                        iconAssetLabel: 'airplane',
                        type: SettingsItemType.toggle,
                      ),
                      SettingsItem(
                        label: 'Wi-Fi',
                        iconAssetLabel: 'wifi',
                        type: SettingsItemType.modal,
                        value: 'Airport Free',
                        hasDetails: true,
                      ),
                      SettingsItem(
                        label: 'Bluetooth',
                        iconAssetLabel: 'bluetooth',
                        type: SettingsItemType.modal,
                        value: 'On',
                        hasDetails: true,
                      ),
                      SettingsItem(
                        label: 'Cellular',
                        iconAssetLabel: 'cellular',
                        type: SettingsItemType.modal,
//                        onPress: () {
//                          Navigator.of(context).push(MaterialPageRoute(
//                              builder: (BuildContext context) {
//                            return Page3();
//                          }));
//                        },
                        hasDetails: true,
                      )
                    ]),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  )
            ])));
  }
}
