import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';
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
              title: "Favorite Movies",
              onPressed: () {},
            ),
            NavigationExpandedListItem(
                title: 'Language',
                onPressed: () {},
                children: ['English', 'العربية']),
            NavigationListIem(
              title: "Feedback",
              onPressed: () {},
            ),
            NavigationListIem(
              title: "About",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
