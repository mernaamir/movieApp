import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WatchListWidget extends StatelessWidget {
  //backdrop_path
  //release_date
  //original_title
  String title;
  String date;
  String subtitle;
  String imagePath;
  WatchListWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: 140.w,
          height: 102.h,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                ),
              ),
              SvgPicture.asset(
                "assets/images/bookmark.svg",
                width: 27.w,
                height: 36.h,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall,),
            Text(date, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium,),
            Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall,),
          ],
        )
      ],
    );
  }
}
