import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class TokenMonitor extends StatelessWidget {
  final Widget Function(String? token) builder;

  TokenMonitor(this.builder);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: FirebaseMessaging.instance.onTokenRefresh,
      builder: (context, snapshot) {
        return builder(snapshot.data);
      },
    );
  }
}
