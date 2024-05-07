import 'package:blogapp/shared_services/page_service.dart';
import 'package:blogapp/src/blog/screens/update_blog.dart';
import 'package:blogapp/utilities/busy_overlay.dart';
import 'package:blogapp/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../../../constant/enum.dart';
import '../../../utilities/appcolors.dart';
import '../../../utilities/custom_button.dart';
import '../models/blog_model.dart';
import '../providers/providers.dart';

class BlogDetailsPost extends StatefulWidget {

  const BlogDetailsPost({super.key, required this.blogId});
  final String blogId;

  @override
  State<BlogDetailsPost> createState() => _BlogDetailsPostState();
}

class _BlogDetailsPostState extends State<BlogDetailsPost> {
  final TextEditingController _title =TextEditingController();
  final TextEditingController _subTitle =TextEditingController();
  final TextEditingController _body =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogProvider>().fetchById(widget.blogId);
  }
  final blogModel = BlogModel;
  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, blog,child) {


        return BusyOverlay(
          show: blog.state == ViewState.busy,
          child: Scaffold(
          
            appBar: AppBar(title:  Text("Blog Post Title ${widget.blogId}", style: PageService.headerStyle,),),
            floatingActionButton: SpeedDial(
              icon: Icons.delete,
              onPress: (){},
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
            body: blog.blog == null ? Text("No Blog Details"): CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
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
                          controller: _title,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColor.filledColor,
                            isDense: true,
                            hintText: _title.text,
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
                            hintText: _subTitle.text,
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
                            hintText: _body.text,
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
                        customButton(context, onTap: () async{



                        }, text: 'Update', bgColor: AppColor.primaryColor, textColor: AppColor.white)

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
