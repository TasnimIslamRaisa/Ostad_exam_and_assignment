
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildPhotoPickerWidget extends StatelessWidget {
  const buildPhotoPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        width: 100,
        height: 48,
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          color: Colors.grey,
        ),
        alignment: Alignment.center,
        child:const Text("Photo",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),),
      ),

    );
  }
}
