import 'package:flutter/material.dart';

import 'package:skeuo_music/bloc/app_properties_bloc.dart';

class AppBarController extends InheritedWidget {

  final AppPropertiesBloC appPropertiesBloc = AppPropertiesBloC();

  AppBarController({ super.key, required super.child });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static AppBarController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppBarController>();
  }
}
