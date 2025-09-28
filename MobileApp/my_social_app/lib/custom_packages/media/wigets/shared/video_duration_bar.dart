import 'package:flutter/material.dart';

class VideoDurationBar extends StatelessWidget {
  final double rate;
  final Iterable<(double,double)> buffers;
  final Color color;
  final void Function(DragUpdateDetails,double) onTapMove;
  final void Function(TapDownDetails,double) onTapDown;

  const VideoDurationBar({
    super.key,
    required this.rate,
    required this.buffers,
    required this.onTapMove,
    required this.onTapDown,
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        borderRadius: BorderRadius.circular(3.5)
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onHorizontalDragUpdate: (details) => onTapMove(details,constraints.constrainWidth()),
          onTapDown: (details) => onTapDown(details, constraints.constrainWidth()),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: Colors.white.withAlpha(32),
                ),
                height: 5,
                width: constraints.constrainWidth(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.5),
                ),
                height: 5,
                width: constraints.constrainWidth() * rate,
              ),
              ...buffers.map((buffer) => Positioned(
                left: constraints.constrainWidth() * buffer.$1,
                child: Container(
                  height: 5,
                  width: constraints.constrainWidth() * buffer.$2,
                  color: Colors.white.withAlpha(64),
                )
              ))
            ],
          ),
        ),
      ),
    );
  }
}