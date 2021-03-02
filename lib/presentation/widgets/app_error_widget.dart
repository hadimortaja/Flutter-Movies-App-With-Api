import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/translation_constants.dart';
import 'package:movies_app_api/common/extensions/string_extensions.dart';
import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app_api/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget(
      {Key key, @required this.errorType, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                  text: TranslationConstants.retry, onPressed:onPressed),
              Button(
                  text: TranslationConstants.feedback,
                  onPressed: () => Wiredash.of(context).show())
            ],
          )
        ],
      ),
    );
  }
}
