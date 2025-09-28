import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_slider.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_video_scroller/comment_question_button.dart';
import 'package:my_social_app/views/question/widgets/question_video_scroller/like_question_button.dart';
import 'package:my_social_app/views/question/widgets/question_video_scroller/solve_question_button.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class QuestionVideoScroller extends StatefulWidget {
  final Iterable<EntityContainer<int, QuestionState>> containers;
  final void Function() onNext;
  const QuestionVideoScroller({
    super.key,
    required this.containers,
    required this.onNext
  });

  @override
  State<QuestionVideoScroller> createState() => _QuestionVideoScrollerState();
}

class _QuestionVideoScrollerState extends State<QuestionVideoScroller> {
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
        var question = container.entity!; 
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MediaSlider(
              medias: question.medias,
              activeIndex: question.findFirstVideoIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => _goToUserPage(question.userId),
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: UserImageWidget(
                                image: question.image,
                                diameter: 60
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () => _goToUserPage(question.userId),
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      compressText(question.userName, 15),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                  if(question.content != null)
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: MediaQuery.of(context).size.height * 1 / 5
                                      ),
                                      child: ExtendableContent(
                                        content: question.content!,
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
                            child: LikeQuestionButton(
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
                            child: CommentQuestionButton(
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
                            child: SolveQuestionButton(
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