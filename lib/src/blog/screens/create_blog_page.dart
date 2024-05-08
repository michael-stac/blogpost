import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared_services/page_service.dart';
import '../../../utilities/appcolors.dart';
import '../../../utilities/custom_button.dart';
import '../../../utilities/message.dart';
import '../providers/providers.dart';
import 'blog_page.dart';

class CreateNewBlogPost extends StatefulWidget {
  const CreateNewBlogPost({super.key});

  @override
  State<CreateNewBlogPost> createState() => _CreateNewBlogPostState();
}

class _CreateNewBlogPostState extends State<CreateNewBlogPost> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _subtitle = TextEditingController();
  final TextEditingController _body = TextEditingController();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Blog",
          style: PageService.headerStyle,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                    controller: _title,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColor.filledColor,
                      isDense: true,
                      hintText: 'Enter title',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.romanSilver),
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: AppColor.filledColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: AppColor.filledColor),
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
                    controller: _subtitle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColor.filledColor,
                      isDense: true,
                      hintText: 'Enter subtitle',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.romanSilver),
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: AppColor.filledColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: AppColor.filledColor),
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
                    controller: _body,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColor.filledColor,
                      isDense: true,
                      hintText: 'Enter Description',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.romanSilver),
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: AppColor.filledColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: AppColor.filledColor),
                      ),
                    ),
                  ),
                  PageService.textSpaceL,
                  customButton(
                    context,
                    onTap: () {
                      if (_title.text.isEmpty ||
                          _body.text.isEmpty ||
                          _subtitle.text.isEmpty) {
                        error(context, message: 'All Field are required');
                      } else {
                        final title = _title.text;
                        final subTitle = _subtitle.text;
                        final body = _body.text;
                        context
                            .read<BlogProvider>()
                            .create(title, subTitle, body);
                        nextPageAndRemovePrevious(context, page:  HomePageScreen());

                      }
                      // Form is valid, proceed with creating the blog post
                    },
                    text: 'Create',
                    bgColor: AppColor.primaryColor,
                    textColor: AppColor.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
