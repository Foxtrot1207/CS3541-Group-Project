import 'package:awesome_notifications/awesome_notifications.dart';
import 'goal_notification.dart';

class AppNotificationHandler {
    static const _channelKey = "defaultChannelGroup";
    static final idList = <String, int>{};

    AppNotificationHandler(){
        print("the fucking hell");
    }

    void createNotification ( GoalNotification goal ) {
        String goalTitle;
        String goalDescription = goal.description;

        switch ( goal.status ) {
            case -1:            
                goalTitle = "You did not meet your goal of " + goal.name;
                break;
            case 0:
                goalTitle = "You achieved your goal of " + goal.name;
                break;
            case 1:
                goalTitle = "You surpassed your goal of " + goal.name;
                break;
            default:
                goalTitle = "Something went wrong here goalStatus was wrong";
                goalDescription = goal.status.toString();
                break;
        }

        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: _idMaker( goal.name ),
                channelKey: _channelKey,
                title: goalTitle,
                body: goalDescription,
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
        if ( AppNotificationHandler.idList.containsKey( goal.name ) ) {
            idToUpdate = AppNotificationHandler.idList[ goal.name ];
            int? idToCancel = (notificationList.where((x) => x.content?.id == idToUpdate)).elementAt( 0 ).content?.id;
            AwesomeNotifications().cancel( idToCancel! );
            createNotification( goal );
        }
    }
}
