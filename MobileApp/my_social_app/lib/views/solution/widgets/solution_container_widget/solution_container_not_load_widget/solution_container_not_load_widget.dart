import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/custom_packages/status_widgets/failed_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_circle_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_not_load_widget/solution_container_not_load_widget_constants.dart';

class SolutionContainerNotLoadWidget extends StatelessWidget {
  final EntityContainer<int, SolutionState> container;
  const SolutionContainerNotLoadWidget({
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
        children: [
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin, bottom: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: margin),
                      child: const LoadCircleWidget(
                        diameter: 45,
                      ),
                    ),
                    _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
                  ],
                ),
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 3 / 5,
                child: container.status == EntityStatus.notFound
                  ? const NotFoundWidget()
                  : const FailedWidget(),
              ),
              GestureDetector(
                onTap: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(LoadSolutionAction(solutionId: container.key));
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
          ),
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin, bottom: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4),
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
              ],
            ),
          ),
        ],
      ),
    );
  }
}