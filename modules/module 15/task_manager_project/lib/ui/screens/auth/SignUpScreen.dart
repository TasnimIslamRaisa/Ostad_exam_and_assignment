import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager_project/ui/widgets/bg_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BgWidget(
        child: Column(),
      ),
    );
  }
}
