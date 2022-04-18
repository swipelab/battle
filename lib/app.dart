import 'package:app/pages/home/home_page.dart';
import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:stated/stated.dart';

class App {
  late Store _store;

  static App? _instance;

  static void back() => get<History>().popRoute();

  App.production() {
    WidgetsFlutterBinding.ensureInitialized();
    _store = Store()
      ..addLazy(FirebaseService.create)
      ..addLazy((e) async => History(HomePage()));
  }

  static Future<void> initProduction() {
    _instance = App.production();
    return _instance!._store.init();
  }

  static T get<T>() => _instance!._store.get<T>();

  static open(Page page) => _instance!._store.get<History>().openPage(page);
}

extension PageExtension<T> on Page<T> {
  open() => App.open(this);
}
