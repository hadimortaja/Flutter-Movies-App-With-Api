import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_api/common/constants/languages.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/constants/translation_constants.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';
import 'package:movies_app_api/common/extensions/String_extensions.dart';
import 'package:movies_app_api/presentation/app_localizations.dart';
import 'package:movies_app_api/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app_api/presentation/journyes/drawer/navigation_expanded_list_item.dart';
import 'package:movies_app_api/presentation/journyes/drawer/navigation_list_item.dart';
import 'package:movies_app_api/presentation/widgets/logo.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4)
      ]),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.h,
                right: Sizes.dimen_8.h,
              ),
              child: Logo(
                height: Sizes.dimen_10.h,
              ),
            ),
            NavigationListIem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {},
            ),
            NavigationExpandedListItem(
                title: TranslationConstants.language.t(context),
                onPressed: (index) {
                  BlocProvider.of<LanguageBloc>(context)
                      .add(ToggleLanguageEvent(Languages.languages[index]));
                },
                children: Languages.languages.map((e) => e.value).toList()),
            NavigationListIem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {},
            ),
            NavigationListIem(
              title: TranslationConstants.about.t(context),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
