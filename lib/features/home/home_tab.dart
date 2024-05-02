import 'package:flutter/material.dart';
import 'package:movie_app/features/home/release_item.dart';
import 'package:movie_app/features/home/topRated_item.dart';
import 'package:movie_app/features/home/widgets/popular_movieWidget.dart';

class homeTab extends StatelessWidget {
  homeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularViewWidget(),
          SizedBox(
            height: 24,
          ),
          ReleaseItem(),
          SizedBox(
            height:24 ,
          ),
          topRatedItem(),
      
        ],
      ),
    );
  }
}
