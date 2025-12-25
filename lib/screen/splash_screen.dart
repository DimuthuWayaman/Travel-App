import 'package:flutter/material.dart';
import 'package:travel_app/const/colors.dart';

import '../nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/splashbg2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 150),
                Center(
                  child: Text(
                    "Welcome to TravelApp",
                    style: TextStyle(
                      color: MyTheme.blackColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text(
                    "Find places and Explore your favorite places with us",
                    style: TextStyle(color: MyTheme.textColor, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                            NavBar(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final curved = CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          );
                          final offsetTween = Tween<Offset>(
                            begin: const Offset(0.0, 1.0),
                            end: Offset.zero,
                          );
                          return SlideTransition(
                            position: offsetTween.animate(curved),
                            child: FadeTransition(
                              opacity: curved,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    child: Center(child: Text("Get Started", style: TextStyle(
                      color: MyTheme.whiteColor,
                      fontSize: 18,
                    ))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
