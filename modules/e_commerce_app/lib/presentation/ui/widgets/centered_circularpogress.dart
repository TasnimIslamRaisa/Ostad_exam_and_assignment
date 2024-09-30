import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenteredCircularpogress extends StatelessWidget {
  const CenteredCircularpogress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
