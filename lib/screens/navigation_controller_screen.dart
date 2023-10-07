import 'package:flutter/material.dart';
import 'package:skeuo_music/models/navigation_entry.dart';
import 'package:skeuo_music/screens/albums_screen.dart';
import 'package:skeuo_music/screens/interprets_screen.dart';
import 'package:skeuo_music/screens/lists_screen.dart';
import 'package:skeuo_music/screens/more_screen.dart';
import 'package:skeuo_music/screens/titles_screen.dart';
import 'package:skeuo_music/widgets/inherited/appbar_controller.dart';

class NavigationControllerScreen extends StatefulWidget {
  const NavigationControllerScreen({super.key});

  @override
  State<NavigationControllerScreen> createState() =>
      _NavigationControllerScreenState();
}

class _NavigationControllerScreenState
    extends State<NavigationControllerScreen> {
  final _navigationEntries = <NavigationEntry>[
    NavigationEntry(
      label: "Lists",
      iconData: Icons.queue_music,
      screen: const ListsScreen(),
    ),
    NavigationEntry(
      label: "Interprets",
      iconData: Icons.record_voice_over,
      screen: const InterpretsScreen(),
    ),
    NavigationEntry(
      label: "Titles",
      iconData: Icons.music_note,
      screen: const TitlesScreen(),
    ),
    NavigationEntry(
      label: "Albums",
      iconData: Icons.library_music,
      screen: const AlbumsScreen(),
    ),
    NavigationEntry(
      label: "More",
      iconData: Icons.more_horiz,
      screen: const MoreScreen(),
      customLeading: TextButton(
        onPressed: () {},
        child: const Text(
          "Edit",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    ),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentEntry = _navigationEntries[currentPageIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: StreamBuilder<String>(
          stream: AppBarController.of(context)?.appPropertiesBloc.appTitle,
          builder: (context, snapshot) =>
              Text(snapshot.data ?? _navigationEntries.first.label),
        ),
        leading: currentEntry.customLeading ??
            TextButton(
              onPressed: () {},
              child: const Text(
                "Store",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "You\n playing",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
      body: <Widget>[
        ..._navigationEntries.map((entry) => entry.screen),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          final entry = _navigationEntries[index];

          final appBarController = AppBarController.of(context);
          appBarController?.appPropertiesBloc.newTitle(entry.label);

          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          ..._navigationEntries.map(
            (entry) => NavigationDestination(
                icon: Icon(entry.iconData), label: entry.label),
          )
        ],
        selectedIndex: currentPageIndex,
      ),
    );
  }
}
