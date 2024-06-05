import 'package:flutter/material.dart';
import 'package:module_13assignment/screens/ProductGridViewScreen.dart';
void main() {
  runApp(const CURD());
}

class CURD extends StatefulWidget {
  const CURD({super.key});  @override
  State<CURD> createState() => _CURDState();
}

class _CURDState extends State<CURD> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "CURD App",
      home: ProductGridViewScreen(),
    );
  }
}
