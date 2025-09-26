import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_slider.dart';
import 'package:my_social_app/services/latex_sperator/latex.dart';
import 'package:my_social_app/services/latex_sperator/latex_sperator.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/entity_container_upload_status/entity_container_upload_status.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/display_solution_downvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/display_solution_upvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/downvote_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/save_solution_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/solution_comment_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/solution_popup_menu.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/upvote_button.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class SoltutionContainerEntityWidget extends StatelessWidget {
  final EntityContainer<int, SolutionState> container;
  
  const SoltutionContainerEntityWidget({
    super.key,
    required this.container,
  });

  @override
  Widget build(BuildContext context) {
    final solution = container.entity!;

    return Card(
      key: ValueKey(solution.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () => 
                        Navigator
                          .of(context)
                          .push(MaterialPageRoute(builder: (context) => UserPageById(userId: solution.userId))),
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: UserImageWidget(
                              image: solution.image,
                              diameter: 45
                            ),
                          ),
                          Text(solution.formatUserName(10))
                        ],
                      ),
                    ),
                    if(container.isUploadable)
                      TextButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: EntityContainerUploadStatus(
                          container: container,
                          diameter: 28,
                          strokeWidth: 3,
                        ),
                      )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: SolutionStateWidget(solution: solution),
                    ),
                    AppDateWidget(
                      dateTime: solution.createdAt,
                      style: const TextStyle(fontSize: 11),
                    ),
                    if(solution.isOwner)
                      SolutionPopupMenu(solution: solution)
                  ],
                )
              ],
            ),
          ),
          if(solution.isCreatedByAI)
            SizedBox(
              height: MediaQuery.of(context).size.height * 3 / 5,
              child: SingleChildScrollView(
                child: InteractiveViewer(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 3 / 5
                    ),
                    color: Colors.white,
                    child: Column(
                      children: LatexSperator()
                        .seperate(solution.content!)
                        .map((e) => e is Latex
                          ? Math.tex(
                            e.content,
                            options: MathOptions(
                              style: MathStyle.displayCramped,
                              fontSize: 25,
                              color: Colors.black
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                e.content,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                          ))
                        .toList(),
                    ),
                  ),
                ),
              ),
            )
          else
            MediaSlider(
              medias: solution.medias,
            ),
          Padding(
            padding: const EdgeInsets.only(left:12,right: 12,top: 15,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UpvoteButton(solution: solution),
                    if(solution.numberOfUpvotes > 0)
                      DisplaySolutionUpvotesButton(solution: solution),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: DownvoteButton(solution: solution)
                    ),
                    if(solution.numberOfDownvotes > 0)
                      DisplaySolutionDownvotesButton(solution: solution),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: SolutionCommentButton(solution: solution),
                    )
                  ]
                ),
                Row(
                  children: [
                    if(solution.isCreatedByAI)
                      OutlinedButton(
                        onPressed: () => {},
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: const FaIcon(
                                FontAwesomeIcons.robot,
                                size: 15,
                              ),
                            ),
                            Text(
                              solution.aiModelName!,
                              style: const TextStyle(
                                fontSize: 13
                              ),
                            ),
                          ],
                        ),
                      ),
                    SaveSolutionButton(solution: solution),
                  ],
                )
              ],
            ),
          ),
          if(solution.content != null && !solution.isCreatedByAI)
            Padding(
              padding: const EdgeInsets.only(left:12, right: 12, bottom: 15),
              child: ExtendableContent(
                content: solution.content!,
                numberOfExtention: 25,
              ),
            ),
        ],
      ),
    );
  }
}