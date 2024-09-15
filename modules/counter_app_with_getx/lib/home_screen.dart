import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key,});

  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter Application"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                "Counter Value ${counterController.count}",
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            },),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCount();
          // title, msg
          Get.snackbar(
            'Successful',
            'Added Value 1',
            snackPosition: SnackPosition.TOP,
            //showProgressIndicator: true
            borderRadius: 8,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            icon: const Icon(Icons.notifications_active),
            isDismissible: true,
            duration: const Duration(seconds: 2),
            animationDuration: const Duration(milliseconds: 200),
          );
          /*Get.dialog(
             Container(
               width: 20,
               height: 20,
               color: Colors.blueGrey.shade200,
             ),
          );*/
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}