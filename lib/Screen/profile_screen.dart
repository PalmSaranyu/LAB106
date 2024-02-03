import 'package:flutter/material.dart';
import 'package:palm/Widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Profile Screen'),
          centerTitle: true,
        ),
        body: const ProfileWidget());
  }
}
