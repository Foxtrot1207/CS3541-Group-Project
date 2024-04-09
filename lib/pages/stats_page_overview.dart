import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/pages/stats_comparison_page.dart';
import 'package:healthapp/pages/stats_graphs_page.dart';

class StatsOverviewScreen extends StatefulWidget {
  final PersonInfoController controller;
  StatsOverviewScreen({required this.controller});

  @override
  _StatsOverviewScreenState createState() => _StatsOverviewScreenState();
}

class _StatsOverviewScreenState extends State<StatsOverviewScreen> { // Corrected here
  // Initial Selected Value
  String dropdownValue = 'Overview';

  // List of items in our dropdown menu
  var items = [
    'Overview',
    'Graphs',
    'Comparison',
  ];

  Widget _getSelectedPage() {
    if (dropdownValue == 'Graphs') {
      return StatsGraphScreen(controller: widget.controller);
    } else if (dropdownValue == 'Comparison') {
      return StatsComparisonScreen(controller: widget.controller);
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text('Overview '),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:25),
            child: Align(
              alignment: Alignment.centerLeft, // Align dropdown to the left
              child: DropdownButton(
                // Initial Value
                value: dropdownValue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Dropdown menu items
                items: items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: _getSelectedPage(),
          ),
        ],
      ),
    );
  }
}
