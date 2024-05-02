

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/api/api_manager.dart';

import '../../config/routes/routes.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/movieItemRecommended.dart';

class topRatedItem extends StatelessWidget{

  topRatedItem({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      color: AppColors.secondary,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Text("Recommended"),
          SizedBox(height: 10,),
          FutureBuilder(future: ApiManager.fetchRecommend(),
              builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.main,
                ),
              );
            }
            if(snapshot.hasError){
              return Text("something went error ");
            }
            var topRecommendList=snapshot.data?.results??[];
            if(topRecommendList.isEmpty){
              return Text("top recommend is empty");
            }
            return SizedBox(
              height: 186.h,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemBuilder: (context,index){
              return InkWell(onTap: (){
                Navigator.push(context, AppRoutes.onGenerate(RouteSettings(name: RoutesName.detailsScreen, arguments: topRecommendList[index].id)));


              },
                  child: SizedBox(
                      width: 97.w,
                      child: movieItemRecommended(result: topRecommendList[index],)));
              },itemCount: topRecommendList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 14,
                  );
                },
              ),
            );
          })

                ],
              ),
        );
  }
}








//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movie_app/core/api/api_manager.dart';
// import 'package:movie_app/core/utils/app_colors.dart';
// import 'package:movie_app/core/utils/app_strings.dart';
// import 'package:movie_app/core/widgets/movie_item_widget.dart';
// class topRatedItem extends StatelessWidget {
//   const topRatedItem({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.secondary,
//       padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 17.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             AppStrings.recommend,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           FutureBuilder(
//               future: ApiManager.fetchRecommend(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.main,
//                     ),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return const Text(
//                       textAlign: TextAlign.center, AppStrings.error);
//                 }
//                 var releaseResults = snapshot.data?.results ?? [];
//                 if (releaseResults.isEmpty) {
//                   return const Text(
//                       textAlign: TextAlign.center, AppStrings.empty);
//                 }
//                 return SizedBox(
//                   height: 127.74.h,
//                   child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return MovieItemWidget(
//                         results: releaseResults[index],
//                       );
//                     },
//                     itemCount: releaseResults.length,
//                     separatorBuilder: (BuildContext context, int index) {
//                       return const SizedBox(
//                         width: 14,
//                       );
//                     },
//                   ),
//                 );
//               }),
//         ],
//       ),
//     );
//   }
// }
//
