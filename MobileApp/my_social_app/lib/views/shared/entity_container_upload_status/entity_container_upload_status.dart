import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';

class EntityContainerUploadStatus extends StatelessWidget {
  final EntityContainer container;
  final double diameter;
  final double strokeWidth;
  final TextStyle rateTextStyle;
  final double failedIconSize;

  const EntityContainerUploadStatus({
    super.key,
    required this.container,
    required this.diameter,
    this.strokeWidth = 5,
    this.rateTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 15
    ),
    this.failedIconSize = 15
  });
  
  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      EntityStatus.created => throw UnimplementedError(),
      EntityStatus.loading => throw UnimplementedError(),
      EntityStatus.loadSuccess => throw UnimplementedError(),
      EntityStatus.loadFailed => throw UnimplementedError(),
      EntityStatus.notFound => throw UnimplementedError(),
      EntityStatus.uploading => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: strokeWidth,
            backgroundColor: Colors.blue,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            value: container.rate,
            constraints: BoxConstraints(
              maxHeight: diameter,
              minHeight: diameter,
              maxWidth: diameter,
              minWidth: diameter
            ),
          ),
          Text(
            container.rateToString,
            style: rateTextStyle,
          )
        ],
      ),
      EntityStatus.processing => CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(
          maxHeight: diameter,
          minHeight: diameter,
          maxWidth: diameter,
          minWidth: diameter
        ),
      ),
      EntityStatus.uploadFailed => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            value: 1,
            constraints: BoxConstraints(
              maxHeight: diameter,
              minHeight: diameter,
              maxWidth: diameter,
              minWidth: diameter
            ),
          ),
          Icon(
            Icons.close,
            size: failedIconSize,
            color: Colors.red,
          )
        ],
      ),
    };
  }
}