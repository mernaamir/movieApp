
class Endpoints {
  static const String version="/3/";
  /// phase 1 - 1: home screen
  // --- popular
  static const String popular = "${version}movie/popular";
  // --- New releases: Upcoming
  static const String upcoming = "${version}movie/upcoming";
  // --- top rated
  static const String topRated = "${version}movie/top_rated";
  /// phase 1 - 2: Movie details
  static const String details = "${version}movie/";
  static const String moreLikeThis = "${version}movie";
  /// phase 2 - 1: Search
  static const String search = "${version}search/movie";
 /// phase 2- 2: Browse Categories Screen:
  static const String movieList = "${version}genre/movie/list";
  static const String discover = "${version}discover/movie";
}