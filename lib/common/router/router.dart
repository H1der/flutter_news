import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/router/auth_guard.dart';
import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/details/details.dart';
import 'package:flutter_news/pages/index/index.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: IndexPage, initial: true),
    MaterialRoute(page: WelcomePage),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: ApplicationPage, guards: [AuthGuard]),
    MaterialRoute(page: DetailsPage, guards: [AuthGuard]),
  ],
)
class $AppRouter {}
