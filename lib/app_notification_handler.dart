import 'package:awesome_notifications/awesome_notifications.dart';
import 'goal_notification.dart';

class AppNotificationHandler {
    final _channelKey = "defaultChannelGroup";
    static final idList = <String, int>{};

    void createNotification ( GoalNotification goal ) {
        String goalTitle;
        String goalDescription = goal.goalDescription;

        switch ( goal.goalStatus ) {
            case -1:            
                goalTitle = "You did not meet your goal of " + goal.goalName;
                break;
            case 0:
                goalTitle = "You achieved your goal of " + goal.goalName;
                break;
            case 1:
                goalTitle = "You surpassed your goal of " + goal.goalName;
                break;
            default:
                goalTitle = "Something went wrong here goalStatus was wrong";
                goalDescription = goal.goalStatus.toString();
                break;
        }

        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: _idMaker( goal.goalName ),
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
        if ( AppNotificationHandler.idList.containsKey( goal.goalName ) ) {
            idToUpdate = AppNotificationHandler.idList[ goal.goalName ];
            int? idToCancel = (notificationList.where((x) => x.content?.id == idToUpdate)).elementAt( 0 ).content?.id;
            AwesomeNotifications().cancel( idToCancel! );
            createNotification( goal );
        }
    }
}
