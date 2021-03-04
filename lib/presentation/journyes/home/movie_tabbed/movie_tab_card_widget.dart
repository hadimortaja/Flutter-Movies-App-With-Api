import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';
import 'package:movies_app_api/common/extensions/string_extensions.dart';
import 'package:movies_app_api/data/core/api_constants.dart';
import 'package:movies_app_api/presentation/journyes/movie_details/movie_detail_screen.dart';
import 'package:movies_app_api/presentation/journyes/movie_details/movie_details_arguments.dart';


class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title,posterPath;

  const MovieTabCardWidget({Key key,@required this.movieId,@required this.title,@required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(
                      movieDetailArguments: MovieDetailArguments(movieId))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(imageUrl:'${ApiConstants.BASE_IMAGE_URL}$posterPath' ,
            fit: BoxFit.cover,
            ),
          )),
          Padding(padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Text(
            title.intelliTrim(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
