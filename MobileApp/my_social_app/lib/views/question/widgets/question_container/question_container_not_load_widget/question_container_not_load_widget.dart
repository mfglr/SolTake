import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/custom_packages/status_widgets/failed_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_circle_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_not_load_widget/question_container_not_load_widget_constants.dart';

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
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  container.status == EntityStatus.notFound
                    ? const NotFoundWidget()
                    : const FailedWidget(),
                  GestureDetector(
                    onTap: (){
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(LoadQuestionAction(questionId: container.key));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(128),
                            shape: BoxShape.circle
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.replay_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(128),
                            borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              container.status == EntityStatus.notFound
                                ? notFound[getLanguage(context)]!
                                : failed[getLanguage(context)]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
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