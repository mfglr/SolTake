import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multimedia_slider/multimedia_slider.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/latex_sperator/latex.dart';
import 'package:my_social_app/services/latex_sperator/latex_sperator.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/display_solution_downvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/display_solution_upvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/downvote_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/save_solution_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_comment_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_popup_menu.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/upvote_button.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';

class SolutionItemWidget extends StatelessWidget {
  final SolutionState solution;

  const SolutionItemWidget({
    super.key,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
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
                TextButton(
                  onPressed: () => 
                    Navigator
                      .of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => UserPage(
                            userId: solution.userId,
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
                        child: AppAvatar(
                          avatar: solution,
                          diameter: 45
                        ),
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
            MultimediaSlider(
              medias: solution.medias,
              blobServiceUrl: AppClient.blobService,
              notFoundMediaPath: noMediaAssetPath,
              noMediaPath: noMediaAssetPath,
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