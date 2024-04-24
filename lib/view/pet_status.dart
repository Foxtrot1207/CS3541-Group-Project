import 'package:flutter/material.dart';
import 'package:healthapp/controller/pet_controller.dart';

/// A widget that displays the status of the pet.
class PetStatusWidget extends StatefulWidget {
  /// Creates a new [PetStatusWidget].
  PetStatusWidget({super.key});

  @override
  State<PetStatusWidget> createState() => _PetStatusWidgetState();
}

class _PetStatusWidgetState extends State<PetStatusWidget> {
  @override
  void initState() {
    super.initState();
  }

  /// Rebuild whenever the controller is updated
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: PetController.instance,
      builder: (BuildContext context, Widget? child) {
        return rebuild(context);
      },
    );
  }

  /// Builds the widget tree for this widget.
  Widget rebuild(BuildContext context) {

    return Text(PetController.instance.getStatusText());
  }
}
