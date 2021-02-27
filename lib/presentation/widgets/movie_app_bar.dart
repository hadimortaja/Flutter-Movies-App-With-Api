import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/screenUtil/screenutil.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';
import 'package:movies_app_api/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
          Expanded(
              child: Logo(
            height: Sizes.dimen_14,
          )),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
