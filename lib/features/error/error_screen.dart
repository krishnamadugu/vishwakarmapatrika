import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String routeName;
  const ErrorScreen({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Unknown route: $routeName'),
      ),
    );
  }
}
