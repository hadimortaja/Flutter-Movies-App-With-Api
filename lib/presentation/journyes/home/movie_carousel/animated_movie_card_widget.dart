import 'package:flutter/cupertino.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/screenUtil/screenutil.dart';
import 'package:movies_app_api/presentation/journyes/home/movie_carousel/movie_card_widget.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final PageController pageController;
  final int movieId;
  final String posterPath;

  const AnimatedMovieCardWidget(
      {Key key, this.index, this.pageController, this.movieId, this.posterPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - index;
            value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Curves.easeIn.transform(value)*ScreenUtil.screenHeight*0.35,
                width: Sizes.dimen_230.w,
                child: child,
              ),
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                                height: Curves.easeIn.transform(value)*ScreenUtil.screenHeight*0.35,

                width: Sizes.dimen_230.w,
                child: child,
              ),
            );
          }
        },
        child: MovieCardWidget(movieId: movieId, posterPath: posterPath));
  }
}
