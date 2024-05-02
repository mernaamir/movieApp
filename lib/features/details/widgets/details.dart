import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/widgets/movie_item_widget.dart';
import 'package:movie_app/models/details_model.dart';
import '../../../core/utils/app_images.dart';

class Details extends StatelessWidget {
  DetailsModel detailsModel;
  Details({super.key, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    var posterImage = detailsModel.posterPath ?? "";
    if (posterImage != "") {
      posterImage = AppImages.baseUrl + posterImage;
    }
    var genresList = detailsModel.genres ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Movie title
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(detailsModel.originalTitle ?? "", style: Theme.of(context).textTheme.bodyLarge,),
        ),
        /// Release date - Runtime
        Text(
            "${detailsModel.releaseDate ?? ""}   ${(detailsModel.runtime)} min", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.textSecondary),),
        SizedBox(
          height: 20.h,
        ),
        /// poster - overview - vote average
        Row(
          children: [
            SizedBox(
              width: 129.w,
              height: 228.h,
              child: MovieItemWidget(movieImage: posterImage),
            ),
            Container(
              margin: EdgeInsets.only(left: 11.w),
              width: 228.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8.0.w, // Horizontal spacing between children
                    runSpacing: 3.0.h,
                    children:
                    genresList!.map((item) => genresWidget(item: item, context: context)).toList(),
                  ),
                  SizedBox(height: 10.h,),
                  /// Overview
                  Text(detailsModel.overview ?? "",style: Theme.of(context).textTheme.bodyMedium,),
                  /// Rate
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 30,
                        color: AppColors.yellow,
                      ),
                      Text(detailsModel.voteAverage.toString(), style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontFamily: 'Poppins'),),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
  Container genresWidget({item, context}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 6.5.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        item.name ?? "",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
