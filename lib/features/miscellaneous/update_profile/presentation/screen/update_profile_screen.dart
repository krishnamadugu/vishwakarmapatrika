import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("update profile"),
      ),
      body: Center(
        child: Text(
          "In Developmemt",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
