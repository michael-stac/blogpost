import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../src/blog/screens/create_blog_page.dart';
import 'appcolors.dart';
class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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
