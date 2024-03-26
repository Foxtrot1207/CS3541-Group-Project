import 'lib/model/health_goal_model';
class HealthGoalView extends StatefulWidget {
  @override
  _HealthGoalViewState createState() => _HealthGoalViewState();
}

class _HealthGoalViewState extends State<HealthGoalView> {
  HealthGoalController controller = HealthGoalController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.healthGoals.length,
      itemBuilder: (context, index) {
        HealthGoal goal = controller.healthGoals[index];
        return ListTile(
          title: Text('Goal Type: ${goal.goalType == 0 ? 'Daily Macro' : 'Weekly Weight'}'),
          subtitle: Text('Macros Goal: ${goal.macrosGoal}, Weight Goal: ${goal.weightGoal}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => controller.removeHealthGoal(index),
          ),
        );
      },
    );
  }
}
