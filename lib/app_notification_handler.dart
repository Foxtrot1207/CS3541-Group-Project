import 'package:awesome_notifications/awesome_notifications.dart';
import 'goal_notification.dart';

class AppNotificationHandler {
    final _channelKey = "defaultChannelGroup";
    static final idList = <String, int>{};

    void createNotification ( GoalNotification goal ) {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: _idMaker( goal.goalName ),
                channelKey: _channelKey,
                title: goal.goalName,
                body: goal.goalDescription,
                category: NotificationCategory.Reminder,
            ),
            schedule: NotificationCalendar.fromDate(date: goal.deadline),
        );
    }

    String getChannelKey(){
        return _channelKey;
    }

    int _idMaker( goalName ) {
        int id = 1;
        if ( AppNotificationHandler.idList.isEmpty ) {
            AppNotificationHandler.idList.addAll( {goalName: id} );
            return id;
        }
        while ( true ) {
            if ( !AppNotificationHandler.idList.containsValue( id  ) ) {
                AppNotificationHandler.idList.addAll( {goalName: id} );
                return id;
            }
            id++;
        }
    }

    Future<void> updateNotification ( GoalNotification goal ) async {
        final notificationList = await AwesomeNotifications().listScheduledNotifications();
        int? idToUpdate;
        if ( AppNotificationHandler.idList.containsKey( goal.goalName ) ) {
            idToUpdate = AppNotificationHandler.idList[ goal.goalName ];
            int? idToCancel = (notificationList.where((x) => x.content?.id == idToUpdate)).elementAt( 0 ).content?.id;
            AwesomeNotifications().cancel( idToCancel! );
            createNotification( goal );
        }
    }
}
