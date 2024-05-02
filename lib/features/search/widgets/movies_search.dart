import 'package:flutter/material.dart';
import 'package:movie_app/features/search/widgets/search_MovieItem.dart';
// import 'package:movie_app/models/Response_Model.dart';
import 'package:movie_app/models/SearchResponse.dart';
import 'package:movie_app/models/result_model.dart';

import '../../../core/api/api_manager.dart';
// import '../../../models/Movie_modelPouplar.dart';

class MoviesSearch extends SearchDelegate {
  String _searchQuery = '';
  List<Results> _movies = [];

  String get searchQuery => _searchQuery;

  List<Results> get movies => _movies;


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: const Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.close),
    );
  }

  @override
 Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.search(query: query),
        builder: (BuildContext context, AsyncSnapshot<SearchResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError ) {
            return Column(
              children: [
                Text("error"),
              ],
            );
          }
          List movies = snapshot.data?.results ?? [];

          return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => SearchMovieItem(
                  model: movies[index],
                ),
                itemCount: movies.length,
                padding: EdgeInsets.zero,
              ),
          );
        }
    );
  }
  // Widget buildResults(BuildContext context) {
  //   getMovies(String query) async {
  //     _searchQuery = query;
  //
  //     try {
  //       var response = await ApiManager.search(query: query);
  //       _movies = response.results!;
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //   }
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Navigator.pop(context);
  //   });
  //
  //   return const Column(
  //     children: [
  //       Expanded(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Center(
  //               child: CircularProgressIndicator(
  //                 color: Color(0xffB5B4B4),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.white);
}
