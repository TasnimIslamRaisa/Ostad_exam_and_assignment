import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'counter_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());
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
            const SizedBox(height: 16,),

            // Bottom Sheet with getx
            ElevatedButton(
                onPressed: (){
                  Get.bottomSheet(
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.cyan,
                      child: Column(
                        children: [
                          const Text('Tasnim'),
                          const Text('Islam'),
                          const Text('Raisa'),
                          ElevatedButton(onPressed: (){
                            Get.back();
                          }, child: const Text("Close"))
                        ],
                      ),
                    ),
                    enableDrag: false,
                    isDismissible: false,
                    //barrierColor: Colors.pink[50],


                  );
                },
                child:const Text("Click Here")),
            const SizedBox(height: 16,),

            ElevatedButton(
                onPressed: (){
                  GetStorage().write('Name', 'Tasnim');

                },
                child:const Text("Data Write")),
            const SizedBox(height: 16,),

            ElevatedButton(
                onPressed: (){
                  var MyName= GetStorage().read('Name' );
                  Get.snackbar('My Name', MyName);
                },
                child:const Text("Data Read"),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
                onPressed: (){
                  GetStorage().erase();
                  //GetStorage().remove('Name');
                },
                child:const Text("Data Erase")),
          ],
        ),
      ),

      // Snackbar with getx
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