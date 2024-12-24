import 'package:duration_to_minutes/duration_to_minutes.dart';
import 'package:flutter/material.dart';

class VideoDurationDisplayer extends StatelessWidget {
  final int duration;
  
  const VideoDurationDisplayer({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          width: 15,
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(153),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(8))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DurationToMinutes(
              duration: duration,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
        ),
      ],
    );
  }
}