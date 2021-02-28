import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_api/common/constants/languages.dart';
import 'package:movies_app_api/common/screenUtil/screenutil.dart';
import 'package:movies_app_api/di/get_it.dart';
import 'package:movies_app_api/presentation/app_localizations.dart';
import 'package:movies_app_api/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app_api/presentation/themes/app_color.dart';
import 'package:movies_app_api/presentation/themes/theme_text.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'journyes/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Movie App",
              theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  accentColor: AppColor.royalBlue,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0)),
              supportedLocales:
                  Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: HomeScreen(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
