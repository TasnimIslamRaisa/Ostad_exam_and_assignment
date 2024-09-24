import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RemoteMessage>(
      stream: FirebaseMessaging.onMessage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          RemoteMessage message = snapshot.data!;
          return ListTile(
            title: Text(message.notification?.title ?? 'No Title'),
            subtitle: Text(message.notification?.body ?? 'No Body'),
          );
        } else {
          return Text('No messages received');
        }
      },
    );
  }
}
