import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:healthapp/controller/pet_controller.dart';


class PetWidget extends StatefulWidget {
  PetWidget({super.key});

  @override
  State<PetWidget> createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  ui.Image? spritesheet = null;
  double _animationTime = 0;
  double _lastUpdateTime = 0;

  @override
  void initState() {
    super.initState();

    // Set the initial time, so our anim time is consistent
    _lastUpdateTime = DateTime.now().millisecondsSinceEpoch / 1000.0;

    loadImage('assets/pet_spritesheet.png').then((img) {
      setState(() {
        spritesheet = img;
      });
    });

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    )..repeat();

  }

  /// Calculate our steady clock for animation consistency
  void calcAnimationTime() {
    // Calculate the animation timer
    double curTime = DateTime.now().millisecondsSinceEpoch / 1000.0;
    double dt = curTime - _lastUpdateTime;
    
    // Timer modifier to make the pet move faster
    dt = dt * PetController.instance.getWalkSpeed();

    // Accumulate and update last time
    _animationTime += dt;
    _lastUpdateTime = curTime;
  }

  @override
  void dispose() {
    controller.dispose();
    spritesheet?.dispose();
    super.dispose();
  }

  Future<ui.Image> loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(bytes, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  /// Rebuild whenever the controller is updated
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Center( child: rebuild(context) );
      }
    );
  }

  /// Builds the widget tree for this widget.
  Widget rebuild(BuildContext context) {
    if (spritesheet == null)
      return Placeholder(fallbackHeight: 256, fallbackWidth: 256);

    calcAnimationTime();
    return CustomPaint(
      painter: _PetPainter(spritesheet: spritesheet!, time: _animationTime),
      size: Size(256, 256)
    );
  }
}

class _PetPainter extends CustomPainter {
  final ui.Image spritesheet;
  final double time;
  _PetPainter({required this.spritesheet, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    double t = time;
    
    // Width and Height for each tile
    const double tW = 256;
    const double tH = 256;

    // If we should throw our hands in the air like we just don't care!
    bool isDancing = PetController.instance.isCelebrating();
    bool isHappy = PetController.instance.isPlaytime() || isDancing;

    // X/Y index into the tileset
    int iX = t.round() % 3;
    int iY = isHappy ? 1 : 0;

    // Bump the height up and down to go with the walk cycle
    double bump = (t.round() % 2 == 0) ? -4.0 : 0.0;
    
    // Dancing offset
    double danceX = isDancing ? 4 * cos(t) : 0;

    // Draw the pet
    Rect src = Rect.fromLTWH(iX * tW, iY * tH, tW, tH);
    Rect dst = Rect.fromLTWH(danceX, bump, size.width, size.height);
    canvas.drawImageRect(spritesheet, src, dst, paint);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      return <CustomPainterSemantics>[
        CustomPainterSemantics(
          rect: Rect.fromLTWH(0, 0, size.width, size.height),
          properties: const SemanticsProperties(
            label: 'Pet',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  @override
  bool shouldRepaint(_PetPainter oldDelegate) => true;
  @override
  bool shouldRebuildSemantics(_PetPainter oldDelegate) => true;
}
