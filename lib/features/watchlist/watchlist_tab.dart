
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/watchlist/widgets/watchlist_item_widget.dart';
class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 27.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.label3, style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 14.51.h,),
                  Expanded(
                    child: ListView.separated(itemBuilder: (context,index) {
                      return WatchListWidget(title: 'Alita Battle Angel',subtitle: 'Rosa Salazar, Christoph Waltz', date: '2019', imagePath: "assets/images/Image.png",);
                    }, itemCount: 12, separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: AppColors.secondary,);
                    },),
                  ),
                ],
              ),
            ),
          )
    );
  }
}
