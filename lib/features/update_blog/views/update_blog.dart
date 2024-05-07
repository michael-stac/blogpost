import 'package:blogapp/shared_services/page_service.dart';
import 'package:flutter/material.dart';

import '../../../utilities/appcolors.dart';
import '../../../utilities/custom_button.dart';

class UpdateBlogScreen extends StatefulWidget {
  const UpdateBlogScreen({super.key});

  @override
  State<UpdateBlogScreen> createState() => _UpdateBlogScreenState();
}

class _UpdateBlogScreenState extends State<UpdateBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Update Blog",style: PageService.headerStyle,),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child:  Column(
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
                  customButton(context, onTap: (){}, text: 'Update', bgColor: AppColor.primaryColor, textColor: AppColor.white)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
