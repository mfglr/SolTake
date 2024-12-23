import 'package:flutter/material.dart';

class DurationToMinutes extends StatelessWidget {
  final int duration;
  final TextStyle? style;
  const DurationToMinutes({
    super.key,
    required this.duration,
    this.style
  });

  String _formatInt(int value) => value < 10 ? "0$value" : value.toString();

  String _durationToMinutes() => 
    "${_formatInt((duration / 60).floor())}:${_formatInt(duration % 60)}";

  @override
  Widget build(BuildContext context) {
    return Text(
      _durationToMinutes(),
      style: style,
    );
  }
}