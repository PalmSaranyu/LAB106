import 'package:flutter/material.dart';
import 'package:palm/Widget/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: LoginWidget(
          passwordVisible: _passwordVisible,
          onPasswordVisibilityToggle: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ));
  }
}
