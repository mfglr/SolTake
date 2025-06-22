import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_status_widget/request_status_widget_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class RequestStatusWidget extends StatelessWidget {
  final int state;
  const RequestStatusWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (langauge) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FaIcon(
            icons[state],
            color: colors[state],
            size: 15,
          ),
          Text(
            status[state][langauge]!,
            style: TextStyle(
              color: colors[state]
            ),
          ),
        ],
      ),
    );
  }
}