import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm/app_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Profile Screen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile Screen'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => {
                 AppService.instance.removeLogin(),
                  context.replace('/'),
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ));
  }
}
