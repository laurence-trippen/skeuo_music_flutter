import 'package:flutter/material.dart';

class NavigationEntry {

  final String label;
  final IconData iconData;
  final Widget screen;

  NavigationEntry({ required this.label, required this.iconData, required this.screen });
}
