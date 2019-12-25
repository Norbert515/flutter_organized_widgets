import 'package:flutter/material.dart';

typedef MetaWidgetGenerator = Widget Function();


class MetaModel {

  final MetaWidgetGenerator generator;
  final Size size;
  final List<Attrib> attributes;
  final String name;

  MetaModel({@required this.generator, this.size = const Size(400, 400), this.attributes, this.name});

}


class Attrib {
  final String name;
  final String type;

  Attrib({this.name, this.type});
}