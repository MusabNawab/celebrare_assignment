import 'package:flutter/material.dart';

//This wiget shows the mask options container which is customizable
class FramesWidget extends StatelessWidget {
  const FramesWidget(
      {super.key,
      required this.widget,
      required this.h,
      required this.w,
      required this.spacing});

  final Widget widget; //text or icon
  final double h; //height of container
  final double w; //width of container
  final double spacing; //margin value

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      margin: EdgeInsets.only(right: spacing),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget,
      )),
    );
  }
}
