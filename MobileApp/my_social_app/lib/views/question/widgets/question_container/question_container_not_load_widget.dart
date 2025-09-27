import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/custom_packages/status_widgets/failed_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_circle_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';

class QuestionContainerNotLoadWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;

  const QuestionContainerNotLoadWidget({
    super.key,
    required this.container
  });

  Widget _buildLoadingRectangle({double width = 110, double height = 18}) =>
    SizedBox(
      height: height,
      width: width,
      child: LoadWidget(
        borderRadius: height / 2,
      )
    );

  @override
  Widget build(BuildContext context) {
    const double margin = 8;
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin, bottom: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const LoadCircleWidget(
                        diameter: 35,
                      ),
                    ),
                    _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
                  ],
                ),
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: margin),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 3 / 5,
              child: container.status == EntityStatus.notFound
                ? const NotFoundWidget()
                : const FailedWidget()
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4),
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin),
            child: _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 3 / 5),
          ),
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin),
            child: _buildLoadingRectangle(height: 36, width: MediaQuery.of(context).size.width),
          ),
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin, bottom: margin),
            child: _buildLoadingRectangle(height: 36, width: MediaQuery.of(context).size.width / 2),
          ),
        ],
      ),
    );
  }
}