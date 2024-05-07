
import 'package:blogapp/constant/enum.dart';
import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/src/blog/models/blog_model.dart';
import 'package:blogapp/utilities/message.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/appcolors.dart';
import '../../../utilities/custom_button.dart';
import '../providers/providers.dart';
import 'blog_page.dart';
import 'create_blog_page.dart';

class UpdateBlogScreen extends StatefulWidget {
  const UpdateBlogScreen({super.key, required this.details});
  final BlogModel details;

  @override
  State<UpdateBlogScreen> createState() => _UpdateBlogScreenState();
}

class _UpdateBlogScreenState extends State<UpdateBlogScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _subTitle = TextEditingController();
  final TextEditingController _body = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title.text = widget.details.title.toString();
    _subTitle.text = widget.details.subTitle.toString();
    _body.text = widget.details.body.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(builder: (context, update, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Blog",
            style: PageService.headerStyle,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                        contentPadding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 10),
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
                      controller: _subTitle,
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
                        contentPadding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 10),
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
                        contentPadding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 10),
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

                    customButton(context, onTap: () async {
                      if (_subTitle.text.isEmpty ||
                          _body.text.isEmpty ||
                          _title.text.isEmpty) {
                        error(context, message: "All Fields are required ");
                      }
                      final data = widget
                          .details; // Assuming widget.details contains the blog details
                      data.title = _title.text;
                      data.body = _body.text;
                      data.subTitle = _subTitle.text;

                      final result = context.read<BlogProvider>();
                      await result.update(data);
                      if (result.state == ViewState.success) {
                        nextPageAndRemovePrevious(context,page:  const HomePageScreen());
                      }
                    },
                        text: 'Update',
                        textColor: AppColor.white,
                        bgColor: AppColor.primaryColor)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
