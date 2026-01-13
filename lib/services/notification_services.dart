import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  factory NotificationService() => _instance;

  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const iosInitializationSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    // Android channel configuration
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  void _onDidReceiveNotificationResponse(NotificationResponse response) {
    // Handle notification press here
    log('Notification pressed: ${response.payload}');
    // You can navigate or perform actions based on payload
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }
}
