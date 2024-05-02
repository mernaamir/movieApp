import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/widgets/video_widget.dart';
import 'package:movie_app/features/details/widgets/details.dart';
import 'package:movie_app/models/details_model.dart';

import '../../core/widgets/movie_item_Samilier.dart';
import '../../models/samilierResponse.dart';

class DetailsScreen extends StatelessWidget {
  Object? arguments;



   DetailsScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.details(arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.main,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Text(textAlign: TextAlign.center, AppStrings.error);
          }
          DetailsModel? result = snapshot.data ?? {} as DetailsModel;
          var videoImage = result.backdropPath ?? "";
          if (videoImage != "") {
            videoImage = AppImages.baseUrl + videoImage;
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  result.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Video Widget
                  VideoWidget(videoImagePath: videoImage),
                  /// Details of Movie
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.w),
                    child: Details(detailsModel: result),
                  ),
                  /// More Like this

                  FutureBuilder(future: ApiManager.getSamilier(arguments), builder: (context,snapshot){
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
                    var samilierList=snapshot.data?.results??[];
                    if (samilierList.isEmpty){
                      return Text("List is empty");
                    }
                    return  SizedBox(
                      height: 170,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context,index){
                          return SizedBox(
                                  width: 97.w,
                                  child: movieItemSamilier(result:samilierList[index] ,));
                        },itemCount: samilierList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 14,
                          );
                        },
                      ),
                    );
                  })
                ],
              ));
        });
  }
}
