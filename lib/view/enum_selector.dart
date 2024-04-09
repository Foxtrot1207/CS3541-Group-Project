import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';

class EnumSelector<T> extends StatefulWidget {
  final ValueNotifier<T?> selected;
  final Map<String, T> options;

  EnumSelector({required this.selected, required this.options});

  @override
  _EnumSelectorState createState() => _EnumSelectorState();
}

class _EnumSelectorState<T extends Enum> extends State<EnumSelector> {
  @override
  Widget build(BuildContext context) {
    HealthGoalAttribute.values;
    return DropdownButton<T>(
      value: widget.selected.value,
      onChanged: (T? newValue) {
        setState(() {
          widget.selected.value = newValue;
        });
      },
      items: List<DropdownMenuItem<T>>.from(widget.options.entries.map(
        (MapEntry<String, dynamic> entry) {
          return DropdownMenuItem<T>(
            value: entry.value,
            child: Text(entry.key),
          );
        }
      ).toList()),
    );
  }
}
