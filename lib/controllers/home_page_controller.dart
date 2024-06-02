import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:simple_data/app_model.dart';
import 'package:simple_data/sections/data_list_section.dart';
import 'package:simple_data/widgets/button_widgets.dart';
import 'package:simple_data/widgets/form_build_text_field.dart';
import 'package:simple_data/widgets/text_widget.dart';

class HomePageController {

  final formKey = GlobalKey<FormBuilderState>();
  List formItems = [
    "Name",
    "Email",
    "Phone",
  ];
  PreferredSizeWidget getAppBar() {
    return AppBar(
        title: Text(
          "Simple Data",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: Size(Get.width, 365),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    ...(formItems.map((e) {
                      return responseWidget(e,'');
                    }).toList()),
                    GestureDetector(
                      onTap: () async{
                        print('tapped');
                        if(formKey.currentState!.saveAndValidate()) {
                          Map<String,dynamic> data = {
                            'email':"${formKey.currentState!.value['email']}",
                            'phoneNumber':formKey.currentState!.value['phone'],
                            'name':"${formKey.currentState!.value['name']}",
                          };
                         await AppModel().createData(data);
                          await AppModel().getAllData();

                          formKey.currentState!.reset();
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
                    )
                  ],
                ),
              ),
            )));
  }

  Widget responseWidget(e,initialValue) {
    switch (e) {
      case 'Name':
        return Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.label_important_outline,
                  color: Color(0xffC3D0D4),
                  size: 20,
                ),
                SizedBox(width: 8),
                text_widget(
                  text: e ?? '',
                  color: 0xff000000,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  lineHeight: 3,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: FormBuildTextField(
                height: 50,
                color: Colors.black,
                hintText: 'Enter Name',
                attribute: 'name',
                dividerColor: Colors.black,
                initialValue: initialValue == ''?null:initialValue,
                errorText: '',
                font: "Lato",
                keybordType: TextInputType.text,
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                formType: "text",
                dropDownList: [],
                submitAction: () {},
                readOnly: false,
                isRequired: true,
              ),
            )
          ],
        );
      case 'Phone':
        return Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Color(0xffC3D0D4),
                  size: 20,
                ),
                SizedBox(width: 8),
                text_widget(
                  text: e ?? '',
                  color: 0xff000000,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  lineHeight: 3,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: FormBuildTextField(
                height: 50,
                color: Colors.black,
                hintText: 'Enter phone number',
                attribute: 'phone',
                dividerColor: Colors.black,
                initialValue:  initialValue == ''?null:initialValue,
                errorText: '',
                font: "Lato",
                keybordType: TextInputType.number,
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                formType: "text",
                dropDownList: [],
                submitAction: () {},
                readOnly: false,
                isRequired: true,
              ),
            )
          ],
        );
      case 'Email':
        return Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.pin_drop_outlined,
                  color: Color(0xffC3D0D4),
                  size: 20,
                ),
                SizedBox(width: 8),
                text_widget(
                  text: e ?? '',
                  color: 0xff000000,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  lineHeight: 3,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: FormBuildTextField(
                height: 50,
                color: Colors.black,
                hintText: 'Enter Email',
                attribute: 'email',
                dividerColor: Colors.black,
                initialValue: initialValue == ''?null:initialValue,
                errorText: '',
                font: "Lato",
                keybordType: TextInputType.text,
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                formType: "text",
                dropDownList: [],
                submitAction: () {},
                readOnly: false,
                isRequired: true,
              ),
            )
          ],
        );

      default:
        return SizedBox();
    }
  }

  Widget getBody(section) {
    switch (section) {
      case "dataList":
        return DataListSection();
      default:
        return SizedBox();
    }
  }
}
