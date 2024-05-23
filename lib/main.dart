import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_data/controllers/ViewIndividualController.dart';
import 'package:simple_data/controllers/button_controller.dart';
import 'package:simple_data/controllers/dataList_section_controller.dart';
import 'package:simple_data/controllers/home_page_controller.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    Get.put(ButtonController());
    Get.put(DataListSectionController());
    Get.put(ViewIndividualController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    builder:(_ , child){
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      );
    }
    );

  }
}
