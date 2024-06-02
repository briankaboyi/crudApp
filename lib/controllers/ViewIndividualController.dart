import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ViewIndividualController{
  final formKey = GlobalKey<FormBuilderState>();
  RxMap r = {}.obs;
  setData(data){
    r.value = data;
  }
}