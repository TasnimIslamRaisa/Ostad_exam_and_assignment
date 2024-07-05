import 'package:flutter/material.dart';

void showSnackBarMsg(BuildContext context,String msg,[bool iserror=false]){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(msg),
  backgroundColor: iserror? Colors.red : Colors.green,
    ));
}