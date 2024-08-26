import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/solution/widgets/downvote_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/upvote_button_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/solution/widgets/solution_images_slider.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

enum SolutionActions{
  delete,
}

class SolutionItemWidget extends StatelessWidget {
  final SolutionState solution;
  const SolutionItemWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.accountState!.id,
      builder:(context,accountId) => Card(
        key: ValueKey(solution.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => 
                      Navigator
                        .of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                              userId: solution.appUserId,
                              userName: null
                            )
                          )
                        ),
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: UserImageWidget( userId: solution.appUserId, diameter: 45),
                        ),
                        Text(solution.formatUserName(10))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SolutionStateWidget(solution: solution),
                      ),
                      Text(
                        timeago.format(solution.createdAt,locale: 'en_short')
                      ),
                      Builder(
                        builder: (context) {
                          if(solution.appUserId != accountId) return const SpaceSavingWidget();
                          return PopupMenuButton<SolutionActions>(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onSelected: (value) async {
                              switch(value){
                                case SolutionActions.delete:
                                  bool response = await DialogCreator.showDeleteCommentDialog(context);
                                  if(response && context.mounted){
                                    final store = StoreProvider.of<AppState>(context,listen: false);
                                    store.dispatch(RemoveSolutionAction(solution: solution));
                                  }
                                default:
                                  return;
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem<SolutionActions>(
                                  value: SolutionActions.delete,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delete"),
                                      Icon(Icons.delete)
                                    ],
                                  )
                                )
                              ];
                            }
                          );
                        }
                      ),
                    ],
                  )
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if(solution.images.isNotEmpty){
                  return SolutionImagesSlider(solution: solution,);
                }
                return const SizedBox.shrink();
              }
            ),
            Builder(
              builder: (context) {
                if(solution.content != null){
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(solution.content!),
                  );
                }
                return const SizedBox.shrink();
              }
            ),
            Row(
              children: [
                if(solution.appUserId != accountId) UpvoteButtonWidget(solution: solution),
                if(solution.appUserId != accountId) DownvoteButtonWidget(solution: solution),
              ]
            )
          ],
        ),
      ),
    );
  }
}