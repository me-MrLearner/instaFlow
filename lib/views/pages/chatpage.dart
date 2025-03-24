import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaflow/controllers/user_controller.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({super.key});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'messenger',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/write.png',
              height: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Horizontal ListView
          SizedBox(
            height: 110,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Makes the list horizontal
                itemCount:
                    userController
                        .users
                        .length, // Set the number of items you want in the list
                itemBuilder: (context, index) {
                  var user = userController.users[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user.mediumPicture),
                        ),
                        // SizedBox(height: 5),
                        Text(
                          'User ${index + 1}', // Change this based on the data you want to display
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(color: Colors.red),
        ],
      ),
    );
  }
}
