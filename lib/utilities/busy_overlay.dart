import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'appcolors.dart';

class BusyOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;
  final double opacity;

  const BusyOverlay(
      {Key? key,
        required this.child,
        this.title = '',
        this.show = false,
        this.opacity = 0.7})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: <Widget>[
          child,
          IgnorePointer(
            ignoring: !show,
            child: Opacity(
                opacity: show ? 1.0 : 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(opacity),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SpinKitSpinningLines(
                        color: AppColor.primaryColor,
                        size: 100.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(ColorPath.siennaRed)),
                      Text(
                        "Loading",
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
          ),
        ]));
  }
}
