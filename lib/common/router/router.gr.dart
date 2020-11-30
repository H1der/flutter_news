// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../pages/application/application.dart';
import '../../pages/details/details.dart';
import '../../pages/index/index.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/welcome/welcome.dart';
import '../entitys/entitys.dart';
import 'auth_guard.dart';
import 'router.dart';

class Routes {
  static const String indexPage = '/';
  static const String welcomePage = '/welcome-page';
  static const String signInPage = '/sign-in-page';
  static const String signUpPage = '/sign-up-page';
  static const String applicationPage = '/application-page';
  static const String detailsPage = '/details-page';
  static const all = <String>{
    indexPage,
    welcomePage,
    signInPage,
    signUpPage,
    applicationPage,
    detailsPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
    RouteDef(Routes.applicationPage,
        page: ApplicationPage, guards: [AuthGuard]),
    RouteDef(Routes.detailsPage, page: DetailsPage, guards: [AuthGuard]),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(),
        settings: data,
      );
    },
    WelcomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomePage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    SignUpPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
    ApplicationPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ApplicationPage(),
        settings: data,
      );
    },
    DetailsPage: (data) {
      final args = data.getArgs<DetailsPageArguments>(
        orElse: () => DetailsPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(
          key: args.key,
          item: args.item,
        ),
        settings: data,
        transitionsBuilder: zoomInTransition,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  final NewsItem item;

  DetailsPageArguments({this.key, this.item});
}
