import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:reflectable/reflectable.dart';
import 'main.reflectable.dart';
import 'package:flutter_organized_widgets/grid/simple_2D_canvas.dart';
import 'package:flutter_organized_widgets/model/lib_stuff.dart';
import 'package:flutter_organized_widgets/model/meta_model.dart';
import 'package:flutter_organized_widgets/converter.dart';
import 'package:flutter_organized_widgets/test.dart';

void main() {
  initializeReflectable(); // Set up reflection support.

  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<MetaModel> models;

  MetaConverter converter = MetaConverter();
  @override
  void initState() {
    super.initState();
    List<ClassMirror> it = reflector.annotatedClasses.toList();
    models = converter.convertReflectionToModels(it);
  }
  
  Map<String, CanvasWidget> get canvasWidgets {
    var it = 0.0;
    var lol = 0;
    return Map.fromIterable(models.map((metaModel) {
      it += 300.0;
      return CanvasWidget(
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(metaModel.name),
            ...metaModel.attributes.map((it) => Text("${it.type} ${it.name}")).toList(),
            metaModel.generator(),
          ],
        )),
        size: metaModel.size,
        position: Offset(it, 0),
      );
    }), key: (_)  {
      lol++;
      return lol.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Simple2DCanvas(
        widgets: canvasWidgets,
      ),
    );
  }

}

