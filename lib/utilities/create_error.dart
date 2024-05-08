import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../src/blog/screens/blog_page.dart';
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
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.edit_note_rounded,
        activeIcon: Icons.close,
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        activeBackgroundColor: AppColor.primaryColor,
        activeForegroundColor: Colors.white,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 10,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.accessible),
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
            label: 'create',
            labelStyle: const TextStyle(fontSize: 15.0),
            onTap: () {
              nextPage(context, page: const CreateNewBlogPost());
            },
          ),
          SpeedDialChild(
            child: Icon(MdiIcons.refresh),
            foregroundColor: Colors.white,
            backgroundColor: AppColor.primaryColor,
            label: 'Refresh',
            labelStyle: const TextStyle(fontSize: 15.0),
            onTap: () {
              nextPageAndRemovePrevious(context, page:  HomePageScreen());
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/error.png'),
            PageService.textSpaceL,

          ],
        ),
      ),
    );
  }
}
