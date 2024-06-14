import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/appColors.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("InProgrees"),
        backgroundColor: AppColors.themeColor,
      ),
    );
  }
}
