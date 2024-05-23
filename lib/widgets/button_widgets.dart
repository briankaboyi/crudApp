import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/button_controller.dart';

class button_widgets extends GetView<ButtonController> {
  final Widget widget;
  final double height, width, radius;
  final int color, borderColor;

  const button_widgets(
      {required this.widget,
      required this.height,
      required this.width,
      required this.radius,
      required this.color,
      required this.borderColor,});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value == false
        ? Get.width > 365
            ? Container(
                height: height.sp,
                width: width.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(color: Color(borderColor)),
                  color: Color(color),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget,
                ),
              )
            : Container(
                height: height.sp,
                width: width.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(color: Color(borderColor)),
                  color: Color(color),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget,
                  ),
                ),
              )
        : const Align(alignment: Alignment.center,
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(strokeWidth: 2.0)),
          ));
  }
}
