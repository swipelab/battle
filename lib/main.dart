import 'package:app/app.dart';
import 'package:app/services/services.dart';
import 'package:app/widgets/splash.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    FutureBuilder(
      future: App.initProduction(),
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
      title: 'Battle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: Router(
        routerDelegate: App.get<History>(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
