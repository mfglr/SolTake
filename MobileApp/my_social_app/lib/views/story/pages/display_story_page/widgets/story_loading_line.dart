import 'dart:async';
import 'package:flutter/material.dart';

class StoryLoadingLine extends StatefulWidget {
  final int duration;
  final double width;
  final double height;
  const StoryLoadingLine({
    super.key,
    this.duration = 15,
    required this.width,
    required this.height
  });

  @override
  State<StoryLoadingLine> createState() => _StoryLoadingLineState();
}

class _StoryLoadingLineState extends State<StoryLoadingLine> {
  
  final int _interval = 4;
  late final int _lastTick;
  double rate = 0;

  @override
  void initState() {
    _lastTick = widget.duration * _interval;
    Timer.periodic(
      Duration(milliseconds: (1000 / _interval).toInt()),
      (timer){
        if(timer.tick <= _lastTick){
          timer.cancel();
          return;
        }
        setState(() => rate = timer.tick / _lastTick );
      }
    );
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey,
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: widget.width * rate,
            height: widget.height,
            color: Colors.white,
          )
        )
      ],
    );
  }
}