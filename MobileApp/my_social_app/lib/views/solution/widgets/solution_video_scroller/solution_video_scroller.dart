import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_slider.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_scroller/comment_solution_button/comment_solution_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_scroller/downvote_solution_button/downvote_solution_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_scroller/solution_status_widget/solution_status_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_scroller/upvote_solution_button/upvote_solution_button.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class SolutionVideoScroller extends StatefulWidget {
  final Iterable<EntityContainer<int, SolutionState>> containers;
  final void Function() onNext;

  const SolutionVideoScroller({
    super.key,
    required this.containers,
    required this.onNext
  });

  @override
  State<SolutionVideoScroller> createState() => _SolutionVideoScrollerState();
}

class _SolutionVideoScrollerState extends State<SolutionVideoScroller> {
  final PageController _controller = PageController();

  void _onNext(){
    if(_controller.page == (widget.containers.length - 1)){
      widget.onNext();
    }
  }

  void _goToUserPage(int userId) =>
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => UserPageById(userId: userId)));

  @override
  void initState() {
    _controller.addListener(_onNext);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onNext);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: widget.containers.length,
      itemBuilder: (context, index){
        var container = widget.containers.elementAt(index);
        var solution = container.entity!; 
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MediaSlider(
              medias: solution.medias,
              blobService: AppClient.blobService,
              activeIndex: solution.findFirstVideoIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SolutionStatusWidget(
                    container: container,
                    size: 36,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: solution.content != null
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => _goToUserPage(solution.userId),
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: UserImageWidget(
                                image: solution.image,
                                diameter: 60
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () => _goToUserPage(solution.userId),
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      compressText(solution.userName, 15),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                  if(solution.content != null)
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: MediaQuery.of(context).size.height * 1 / 5
                                      ),
                                      child: ExtendableContent(
                                        content: solution.content!,
                                        numberOfExtention: 30,
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(128),
                              shape: BoxShape.circle
                            ),
                            child: UpvoteSolutionButton(
                              container: container,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(128),
                              shape: BoxShape.circle
                            ),
                            child: DownvoteSolutionButton(
                              container: container,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(128),
                              shape: BoxShape.circle
                            ),
                            child: CommentSolutionButton(
                              container: container,
                              color: Colors.white,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }
    );
  }
}