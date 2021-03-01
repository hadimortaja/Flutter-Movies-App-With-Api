import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/extensions/string_extensions.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';

import 'package:movies_app_api/presentation/themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  Button({@required this.text, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColor.royalBlue, AppColor.violet]),
          borderRadius: BorderRadius.circular(Sizes.dimen_20.w)),
      child: FlatButton(
          onPressed: onPressed,
          child: Text(
            text.t(context),
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
