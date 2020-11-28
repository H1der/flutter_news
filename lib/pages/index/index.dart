import 'package:flutter/material.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 734), allowFontScaling: false);

    return Scaffold(
      body: Global.isFirstOpen == true
          ? WelcomePage()
          : Global.isOffLineLogin == true
              ? ApplicationPage()
              : SignInPage(),
    );
  }
}
