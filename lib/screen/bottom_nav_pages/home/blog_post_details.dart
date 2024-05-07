import 'package:blogapp/shared_services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../utilities/appcolors.dart';

class BlogDetailsPost extends StatefulWidget {
  const BlogDetailsPost({super.key});

  @override
  State<BlogDetailsPost> createState() => _BlogDetailsPostState();
}

class _BlogDetailsPostState extends State<BlogDetailsPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title:  Text("Blog Post Title", style: PageService.headerStyle,),),
      floatingActionButton: SpeedDial(
        icon: Icons.edit_note_rounded,
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
        children: [
          SpeedDialChild(
              child: const Icon(Icons.update),
              foregroundColor: Colors.white,
              backgroundColor: AppColor.altPrimary,
              label: 'Update',
              labelStyle: const TextStyle(fontSize: 15.0),
              onTap: () {}

              ),
          SpeedDialChild(
            child: const Icon(Icons.delete),
            foregroundColor: Colors.white,
            backgroundColor: AppColor.red,
            label: 'Delete',
            labelStyle: const TextStyle(fontSize: 15.0),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
