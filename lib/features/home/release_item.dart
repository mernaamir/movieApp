
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/routes/routes.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/widgets/movie_item_widget.dart';
class ReleaseItem extends StatelessWidget {
  const ReleaseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.release,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15.h,
          ),
          FutureBuilder(
              future: ApiManager.fetchNewReleases(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.main,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Text(
                      textAlign: TextAlign.center, AppStrings.error);
                }
                var releaseResults = snapshot.data?.results ?? [];
                if (releaseResults.isEmpty) {
                  return const Text(
                      textAlign: TextAlign.center, AppStrings.empty);
                }
                return SizedBox(
                  height: 127.74.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, AppRoutes.onGenerate(RouteSettings(name: RoutesName.detailsScreen, arguments: releaseResults[index].id)));
                          },
                        child: SizedBox(
                          width: 96.87.w,
                          child: MovieItemWidget(
                            movieImage: releaseResults[index].backdropPath ?? "",
                          ),
                        ),
                      );
                    },
                    itemCount: releaseResults.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 14,
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

