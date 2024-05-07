import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/utilities/custom_button.dart';
import 'package:flutter/material.dart';

import 'appcolors.dart';

void showCreateNewBlogPostModal(BuildContext context) {
  final size=MediaQuery.of(context).size;
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    context: context,
    builder: (context) => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Create New Post",
            style: PageService.headerStyle,
          ),
          SizedBox(
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
          customButton(context, onTap: (){}, text: 'Create', bgColor: AppColor.primaryColor, textColor: AppColor.white)

        ],
      ),
    ),
  );
}
