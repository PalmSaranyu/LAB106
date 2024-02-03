import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:palm/services/app_service.dart';
import 'package:palm/controllers/user_controller.dart';
import 'package:palm/models/user.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  UserController userController = Get.put(UserController());

  Widget profileCard(User user) {
    return Card(
        color: Colors.lightGreen,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(user.username!),
                Image.asset('lib/images/123.jpeg')
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile Screen'),
          Obx(() => userController.user.value.username != null
              ? profileCard(userController.user.value)
              : const SizedBox.shrink()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {
              // Remove data from shared preferences
              AppService.instance.removeLogin(),
              // Go back to login screen
              context.replace('/')
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
