import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/notification_controller.dart';
import 'package:healthapp/app_notification_handler.dart';


String channelKey = AppNotificationHandler().getChannelKey();

void main() async {
    await AwesomeNotifications().initialize(
        null,
        [
            NotificationChannel(
                channelGroupKey: channelKey,
                channelKey: "defaultChannel", 
                channelName: "Goal Notifications", 
                channelDescription: "Goal Notification Channel"
            )
        ],
        channelGroups: [
            NotificationChannelGroup( channelGroupKey: channelKey, channelGroupName: "Default Group" ),
        ]
    );

    bool notificationsEnabled = await AwesomeNotifications().isNotificationAllowed();
    if (!notificationsEnabled) {
        AwesomeNotifications().requestPermissionToSendNotifications();
    }
    runApp(const MainApp());
}



class MainApp extends StatefulWidget {
    const MainApp({super.key});

    @override
    State<MainApp> createState() => _MainAppState();
}



class _MainAppState extends State<MainApp> {
    @override
    void initState() {
        AwesomeNotifications().setListeners(
            onActionReceivedMethod: NotificationController.onActionRecievedMethod,
            onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
            onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
            onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
        );
        super.initState();
    }
    
    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      );
    }
}
