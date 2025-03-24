import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:instaflow/bindings.dart/inject_dependencies.dart';
import 'package:instaflow/views/pages/chatpage.dart';
import 'package:instaflow/views/pages/storypage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var myList = [];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/chat.png', height: 30),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/reels.png', height: 30),
            label: 'Stories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/menu.png', height: 30),
            label: 'Menu',
          ),
        ],
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: (index) {
          bottomNavController.onItemTapped(index);
        },
      ),
      body: Obx(() {
        switch (bottomNavController.selectedIndex.value) {
          case 0:
            return ChatsPage(); // Replace with the actual widget for Chats
          case 1:
            return StoriesPage(); // Replace with the actual widget for Stories
          case 2:
            return StoriesPage(); // Replace with the actual widget for Menu
          default:
            return Center(child: Text('Page not found'));
        }
      }),
    );
  }
}
