
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/routes/routes.dart';
import '../utils/app_images.dart';
import 'package:movie_app/models/result_model.dart';
import 'package:movie_app/features/home/detailsRecommended.dart';

class movieItemRecommended extends StatelessWidget{
  Results result;
  movieItemRecommended({super.key,required this.result});

  @override
  Widget build(BuildContext context) {
    var img=result.backdropPath??"";
    var image=AppImages.baseUrl+img;
    return
      Container(

        color: Color(0xffB5B4B4),
        height: 100.h,
        width: 110.w,
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96.87.w,
            height: 100.h,
            child: Stack(
              children: [
                Container(
                  // height: 500.h,
                  decoration: BoxDecoration(
                      // color: Colors.green,

                      image: DecorationImage(
                      image: NetworkImage(image),fit: BoxFit.fill
                    )
                  ),
                ),
                InkWell(
                  child: Container(
                    color: Colors.grey,
                      child: Icon(Icons.add,color: Colors.white,)),
                )
              ],

            ),


          ),
          SizedBox(height: 10,),
          // Text(result.voteAverage??""),
          Text(result.title??"", overflow: TextOverflow.ellipsis, maxLines: 1,),
          Text(result.releaseDate??"",textAlign: TextAlign.start,  overflow: TextOverflow.ellipsis, maxLines: 1,)
        ],
            ),
      );
  }
}