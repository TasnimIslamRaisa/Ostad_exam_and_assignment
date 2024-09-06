import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/controller/auth_controller.dart';
import 'package:task_manager_project/ui/screens/auth/SignInScreen.dart';
import 'package:task_manager_project/ui/screens/update_screen.dart';

import '../style/appColors.dart';
import '../ui/widgets/network_cached_image.dart';

AppBar profileAppBar(context,[bool fromUpdateProfile=false]) {
  return AppBar(
    title: GestureDetector(
      onTap: () {
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName ?? '',
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            AuthController.userData?.email ?? '',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ),
    elevation: 3,
    leading: GestureDetector(
      onTap: () {
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 12,
          child: NetworkCachedImage(
            url: '',
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
    backgroundColor: AppColors.themeColor,
    actions: [IconButton(onPressed: () async {
      await AuthController.clearAllData();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=> const SignInScreen(),),
          (route)=>false,
      );
    }, icon: const Icon(Icons.logout))],
  );
}
