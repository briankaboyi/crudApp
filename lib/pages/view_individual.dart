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

class ViewIndividual extends GetView<ViewIndividualController> {


  @override
  Widget build(BuildContext context) {
    controller.setData(Get.arguments);

    print("rrrrrrr${controller.r.value}");

    // TODO: implement build
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Name'), subtitle: Text(controller.r.value['name'])),
          ListTile(title: Text('Email'), subtitle: Text(controller.r.value['email'])),
          ListTile(
              title: Text('Phone'),
              subtitle: Text(controller.r.value['phoneNumber'].toString())),
          ListTile(title: Text('ID'), subtitle: Text(controller.r.value['id']??'')),
          ListTile(
              title: Text('Collection Name'),
              subtitle: Text(controller.r.value['collectionName']??'')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(Container(
            color: Colors.white,
            child: FormBuilder(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    ...(Get.find<HomePageController>().formItems.map((e) {
                      return Get.find<HomePageController>().responseWidget(
                          e,
                          e == 'Name'
                              ? controller.r.value['name']
                              : e == 'Email'
                              ? controller.r.value['email']
                              : e == 'Phone'
                              ? controller.r.value['phoneNumber'].toString()
                              : '');
                    }).toList()),
                    GestureDetector(
                      onTap: () async{

                        print("controller.formKey.currentState!>>>>>>${Get.find<HomePageController>().formItems}");
                        controller.formKey.currentState!
                            .saveAndValidate();
                        print("controller.formKey.currentState!>>>>>>${controller.formKey.currentState!.value}");

                        if (controller.formKey.currentState!
                            .saveAndValidate()) {
                          var payload = {
                            "email": controller.formKey.currentState!.value['email'],
                            "phoneNumber":int.parse(controller.formKey.currentState!.value['phone'])  ,
                            "name":  controller.formKey.currentState!.value['name']
                          };
                          print("payload>>>>>>${payload}");
                          await AppModel().updateData(payload,controller.r.value['id'] );
                          var r = await AppModel().getById(controller.r.value['id']);
                          print("r>>>>>>${r.runtimeType}");
                          controller.r.value =r as Map<String,dynamic>;
                          controller.r.refresh();
                          AppModel().studentData.refresh();
                          print("r>>>>>>${r}");

                        }
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
                    ),
                  ],
                ),
              ),
            ),
          ));
        },
        child: Icon(Icons.edit),
      ),
    ));
  }
}
