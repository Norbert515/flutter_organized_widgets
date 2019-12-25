import 'package:flutter/material.dart';

import 'model/lib_stuff.dart';

@reflector
@Defaults([], positioned: {

})
class TestWidget extends StatelessWidget {

  const TestWidget({Key key, this.test}) : super(key: key);

  final bool test;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Icon(Icons.add),
    );
  }
}
