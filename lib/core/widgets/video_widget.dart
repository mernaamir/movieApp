
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';

class VideoWidget extends StatelessWidget {
  String videoImagePath;
  VideoWidget({
    super.key,
    required this.videoImagePath
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 217.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(videoImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Image.asset(AppImages.playButton),
    );
  }
}
