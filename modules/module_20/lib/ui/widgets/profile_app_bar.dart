import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:module_20/ui/controller/auth_controller.dart';
import 'package:module_20/ui/screens/auth/sign_in_screen.dart';
import 'package:module_20/ui/screens/update_profile_screen.dart';
import 'package:module_20/ui/utility/app_colors.dart';

AppBar profileAppBar(context) {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.memory(
            base64Decode(AuthController.userData?.photo ?? ''),
          ),
        ),
      ),
    ),
    title: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateProfileScreen(),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName ?? ' ',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            AuthController.userData?.email ?? ' ',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await AuthController.clearAllData();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
              (route) => false,
            );
          },
          icon: Icon(Icons.logout))
    ],
  );
}
