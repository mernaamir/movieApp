import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/browse_tab.dart';
import 'package:movie_app/features/home/home_tab.dart';

import '../../features/search/search_tab.dart';
import '../../features/watchlist/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    homeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedLabelStyle: TextStyle(color: Colors.white),
            selectedLabelStyle: TextStyle(color: Color(0xffFFB224)),
            selectedItemColor: Color(0xffFFB224),
            unselectedItemColor: Colors.white,
            elevation: 0,
            type:BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1A1A1A),
            iconSize: 25,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/home.png"),
                  ),
                  label: "HOME"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/search.png"),
                  ),
                  label: "SEARCH"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/list.png"),
                  ),
                  label: "Browse"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/widget.png"),
                  ),
                  label: "Watchlist"),
            ]),
        body: tabs[index]);
  }
}
