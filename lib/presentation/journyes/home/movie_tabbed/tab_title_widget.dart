import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/presentation/themes/app_color.dart';
import 'package:movies_app_api/presentation/themes/theme_text.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget(
      {Key key, this.title, this.onTap, this.isSelected = false})
      : assert(title != null, 'title Should not be null'),
        assert(isSelected != null, 'isSelected Should not be null'),
        assert(onTap != null, 'onTap Should not be null'),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: isSelected ? AppColor.royalBlue : Colors.transparent,
                    width: Sizes.dimen_1.h))),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
