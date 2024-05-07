import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/login_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Signupcontroller controller = Get.put(Signupcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Fast Name'), border: OutlineInputBorder()),
              controller: controller.fastnamecontroller.value,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Last name'), border: OutlineInputBorder()),
              controller: controller.lastcontroller.value,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Email'), border: OutlineInputBorder()),
              controller: controller.emailcontroller.value,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                controller.signUp();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 18, letterSpacing: 1.5, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
