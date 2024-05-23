import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simple_data/controllers/dataList_section_controller.dart';
import 'package:simple_data/pages/view_individual.dart';

class DataListSection extends GetView<DataListSectionController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => ListView(
        children: controller.studentData.value.isEmpty
            ? [Text('no data here')]
            : controller.studentData.value.map((e) {
                return GestureDetector(
                  onTap: () {
                    var r = e;
                    print('>>>>>individual data>>>>>>>${e}');
                    Get.to(()=>ViewIndividual(),arguments: r);
                  },
                  child: ListTile(
                    title: Text(e['name']),
                    subtitle: Text(e['email']),
                  ),
                );
              }).toList(),
      ),
    );
  }
}
