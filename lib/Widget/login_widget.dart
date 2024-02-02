import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget(
      {super.key,
      required Null Function() onPasswordVisibilityToggle,
      required bool passwordVisible});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => {
              // Use go route to home page
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}