import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/features/home/widgets/popular_movieItem.dart';

class PopularViewWidget extends StatelessWidget {

  const PopularViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchPopular(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went error"));
        }
        var popularList = snapshot.data?.results ?? [];
        if (popularList.isEmpty) {
          return Center(child: Text("No Data"));
        }
        return CarouselSlider.builder(
          itemBuilder: (context, index, r) => PopularMovieItem(
            result: popularList[index],
          ),
          itemCount: popularList.length,
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 12),
            viewportFraction: 1,
            height: 330,
            autoPlay: true,
          ),
        );
      },
    );
  }
}
