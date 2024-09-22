
import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FireBaseNotification._();
  static final FireBaseNotification instance = FireBaseNotification._();

  Future<void> initialize() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }
}