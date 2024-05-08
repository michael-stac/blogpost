import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';

import '../src/blog/screens/blog_page.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/error.png'),
            PageService.textSpaceL,
            GestureDetector(
              onTap: () {
                nextPageAndRemovePrevious(context,
                    page: const HomePageScreen());
              },
              child: Text(
                'Refers',
                style: PageService.headerStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
