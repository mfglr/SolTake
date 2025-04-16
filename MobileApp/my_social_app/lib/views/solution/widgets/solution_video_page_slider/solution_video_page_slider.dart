import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/shared/slide_video_player/slide_video_player.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_page_slider/widgets/downvote_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_page_slider/widgets/solution_comment_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_page_slider/widgets/upvote_button.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';

class SolutionVideoPageSlider extends StatefulWidget {
  final Iterable<SolutionState> solutions;
  final void Function() onNext;
  
  const SolutionVideoPageSlider({
    super.key,
    required this.solutions,
    required this.onNext
  });

  @override
  State<SolutionVideoPageSlider> createState() => _SolutionVideoPageSliderState();
}

class _SolutionVideoPageSliderState extends State<SolutionVideoPageSlider> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (index){
        if(widget.solutions.isNotEmpty && index == (widget.solutions.length - 1)){
          widget.onNext();
        }
      },
      scrollDirection: Axis.vertical,
      itemCount: widget.solutions.length,
      itemBuilder: (context, index){
        var solution =  widget.solutions.elementAt(index);
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SlideVideoPlayer(
              baseBlobUrl: AppClient.blobService,
              media: solution.medias.firstWhere((e) => e.multimediaType == MultimediaType.video),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () => 
                            Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (context) => UserPage(userId: solution.userId))),
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 8),
                                child: AppAvatar(
                                  avatar: solution,
                                  diameter: 45
                                ),
                              ),
                              Text(
                                compressText(solution.userName, 13),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ),
                        if(solution.content != null)
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: ExtendableContent(
                              content: solution.content!,
                              numberOfExtention: 15,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                          )                   
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: solution.doesBelongToQuestionOfCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SolutionStateWidget(solution: solution),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: UpvoteButton(solution: solution),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: DownvoteButton(solution: solution)
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: SolutionCommentButton(solution: solution)
                      )
                    ],
                  )
                ],
              )
            ),
          ],
        );
      }
    );
  }
}