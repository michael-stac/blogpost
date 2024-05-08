
import 'package:blogapp/src/blog/screens/blog_page.dart';
import 'package:blogapp/utilities/appcolors.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {


  bool isLoading = true;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation; // Animation for color

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));

    // Tween for color animation
    _colorAnimation = ColorTween(
      end: Colors.yellow,
      begin: AppColor.red,
    ).animate(_controller);



    _controller.forward().whenComplete(() {
      setState(() {
        isLoading = false;
      });
      Future.delayed(const Duration(seconds: 3), () async {
        nextPageAndRemovePrevious(context, page:  HomePageScreen());

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 98, right: 98, top: 16),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5, // Adjust the height of the loading bar
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width * _controller.value,
                        height: 5, // Adjust the height of the loading bar
                        decoration: BoxDecoration(
                          color: _colorAnimation.value, // Use animated color
                          borderRadius: BorderRadius.circular(50), // Make it circular
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

