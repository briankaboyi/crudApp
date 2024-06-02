import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pocketbase/pocketbase.dart';
import 'package:simple_data/controllers/dataList_section_controller.dart';

class AppModel {
  RxMap studentData = {}.obs;
  String? BearerToken;
  final pb = PocketBase('https://e00a-41-220-228-218.ngrok-free.app');
  String pbUrl = 'https://e00a-41-220-228-218.ngrok-free.app';
  Dio dio = Dio();
  Future getAllData() async {
    try {
      Response records =
          await dio.get('${pbUrl}/api/collections/students/records');
      Get.find<DataListSectionController>().studentData.value = records.data['items'];
      print('>>>studentData>>>>>>>>${Get.find<DataListSectionController>().studentData.value}');
      studentData.refresh();
      return records.data;
    } catch (e) {
      print("Failed to get data: $e");
    }
  }

  Future createData(data) async {
    try {
      Response records = await dio.post(
        '${pbUrl}/api/collections/students/records',
        data: data,
        options: Options(headers: {
          'Authorization': "Bearer $BearerToken",
        }),
      );

      print("response data >>>> ${records.data}");
      return records.data;
    } catch (e) {
      print("Failed to get data: $e");
      return null;
    }
  }

  Future updateData(body,id) async{
    try{
      var records = await pb.collection('students').update(id, body: body);
      print("update data response >>>${records.data}");
      return records;
    }catch(e){
      print("Failed to update data: $e");
    }
  }
  Future getById(id) async{
    try{
      final record = await pb.collection('students').getOne(id,
        expand: 'relField1,relField2.subRelField',
      );
      return record.data;
    }catch(e){
      print("Failed to update data: $e");
    }
  }

  Future<void> signIn() async {
    final authData = await pb
        .collection('users')
        .authWithPassword('test@test.com', '12345678');
    print("BearerToken>>>>>>>>>>> ${authData}");

    if (pb.authStore.isValid) {
      BearerToken = pb.authStore.token;
      print("BearerToken  $BearerToken");
    }

    print(pb.authStore.isValid);
    print(pb.authStore.token);
    print(pb.authStore.model.id);
  }
  // Future Login() async{
  //   var req = {
  //     "username": "testuser@user.com",
  //     "password": "12345678910",
  //   };
  //   print(req);
  //   FormData payload = new FormData.fromMap(req);
  //
  //   Response response = await dio.post('${pbUrl}/api/collections/users/auth-with-password',data:payload).then((value){
  //     print("BearerToken>>>>>>>>>>> $value");
  //     BearerToken = value.data['token'];
  //     return value.data;
  //   }).catchError((e)=>print("Failed $e"));
  //   return response.data;
  // }
}
