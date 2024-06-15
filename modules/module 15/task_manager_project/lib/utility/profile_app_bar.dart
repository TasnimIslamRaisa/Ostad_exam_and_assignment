
import 'package:flutter/material.dart';

import '../style/appColors.dart';
import '../ui/widgets/network_cached_image.dart';

AppBar profileAppBar(){
  return AppBar(
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tasnim Islam Raisa",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,fontWeight: FontWeight.w600),),
        Text("islamtasnim65@gmail.com",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
      ],
    ),
    elevation: 3,
    leading:const Padding(
      padding:  EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 12,
        child: NetworkCachedImage(url: '', fit: BoxFit.fill, ),
      ),
    ),
    backgroundColor: AppColors.themeColor,
    actions: [
      IconButton(onPressed: (){}, icon:const Icon(Icons.logout))
    ],
  );
}