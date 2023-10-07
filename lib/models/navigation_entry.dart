import 'package:flutter/material.dart';

class NavigationEntry {

  final String label;
  final IconData iconData;
  final Widget screen;
  final Widget? customLeading;

  NavigationEntry({ required this.label, required this.iconData, required this.screen, this.customLeading, });
}
