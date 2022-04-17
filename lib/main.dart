import 'package:app/app.dart';
import 'package:app/services/services.dart';
import 'package:app/widgets/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    FutureBuilder(
      future: App.instance.init(),
      builder: (context, data) => data.connectionState == ConnectionState.done
          ? const AppView()
          : const Splash('Loading...'),
    ),
  );
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Router(
        routerDelegate: App.get<History>(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
