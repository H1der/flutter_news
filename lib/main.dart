import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/provider/provider.dart';
import 'package:flutter_news/common/router/auth_guard.dart';
import 'package:flutter_news/common/router/router.gr.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/pages/index/index.dart';
import 'package:flutter_news/routes.dart';
import 'package:provider/provider.dart';

// void main() => Global.init().then((value) => runApp(MyApp()));
void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
              ),
            ],
            child: Consumer<AppState>(builder: (context, appState, _) {
              if (appState.isGrayFilter) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                  child: MyApp(),
                );
              } else {
                return MyApp();
              }
            }),
          ),
        ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hider Learn Flutter Demo',
        builder: ExtendedNavigator<AppRouter>(
          initialRoute: Routes.indexPage,
          router: AppRouter(),
          guards: [AuthGuard()],
        ),
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
        home: IndexPage());
  }
}
