import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBarMsg(String title,String msg,[bool isError=false]){
  Get.snackbar(
    title, // Title of the snackbar
    msg, // Message to display
    snackPosition: SnackPosition.BOTTOM, // Position of the snackbar (TOP or BOTTOM)
    backgroundColor: isError ? Colors.red : Colors.blueGrey, // Background color of the snackbar
    colorText: Colors.white, // Text color
    duration: const Duration(seconds: 3), // Duration to display the snackbar
  );
}
