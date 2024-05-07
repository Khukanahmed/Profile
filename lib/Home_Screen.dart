import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:profile/SignUp.dart';
import 'package:profile/login_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LogControl controller = Get.put(LogControl());
  Listcontroller controller2 = Get.put(Listcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Email'), border: OutlineInputBorder()),
              controller: controller.emailController.value,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Password'), border: OutlineInputBorder()),
              controller: controller.passController.value,
            ),
            const SizedBox(height: 10),
            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: () {
                        controller.logApi();
                        controller2.listviwe();
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Center(
                          child: Text(
                            'SignIn',
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.5,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
            }),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I have no account'),
                TextButton(
                    onPressed: () {
                      Get.to(() => SignUp());
                    },
                    child: Text('SignUp'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
