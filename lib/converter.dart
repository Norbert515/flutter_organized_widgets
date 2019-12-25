import 'package:flutter_organized_widgets/model/meta_model.dart';
import 'package:reflectable/reflectable.dart';
import 'package:flutter_organized_widgets/model/lib_stuff.dart';


class MetaConverter {


  List<MetaModel> convertReflectionToModels(List<ClassMirror> it) {
    return it.map((classMirror) {
      var metadata = classMirror.metadata;
      Defaults defaults = metadata.firstWhere((it) => it is Defaults, orElse: () => null);
      var name = classMirror.simpleName;
      MethodMirror mir = classMirror.declarations[name];
      List<Attrib> attributes = mir.parameters.map((it) => Attrib(name: it.simpleName, type: it.reflectedType.toString())).toList();
      if(defaults != null) {
        return MetaModel(
          generator: () {
            return classMirror.newInstance("", defaults.arguments, defaults.positioned.map((key, value) {
              return MapEntry(Symbol(key), value);
            }));
          },
          size: defaults.size,
          name: name,
          attributes: attributes,

        );
      }
      return MetaModel(
          generator: () {
            return classMirror.newInstance("", []);
          },
          name: name,
          attributes: attributes,
      );
    }).toList();
  }



}