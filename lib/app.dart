import 'package:app/pages/home/home_page.dart';
import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:stated/stated.dart';

class App with Resolver, AsyncInit {
  late Store _store;

  static App instance = App.production();

  App.production() {
    WidgetsFlutterBinding.ensureInitialized();
    _store = Store()
      ..addLazy(FirebaseService.create)
      ..addLazy((e) async => History(HomePage()));
  }

  @override
  Future<T> resolve<T>() => _store.resolve<T>();

  @override
  Future<void> init() => _store.init();

  static T get<T>() => instance._store.get<T>();

  static open(Page page) => instance._store.get<History>().openPage(page);
}

extension PageExtension<T> on Page<T> {
  open() => App.open(this);
}
