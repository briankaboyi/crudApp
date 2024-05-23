import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simple_data/app_model.dart';
import 'package:simple_data/controllers/home_page_controller.dart';

class HomePage extends GetView<HomePageController>{
  @override
  Widget build(BuildContext context) {
     AppModel().getAllData();
    // TODO: implement build
    return Scaffold(
      appBar:controller.getAppBar(),
      body: controller.getBody("dataList"),
      floatingActionButton: FloatingActionButton(onPressed: (){AppModel().signIn();},child: Icon(Icons.login),),
    );
  }

}