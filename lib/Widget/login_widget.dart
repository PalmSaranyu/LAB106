import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

Future<void> saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("login", true);
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formLoginKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formLoginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                validator: (value) => value!.isEmpty ? 'Enter password' : null,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => {
                  // Validate form
                  if (_formLoginKey.currentState!.validate())
                    {
                      // Call login api
                      userController.loginUser(
                        _usernameController.text,
                        _passwordController.text,
                      )
                    }
                },
                child: Obx(
                  () => userController.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.red,
                        )
                      : const Text('Login'),        
                ),
              ),
            ],
          )),
    );
  }
}
