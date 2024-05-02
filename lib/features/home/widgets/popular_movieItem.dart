import 'package:flutter/material.dart';
import 'package:movie_app/config/routes/routes.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/models/result_model.dart';

class PopularMovieItem extends StatelessWidget {
  Results result;
  PopularMovieItem({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    var image =result.backdropPath ?? "";
    var imagee =result.posterPath ?? "";
    print(AppImages.baseUrl +image);
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.detailsScreen,
                    arguments: result,
                  );
                },
                child: Container(
                  width: width,
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "${AppImages.baseUrl}${result.backdropPath}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.asset("assets/images/play-button.png"),
                ),
              ),
              Positioned(
                bottom: -20,
                left: 20,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.detailsScreen,
                              arguments: result,
                            );
                          },
                          child: Image.network(
                            "${AppImages.baseUrl}${result.posterPath}",
                            width: 140,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            result.originalTitle ?? "",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
