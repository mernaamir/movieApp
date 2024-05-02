
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/app_images.dart';

class MovieItemWidget extends StatelessWidget {
  String movieImage;
  MovieItemWidget({
    super.key,
    required this.movieImage
  });

  @override
  Widget build(BuildContext context) {
    if (movieImage != "") {
      movieImage = AppImages.baseUrl + movieImage;
    }
    return SizedBox(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: NetworkImage(movieImage), fit: BoxFit.cover),
            ),
          ),
          SvgPicture.asset(
            AppImages.bookmarkAdd,
            width: 27.w,
            height: 36.h,
          ),
        ],
      ),
    );
  }
}