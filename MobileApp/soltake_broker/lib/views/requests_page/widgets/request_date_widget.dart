import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soltake_broker/views/shared/app_date_widget.dart';

class RequestDateWidget extends StatelessWidget {
  final DateTime dateTime;
  const RequestDateWidget({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const FaIcon(
              FontAwesomeIcons.clock,
              size: 15,
            ),
          ),
          AppDateWidget(dateTime: dateTime),
        ],
      ),
    );
  }
}