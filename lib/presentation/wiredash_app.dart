import 'package:flutter/material.dart';
import 'package:movies_app_api/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp(
      {Key key,
      @required this.navigatorKey,
      @required this.child,
      @required this.languageCode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'movies-app-6hlk1fv',
        secret: 'kb4lg74kkh8czvjlt3jul81iz05ny07ea2bidu4qg7u5scnf',
        options: WiredashOptionsData(
            locale: Locale.fromSubtags(languageCode: languageCode)),
        theme: WiredashThemeData(
            brightness: Brightness.dark,
            primaryColor: AppColor.royalBlue,
            secondaryColor: AppColor.violet,
            secondaryBackgroundColor: AppColor.vulcan,
            dividerColor: AppColor.vulcan),
        navigatorKey: navigatorKey,
        child: child);
  }
}
