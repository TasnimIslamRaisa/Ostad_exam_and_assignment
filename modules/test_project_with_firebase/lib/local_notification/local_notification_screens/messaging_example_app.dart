import 'package:flutter/material.dart';

import '../application.dart';
import '../message_view.dart';

class MessagingExampleApp extends StatelessWidget {
  const MessagingExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging Example App',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => Application(),
        '/message': (context) => MessageView(),
      },
    );
  }
}
