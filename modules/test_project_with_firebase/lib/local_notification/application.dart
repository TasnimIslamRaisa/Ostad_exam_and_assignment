import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_project_with_firebase/local_notification/permission.dart';
import 'package:test_project_with_firebase/local_notification/token_monitor.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'message_list.dart';
import 'message_view.dart';

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  String? _token;
  String? initialMessage;
  bool _resolved = false;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
          (value) => setState(() {
        _resolved = true;
        initialMessage = value?.data.toString();
      }),
    );

    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        '/message',
        arguments: MessageArguments(message, true),
      );
    });
  }

  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: constructFCMPayload(_token),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        print('Subscribing to topic "fcm_test".');
        await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
        print('Successfully subscribed to topic "fcm_test".');
        break;
      case 'unsubscribe':
        print('Unsubscribing from topic "fcm_test".');
        await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
        print('Successfully unsubscribed from topic "fcm_test".');
        break;
      case 'get_apns_token':
        if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          String? token = await FirebaseMessaging.instance.getAPNSToken();
          print('Got APNs token: $token');
        } else {
          print('APNs token is only supported on iOS and macOS platforms.');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Messaging'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: onActionSelected,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'subscribe',
                  child: Text('Subscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'unsubscribe',
                  child: Text('Unsubscribe from topic'),
                ),
                const PopupMenuItem(
                  value: 'get_apns_token',
                  child: Text('Get APNs token (Apple only)'),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendPushMessage,
        backgroundColor: Colors.white,
        child: const Icon(Icons.send),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MetaCard('Permissions', Permissions()),
            MetaCard(
              'Initial Message',
              Column(
                children: [
                  Text(_resolved ? 'Resolved' : 'Resolving'),
                  Text(initialMessage ?? 'None'),
                ],
              ),
            ),
            MetaCard(
              'FCM Token',
              TokenMonitor((token) {
                _token = token;
                return token == null
                    ? const CircularProgressIndicator()
                    : SelectableText(token, style: const TextStyle(fontSize: 12));
              }),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
                  if (message != null) {
                    Navigator.pushNamed(
                      context,
                      '/message',
                      arguments: MessageArguments(message, true),
                    );
                  }
                });
              },
              child: const Text('getInitialMessage()'),
            ),
            MetaCard('Message Stream', MessageList()),
          ],
        ),
      ),
    );
  }
}
