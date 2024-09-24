import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Permissions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        print('User granted permission: ${settings.authorizationStatus}');
      },
      child: Text('Request Notification Permissions'),
    );
  }
}
