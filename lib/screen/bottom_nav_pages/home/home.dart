import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../shared_services/page_service.dart';
import '../../../utilities/appcolors.dart';
import '../../../utilities/custom_tab.dart';
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    PageService.homeContext = context;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: SpeedDial(
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

      appBar: AppBar(
        elevation: 0,
        titleSpacing: 11,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Obioma Godswill Michael',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColor.black),
            ),
          ],
        ),
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image(image: AssetImage("assets/images/logo.png")),
            )),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xffF5F5F5),
                child: Icon(
                  Icons.notifications_rounded,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 19,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                ],
              ),
              PageService.textSpacexL,
              Container(
                color: AppColor.primaryColor,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.whiteSmokeColor2,
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      PageService.textSpace,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Blog Post",
                                              style: PageService.headerStyle,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                              },
                                              child:  Icon(Icons.favorite, color: AppColor.grayColor,),
                                            )
                                          ],
                                        ),
                                      ),
                                      PageService.textSpace,
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                            'oin us for a lively evening of fun, laughter, and good company! Whether reconnecting with old friends or making n'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                // nextPage(context, page: const MenuDetailsScreen());
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                AppColor.primaryColor,
                                                child: const Icon(
                                                    Icons.arrow_forward),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                PageService.textSpacexxL,
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
