import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';

class NavigationListIem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationListIem(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //       color: Theme.of(context).primaryColor.withOpacity(0.7),
        //       blurRadius: 2)
        // ]),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

class NavigationSubListIem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationSubListIem(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //       color: Theme.of(context).primaryColor.withOpacity(0.7),
        //       blurRadius: 2)
        // ]),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

