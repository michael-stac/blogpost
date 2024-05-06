import 'package:flutter/material.dart';

import 'appcolors.dart';


class InAppTabButton extends StatelessWidget {
  const InAppTabButton({super.key, required this.text, required this.icon, this.onTap});

  final String text;
  final Widget icon;
  final VoidCallback? onTap;

  //Color Instance

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width:50,
            height:50,
            margin: const EdgeInsets.only(bottom: 11),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color:  AppColor.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: icon,
          ),
          Text(text, textAlign: TextAlign.center,style: const TextStyle(color: Color(0xff777777), fontSize: 11, fontWeight: FontWeight.w500)),

        ],
      ),
    );
  }
}
