import 'dart:async';

class AppPropertiesBloC {

  final StreamController<String> _appTitleController = StreamController<String>();

  Stream<String> get appTitle => _appTitleController.stream;

  void newTitle(String title) => _appTitleController.sink.add(title);

  void dispose() {
    _appTitleController.close();
  }
}
