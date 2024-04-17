import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';


class PetWidget extends StatefulWidget {
  PetWidget({super.key});

  @override
  State<PetWidget> createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  ui.Image? spritesheet = null;

  @override
  void initState() {
    super.initState();

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
      return Placeholder();

    double timeSeconds = DateTime.now().millisecondsSinceEpoch / 1000.0;
    return CustomPaint(
      painter: _PetPainter(spritesheet: spritesheet!, time: timeSeconds),
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
    
    // Width and Height for each tile
    const double tW = 256;
    const double tH = 256;
    
    // Timer modifier to make the pet move faster
    double t = time * 2;

    // X/Y index into the tileset 
    int iX = t.round() % 3; 
    int iY = (t.round() % 7 == 6) ? 1 : 0;

    // Bump the height up and down to go with the 
    double bump = (t.round() % 2 == 0) ? -4.0 : 0.0; 
    
    // Draw the pet 
    Rect src = Rect.fromLTWH(iX * tW, iY * tH, tW, tH);
    Rect dst = Rect.fromLTWH(0, bump, size.width, size.height);
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
