import 'package:flutter/material.dart';
import 'package:movie_app/features/search/widgets/movies_search.dart';

class searchWidget extends StatelessWidget {
  const searchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: MoviesSearch(),
        );
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xff514F4F).withOpacity(0.5),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Search",
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
