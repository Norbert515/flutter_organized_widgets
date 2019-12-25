// Annotate with this class to enable reflection.
import 'package:flutter/material.dart';
import 'package:reflectable/reflectable.dart';


class Reflector extends Reflectable {

  const Reflector()
      : super(invokingCapability, metadataCapability, uriCapability, declarationsCapability, typeRelationsCapability, reflectedTypeCapability); // Request the capability to invoke methods.
}


class Defaults {

  final List<dynamic> arguments;
  final Map<String, dynamic> positioned;
  final Size size;

  const Defaults(this.arguments, {this.positioned = const {}, this.size = const Size(400, 400)});
}

const reflector = const Reflector();
