import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/src/blog/screens/update_blog.dart';
import 'package:blogapp/utilities/busy_overlay.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../../../constant/enum.dart';
import '../../../utilities/appcolors.dart';
import '../../../utilities/error_screen.dart';
import '../providers/providers.dart';
import 'blog_page.dart';

class BlogDetailsPost extends StatefulWidget {
  const BlogDetailsPost({super.key, required this.blogId});
  final String blogId;

  @override
  State<BlogDetailsPost> createState() => _BlogDetailsPostState();
}

class _BlogDetailsPostState extends State<BlogDetailsPost> {
  final TextEditingController _title = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogProvider>().fetchById(widget.blogId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(builder: (context, blog, child) {
      return BusyOverlay(
        show: blog.state == ViewState.busy,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Blog Details',
              style: PageService.headerStyle,
            ),
          ),
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
                  child: const Icon(Icons.accessible),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  label: 'Update',
                  labelStyle: const TextStyle(fontSize: 15.0),
                  onTap: () {
                    nextPage(context,
                        page: UpdateBlogScreen(
                          details: blog.blog!,
                        ));
                  }),
              SpeedDialChild(
                child: const Icon(Icons.not_accessible),
                foregroundColor: Colors.white,
                backgroundColor: AppColor.primaryColor,
                label: 'Delete',
                labelStyle: const TextStyle(fontSize: 15.0),
                onTap: () {
                  // Call the delete function here
                  final String blogId = widget
                      .blogId; // Assuming widget.details contains the blog ID
                  context.read<BlogProvider>().delete(blogId);
                  nextPageAndRemovePrevious(context,
                      page: const HomePageScreen());
                },
              ),
            ],
          ),
          body: blog.blog == null
              ? const ErrorScreen()
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                  fontFamily: 'SF Pro Display'),
                            ),
                            PageService.textSpace,
                            TextFormField(
                              readOnly: true,
                              controller: _title,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: AppColor.filledColor,
                                isDense: true,
                                hintText: blog.blog!.title.toString(),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black),
                                contentPadding: const EdgeInsets.only(
                                    top: 15, bottom: 10, left: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.filledColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.filledColor),
                                ),
                              ),
                            ),
                            PageService.textSpaceL,
                            Text(
                              'Subtitle',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                  fontFamily: 'SF Pro Display'),
                            ),
                            PageService.textSpace,
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: AppColor.filledColor,
                                isDense: true,
                                hintText: blog.blog!.subTitle.toString(),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black),
                                contentPadding: const EdgeInsets.only(
                                    top: 15, bottom: 10, left: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.filledColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.filledColor),
                                ),
                              ),
                            ),
                            PageService.textSpaceL,
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                  fontFamily: 'SF Pro Display'),
                            ),
                            PageService.textSpace,
                            TextFormField(
                              maxLines: 4,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: AppColor.filledColor,
                                isDense: true,
                                hintText: blog.blog!.body.toString(),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black),
                                contentPadding: const EdgeInsets.only(
                                    top: 15, bottom: 10, left: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.filledColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.filledColor),
                                ),
                              ),
                            ),
                            PageService.textSpaceL,
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      );
    });
  }
}
