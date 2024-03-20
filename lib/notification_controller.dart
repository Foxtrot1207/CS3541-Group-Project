import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
    @pragma("vm:entry-point")
    static Future<void> onNotificationCreatedMethod(
        ReceivedNotification recievedNotification) async {
    }

    @pragma("vm:entry-point")
    static Future<void> onNotificationDisplayedMethod(
        ReceivedNotification receivedNotification) async {
    }

    @pragma("vm:entry-point")
    static Future<void> onDismissActionReceivedMethod(
        ReceivedNotification receivedNotification) async {
    }

    @pragma("vm:entry-point")
    static Future<void> onActionRecievedMethod(
        ReceivedNotification receivedNotification) async {
    }
}
