import 'package:flutter/material.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/pages/index/index.dart';
import 'package:flutter_news/routes.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hider Learn Flutter Demo',
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
        home: IndexPage());
  }
}
