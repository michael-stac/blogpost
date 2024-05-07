import 'package:blogapp/constant/enum.dart';
import 'package:blogapp/utilities/busy_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../../../shared_services/page_service.dart';
import '../../../utilities/appcolors.dart';
import '../../../utilities/create_error_screen.dart';
import '../../../utilities/general.dart';
import '../../../utilities/router.dart';
import '../providers/providers.dart';
import 'blog_post_details.dart';
import 'create_blog_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogProvider>().fetchAll();
  }
  void shareContent(String message) {
    Share.share(message);
  }


  @override
  Widget build(BuildContext context) {
    PageService.homeContext = context;
    var size = MediaQuery.of(context).size;
    return Consumer<BlogProvider>(builder: (context, blog, child) {
      return BusyOverlay(
        show: blog.state == ViewState.busy,
        child: blog.state == ViewState.error && blog.blogList.isEmpty
            ? Text(blog.message)
            : blog.state == ViewState.success && blog.blogList.isEmpty
                ? CreateErrorScreen()
                : Scaffold(
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
                    appBar: AppBar(
                      elevation: 0,
                      titleSpacing: 11,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${getGreetingMessage()}!',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      leading: GreetingIcon(getGreetingMessage()).getIconAsset(),
                    ),
                    body: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Explore Blog Post",
                                style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          PageService.textSpaceL,
                          Expanded(
                            child: ListView.builder(
                              itemCount: blog.blogList.length,
                              itemBuilder: (context, index) {
                                final data = blog.blogList[index];

                                return GestureDetector(
                                  onTap: () {
                                    nextPage(context,
                                        page: BlogDetailsPost(
                                          blogId: data.id.toString(),
                                        ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteSmokeColor2,
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColor.white,
                                                blurRadius: 2,
                                                spreadRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.zero,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PageService.textSpace,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    data.title,
                                                    style:
                                                        PageService.headerStyle,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      shareContent('Your sharing message goes here');
                                                    },
                                                    child: Icon(
                                                      Icons.share,
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PageService.textSpaceS,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                data.subTitle,
                                                style: PageService.smallHeaderStyle,
                                              ),
                                            ),
                                            PageService.textSpaceS,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                data.body,
                                              ),
                                            ),
                                            PageService.textSpaceS,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      nextPage(context,
                                                          page: BlogDetailsPost(
                                                            blogId: data.id
                                                                .toString(),
                                                          ));
                                                    },
                                                    child: Text(
                                                      "View",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontFamily:
                                                              'SF Pro Display'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      PageService.textSpaceL,
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          PageService.textSpacexL,
                        ],
                      ),
                    ),
                  ),
      );
    });
  }
}
