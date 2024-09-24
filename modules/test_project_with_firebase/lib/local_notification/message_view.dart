import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MessageArguments args = ModalRoute.of(context)!.settings.arguments as MessageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Message Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Title: ${args.message.notification?.title ?? 'No title'}'),
            Text('Body: ${args.message.notification?.body ?? 'No body'}'),
          ],
        ),
      ),
    );
  }
}

class MessageArguments {
  final RemoteMessage message;
  final bool openedApp;

  MessageArguments(this.message, this.openedApp);
}
