import 'package:flutter/material.dart';
import 'package:movie_app/features/search/widgets/movies_search.dart';
import 'package:movie_app/features/search/widgets/search_MovieItem.dart';
import 'package:movie_app/features/search/widgets/search_Widget.dart';

class SearchTab extends StatelessWidget {
  MoviesSearch vm = MoviesSearch();

  SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Expanded(
              child: (vm.movies.isEmpty)
                  ? Column(
                children: [
                  searchWidget(),
                  const SizedBox(
                    height: 200,
                  ),
                  Image.asset('assets/images/search_body.png'),
                  const SizedBox(height: 20),
                  Text(
                    vm.searchQuery.isEmpty
                        ? "Type keyword to search for"
                        : "No Movies Found",
                    style: const TextStyle(
                        fontSize: 15, color: Color(0xff514F4F)),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
                  : Column(
                children: [
                  searchWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => SearchMovieItem(
                        model: vm.movies[index],
                      ),
                      itemCount: vm.movies.length,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
