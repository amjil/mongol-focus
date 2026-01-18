import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Helper functions to call resolvePlatformSpecificImplementation with type parameters.
/// This is needed because ClojureDart doesn't support generic type parameters in method calls.
AndroidFlutterLocalNotificationsPlugin? resolveAndroidImpl(
  FlutterLocalNotificationsPlugin plugin,
) {
  return plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
}

IOSFlutterLocalNotificationsPlugin? resolveIOSImpl(
  FlutterLocalNotificationsPlugin plugin,
) {
  return plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
}
