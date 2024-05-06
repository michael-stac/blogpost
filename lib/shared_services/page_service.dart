import 'package:flutter/material.dart';

import '../../utilities/appcolors.dart';
import 'global_variable.dart';


class PageService{
  static BuildContext? homeContext;
  Size pageSize(BuildContext context){
    var context=GlobalVariable.navState.currentContext;
    if(context!=null) {
      var size = MediaQuery.of(context).size;
      return Size(size.width, size.height);
    }
    return const Size(0, 0);
  }

  void showSnackBar(BuildContext context, String content){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(content)));
  }
  void errorshowSnackBar(BuildContext context, String content, Color color){
    ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(content: Text(content))
    );
  }
  static double? headerFontSize=17;
  static double? textFontSize=15;
  static SizedBox textSpaceS=  const SizedBox(
    height: 5,
    width: 5,
  );
  static SizedBox textSpace=  const SizedBox(
    height: 10,
    width: 10,
  );
  static SizedBox textSpaceL=  const SizedBox(
      height: 15,
      width:15
  );
  static SizedBox textSpacexL=  const SizedBox(
    height: 20,
    width: 20,
  );
  static SizedBox textSpacexxL=  const SizedBox(
    height: 30,
    width: 30,
  );
  static TextStyle bigHeaderStyle= TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: AppColor.primaryColor, fontFamily: 'SF Pro Display');
  static TextStyle extraBigHeaderStyle= TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: AppColor.primaryColor, fontFamily: 'SF Pro Display');
  static TextStyle headerStyle= TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: AppColor.primaryColor, fontFamily: 'SF Pro Display');


  static TextStyle labelStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.black, fontFamily: 'SF Pro Display');
  static TextStyle introLabelStyle=TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.black, fontFamily: 'SF Pro Display');
  static TextStyle normalLabelStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: AppColor.black);
  static TextStyle emailLabelStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.whiteSmokeColor, fontFamily: 'SF Pro Display');
  static TextStyle whitelabelStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.white, fontFamily: 'SF Pro Display');
  static TextStyle textEditStyle=const TextStyle(fontSize: 14, fontFamily: 'SF Pro Display');
}