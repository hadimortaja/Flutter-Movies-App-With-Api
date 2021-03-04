import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/screenUtil/screenutil.dart';
import 'package:movies_app_api/common/extensions/num_extensions.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';

import 'package:movies_app_api/data/core/api_constants.dart';
import 'package:movies_app_api/domain/entities/movie_detail_entity.dart';
import 'package:movies_app_api/presentation/journyes/movie_details/movie_detail_app_bar.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ])),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ListTile(
              title: Text(movie.title, style: TextStyle(fontSize: 17)),
              subtitle: Text(movie.releaseDate,
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              trailing: Text(movie.voteAverage.convertToPercentageString()),
            )),
        Positioned(
            top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
            left: 16,
            right: 16,
            child: MovieDetailAppBar())
      ],
    );
  }
}
