import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FireBaseNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FireBaseNotification._();

  static final FireBaseNotification instance = FireBaseNotification._();

  Future<void> initialize() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }
    //when app in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification?.title);
      print(message.notification?.body);
      print(message.data);

    });
    //background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print(message.notification?.title);
      print(message.notification?.body);
      print(message.data);

    });

    Future<String?> getToken()async{
      String? token = await _firebaseMessaging.getToken();
      return token;
    }
    String? token =await getToken();
    print(token);
    Future<void> onTokenRefresh() async {
      _firebaseMessaging.onTokenRefresh.listen((newToken) {
        // Use newToken to update your server/API
        print("New FCM Token: $newToken");
      });
    }
    //when the app is terminated
    FirebaseMessaging.onBackgroundMessage(doNothing);
  }

  Future<void> doNothing(RemoteMessage message) async{

  }


}