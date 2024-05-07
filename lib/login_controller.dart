import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:profile/newpage.dart';


class LogControl extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  void logApi() async {
    isLoading.value = true;
    try {
      // var map = <String, dynamic> {};
      // map["email"] = emailController.value.text;
      // map["password"] = passController.value.text;
      final respons = await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': emailController.value.text,
            'password': passController.value.text
          });
      // var data = jsonEncode(respons.body);
      // print(data);
      print(respons.statusCode);
      if (respons.statusCode == 200) {
        isLoading.value = false;
        Get.to(() => home_screen());
        Get.snackbar(
          'Logging Successfully',
          'Congregation',
        );
      } else {
        isLoading.value = false;
        Get.snackbar('Logging fail', 'Try Again');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
}

class Signupcontroller extends GetxController {
  final fastnamecontroller = TextEditingController().obs;
  final lastcontroller = TextEditingController().obs;
  final emailcontroller = TextEditingController().obs;

  void signUp() async {
    final respons =
        await post(Uri.parse('https://reqres.in/api/register'), body: {
      'email': emailcontroller.value.text,
      'password': lastcontroller.value.text,
      'name': fastnamecontroller.value.text
    });

    if (respons.statusCode == 200) {
      fastnamecontroller.value.clear();
      lastcontroller.value.clear();
      Get.back();
      Get.snackbar('Registration', 'Successful registration');
    }
    print(respons.statusCode);
  }
}

class Listcontroller extends GetxController {
  final userList = [].obs;

  void listviwe() async {
    final respons = await get(
      Uri.parse('https://reqres.in/api/users?page=2'),
    );
    var result = jsonDecode(respons.body);
    userList.value = result['data'];
    // for (var element in userList) {
    //   print(element["first_name"]);
    // }
    print(respons.statusCode);
  }
}

class deletecontroller extends GetxController {
  void deletecon(id) async {
    final respons = await delete(
      Uri.parse('https://reqres.in/api/users/${id}'),
    );
    print(respons.statusCode);
  }
}
