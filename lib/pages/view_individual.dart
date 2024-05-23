import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:simple_data/app_model.dart';
import 'package:simple_data/controllers/ViewIndividualController.dart';
import 'package:simple_data/controllers/home_page_controller.dart';
import 'package:simple_data/widgets/button_widgets.dart';
import 'package:simple_data/widgets/text_widget.dart';

class ViewIndividual extends GetView<ViewIndividualController>{
  var r = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("rrrrrrr$r");

    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title:Text('Student Details') ,
      ),
      body: ListView(
        children: [
          ListTile(title:Text('Name'),subtitle:Text(r['name']) ),
          ListTile(title:Text('Email'),subtitle:Text(r['email']) ),
          ListTile(title:Text('Phone'),subtitle:Text(r['phoneNumber'].toString()) ),
          ListTile(title:Text('ID'),subtitle:Text(r['id']) ),
          ListTile(title:Text('Collection Name'),subtitle:Text(r['collectionName']) ),



        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.bottomSheet(Container(color: Colors.white,child: FormBuilder(key: controller.formKey ,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [...(Get.find<HomePageController>().formItems.map((e){return Get.find<HomePageController>().responseWidget(e,e=='Name'?r['name']:e=='Email'?r['email']:e=='Phone'?r['phoneNumber']:'');}).toList()), GestureDetector(
                onTap: (){

                },
                child: button_widgets(
                  widget: text_widget(
                    text: 'Add Data',
                    color: 0xff000000,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    lineHeight: 1.5,
                  ),
                  height: 47,
                  width: 150,
                  radius: 100,
                  color: 0xffFfffff,
                  borderColor: 0xff000000,
                ),
              ),],
            ),
          ),
        ),));
      },child: Icon(Icons.edit),),
    );
  }

}