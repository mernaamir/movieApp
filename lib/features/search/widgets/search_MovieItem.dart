import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/models/result_model.dart';

import '../../../config/routes/routes.dart';

class SearchMovieItem extends StatelessWidget {
  final Results model;

  const SearchMovieItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutesName.detailsScreen,
              arguments: model,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 90,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 90,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${AppImages.baseUrl}${model.posterPath}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.title!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: const Divider(
            height: 2,
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
