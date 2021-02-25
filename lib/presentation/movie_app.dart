import 'package:flutter/material.dart';
import 'package:movies_app_api/common/screenUtil/screenutil.dart';
import 'package:movies_app_api/presentation/themes/app_color.dart';
import 'package:movies_app_api/presentation/themes/theme_text.dart';

import 'journyes/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0)
      ),
      home: HomeScreen(),
    );
  }
}
