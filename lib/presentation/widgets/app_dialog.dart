import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/constants/translation_constants.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';
import 'package:movies_app_api/common/extensions/string_extensions.dart';

import 'package:movies_app_api/presentation/themes/app_color.dart';
import 'package:movies_app_api/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.t(context),
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
            child: Text(
              description.t(context),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
          Button(
              text: TranslationConstants.okay,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
