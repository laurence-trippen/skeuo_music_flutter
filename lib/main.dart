import 'package:flutter/material.dart';
import 'package:skeuo_music/screens/navigation_controller_screen.dart';
import 'package:skeuo_music/widgets/inherited/appbar_controller.dart';

void main() {
  runApp(const SkeuoMusicApp());
}

class SkeuoMusicApp extends StatelessWidget {
  const SkeuoMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarController(
      child: MaterialApp(
        title: 'Skeuo Music',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NavigationControllerScreen(),
      ),
    );
  }
}
