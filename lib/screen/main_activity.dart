import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../shared_services/bottom_nav_service.dart';
import '../utilities/appcolors.dart';
import 'bottom_nav_pages/favourite/favorite.dart';
import 'bottom_nav_pages/home/home.dart';


class MainActivityPage extends StatefulWidget {
  const MainActivityPage({Key? key,}) : super(key: key);
  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  ///bottom nav items
  List<Map>? bottomNavItems = [
    {'title': 'Home', 'icon': MdiIcons.rhombusSplit},
    {'title': "Favourite", 'icon': MdiIcons.medicalBag},
  ];


  @override
  Widget build(BuildContext context) {
    return  Consumer<ModelProviders>(builder: (context, counter, child) {
      List<Widget> bottomNavPages = [
        HomePageScreen(),
        Favourite(),
      ];
      return Scaffold(
        body: bottomNavPages[counter.bottomCounter],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xffF1F0F0),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColor.primaryColor,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff006400),
                fontSize: 11),
            onTap: (value) {
              counter.changeCounter(value);
            },
            currentIndex: counter.bottomCounter,
            items: List.generate(bottomNavItems!.length, (index) {
              final data = bottomNavItems![index];

              return BottomNavigationBarItem(
                  tooltip: data['title'],
                  icon: Icon(data['icon'],),
                  label: data['title']);
            })),
      );
    });
  }
}
