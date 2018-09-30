import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = <String>['A', 'B', 'C', 'D', 'E', 'F'];
    Iterable<Widget> listTitles = items.map((String item) {
      //将items的内容设置给Adapter
      return itemBuilder(context, item);
    });
    listTitles = ListTile.divideTiles(context: context, tiles: listTitles);

    return new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("TabDemo"),
        ),
        child: Container(
            color: Color(0xFFEFEFF4),
            child: CustomScrollView(slivers: <Widget>[
              SliverSafeArea(
                top: true,
                sliver: SliverList(
                    delegate: new SliverChildListDelegate(
                  new List<Widget>.generate(items.length, (int i) {
                    return itemBuilder(context, items[i]);
                  }),
                )),
              )
            ])) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget itemBuilder(BuildContext context, String item) {
    return new Container(
      child: new Padding(
        padding:
            new EdgeInsets.only(left: 14.0, top: 7.0, right: 14.0, bottom: 7.0),
        child: Container(
          constraints: new BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          decoration: new BoxDecoration(
            color: Colors.grey,
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            image: new DecorationImage(
              image: new NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538309253112&di=94cf8cb904ea82bdd327e31771823f32&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D73874532%2C1523566867%26fm%3D214%26gp%3D0.jpg'),
              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: new Text(item,
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
