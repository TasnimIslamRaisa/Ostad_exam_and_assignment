import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/appColors.dart';
import '../../utility/profile_app_bar.dart';
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
      appBar: profileAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: taskSummaryCard("12","New Task")) ,
              Expanded(child: taskSummaryCard("10","Completed")) ,
              Expanded(child: taskSummaryCard("12","In Progress")) ,
              Expanded(child: taskSummaryCard("01","Cancel")) ,
            ],
          ),
        ],
      ),
    );
  }
Card taskSummaryCard(number,taskName){
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
                number ,
                style:Theme.of(context).textTheme.titleLarge),
            Text(taskName,style:Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    );
}
}
