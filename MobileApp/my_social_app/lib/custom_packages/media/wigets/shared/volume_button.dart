import 'package:flutter/material.dart';

class VolumeButton extends StatelessWidget {
  final void Function() onTap;
  final bool Function() isVolumeOff;
  const VolumeButton({
    super.key,
    required this.onTap,
    required this.isVolumeOff
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(128),
          shape: BoxShape.circle
      
        ),
        child: Icon(
          isVolumeOff() ? Icons.volume_off : Icons.volume_up,
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }
}