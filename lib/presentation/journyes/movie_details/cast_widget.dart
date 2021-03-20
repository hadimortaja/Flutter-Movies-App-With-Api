import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/data/core/api_constants.dart';
import 'package:movies_app_api/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app_api/common/extensions/size_extensions.dart';

class CastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastLoaded) {
        return Container(
          height: Sizes.dimen_100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final castEntity = state.casts[index];
              return Container(
                height: Sizes.dimen_100.h,
                width: Sizes.dimen_150.w,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_8.w, vertical: Sizes.dimen_4.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.dimen_8.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.w),
                          ),
                          child: CachedNetworkImage(
                              height: Sizes.dimen_100.h,
                              width: Sizes.dimen_150.w,
                              imageUrl:
                                  '${ApiConstants.BASE_IMAGE_URL}${castEntity.posterPath}'),
                        ),  
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: state.casts.length,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
