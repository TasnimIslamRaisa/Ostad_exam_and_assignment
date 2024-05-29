import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colormaroon = Color.fromARGB(255, 125, 13, 13);
const colorwhite = Colors.white;


void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0
  );

}

InputDecoration createProductFormDecoration(String label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        //color: Colors.blue,
        width: 1,
      ),
    ),
    fillColor: colorwhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        // color: Colors.blue,
        width: 1,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 125, 13, 13),
        width: 1,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        //color: Colors.blue,
        width: 1,
      ),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        // color: Colors.blue,
        width: 1,
      ),
    ),
    labelText: label,
  );
}

// ignore: non_constant_identifier_names
Widget ScreenBackground(BuildContext context) {
  return SvgPicture.asset(
    'lib/images/backgroundImage.png',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

// ignore: non_constant_identifier_names
DecoratedBox AppDropdownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorwhite,
      border: Border.all(
        color: Colors.brown,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle() {
  return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    mainAxisExtent: 250,
  );
}
