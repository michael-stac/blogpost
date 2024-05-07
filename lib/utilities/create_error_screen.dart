import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../src/blog/screens/create_blog_page.dart';
import 'appcolors.dart';
class CreateErrorScreen extends StatefulWidget {
  const CreateErrorScreen({super.key});

  @override
  State<CreateErrorScreen> createState() => _CreateErrorScreenState();
}

class _CreateErrorScreenState extends State<CreateErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: SpeedDial(
        onPress: () {
          nextPage(context, page: const CreateNewBlogPost());
        },
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        activeBackgroundColor: AppColor.primaryColor,
        activeForegroundColor: Colors.white,
        // buttonSize: size,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 10,
        shape: const CircleBorder(),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/error.png'),
              PageService.textSpaceL,
              Text("No Post Avaliable Kindky create", style: PageService.bigHeaderStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
