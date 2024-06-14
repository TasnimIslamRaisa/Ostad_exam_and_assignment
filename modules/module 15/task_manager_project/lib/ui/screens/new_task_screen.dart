import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/appColors.dart';
import '../widgets/network_cached_image.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("New Task"),
        leading: CircleAvatar(
          child: NetworkCachedImage(url: '', fit: null, ),
        ),
        backgroundColor: AppColors.themeColor,
      ),
      body:const Column(
        children: [
          Row(
            children: [
              Card(
                child: Column(
                  children: [
                    Text("12"),
                    Text("New Task")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
