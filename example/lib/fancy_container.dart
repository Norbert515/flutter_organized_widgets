import 'package:flutter/material.dart';
import 'package:flutter_organized_widgets/model/lib_stuff.dart';

@reflector
class FancyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.indigo,
    );
  }
}


@reflector
@Defaults(
  [],
  positioned: {
    "color": Colors.red,
  },
)
class MyLoader extends StatelessWidget {

  const MyLoader({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color),
    );
  }
}

@reflector
@Defaults(
  [],
  positioned: {
    "title": "Hello there",
    "subtitle": "Yes you",
  },
)
class WidgetData extends StatelessWidget {

  const WidgetData({Key key, this.title, this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(16),
      width: 300,
      height: 250,
      child: Column(
        children: [
          Text(title),
          Text(subtitle),
        ],
      ),
    );
  }
}
