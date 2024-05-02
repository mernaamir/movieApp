import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/browse_tab.dart';
import 'package:movie_app/features/details/details_screen.dart';
import 'package:movie_app/features/search/search_tab.dart';
import 'package:movie_app/features/splash/splash_screen.dart';
import 'package:movie_app/features/watchlist/watchlist_tab.dart';
import '../../features/browse/detailsDiscover.dart';
import '../../layout/home_app/home_screen.dart';

class RoutesName {
  static const String homeApp = "homeApp";
  static const String splash = "splash";
  static const String detailsScreen = "details";
  static const String homeTab = "home";
  static const String searchTab = "search";
  static const String watchListTab = "watchList";
  static const String browseTab = "browse";
  static const String detailsDiscover = "detailsDiscover";


}

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
        case RoutesName.homeApp:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.searchTab:
        return MaterialPageRoute(builder: (context) => SearchTab());
      case RoutesName.watchListTab:
        return MaterialPageRoute(builder: (context) => WatchListTab());
      case RoutesName.browseTab:
        return MaterialPageRoute(builder: (context) => BrowseTab());
      case RoutesName.detailsDiscover:
        return MaterialPageRoute(builder: (context) => detailsDiscover());
      case RoutesName.detailsScreen:
        final arguments = settings.arguments;
        return MaterialPageRoute(builder: (context) => DetailsScreen(arguments: arguments));
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Scaffold(
      body: Center(child: Text("Route Not Found")),
    );
  }
}
