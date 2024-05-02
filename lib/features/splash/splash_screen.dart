import 'package:flutter/material.dart';
import 'package:movie_app/config/routes/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(RoutesName.homeApp);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Container(
            height: 195,
            width: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/movies.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
