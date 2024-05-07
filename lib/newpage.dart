import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/login_controller.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  Listcontroller listController = Get.put(Listcontroller());
  deletecontroller deleteController = Get.put(deletecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listController.userList.length,
                itemBuilder: (context, index) {
                  final data = listController.userList[index];
                  return Card(
                    child: ListTile(
                      title:
                          Text('${data['first_name']}' ' ${data['last_name']}'),
                      subtitle: Text('${data['email']}'),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage('${data['avatar']}')),
                      trailing: IconButton(
                          onPressed: () {
                            deleteController.deletecon(data['id']);
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
