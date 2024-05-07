import 'package:blogapp/shared_services/bottom_nav_service.dart';
import 'package:blogapp/splash_screen.dart';
import 'package:blogapp/utilities/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';




void main() async {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor, // status bar color
    statusBarBrightness: Brightness.dark,
  ));
  // InternetConnectivity.instance.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelProviders()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: AppColor.primaryColor,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Inter',
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.white, elevation: 0),
            highlightColor: AppColor.grayColor,
            primaryColor: AppColor.primaryMaterialColor,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColor.primaryMaterialColor)
                .copyWith(secondary: AppColor.primaryMaterialColor)),
        home:  LoadingScreen(),
      ),
    );
  }
}
