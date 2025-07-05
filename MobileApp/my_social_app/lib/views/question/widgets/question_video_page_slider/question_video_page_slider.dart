import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/question/widgets/question_video_page_slider/widgets/comment_button.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/count_text.dart';
import 'package:my_social_app/views/question/widgets/question_video_page_slider/widgets/like_button.dart';
import 'package:my_social_app/views/question/widgets/question_video_page_slider/widgets/solution_button.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/shared/slide_video_player/slide_video_player.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';

class QuestionVideoPageSlider extends StatefulWidget {
  final Iterable<QuestionState> questions;
  final Widget? topLeftWidget;
  final void Function() onNext;
  const QuestionVideoPageSlider({
    super.key,
    required this.questions,
    required this.onNext,
    this.topLeftWidget
  });

  @override
  State<QuestionVideoPageSlider> createState() => _QuestionVideoPageSliderState();
}

class _QuestionVideoPageSliderState extends State<QuestionVideoPageSlider> with TickerProviderStateMixin {
  final PageController _controller = PageController();

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );
  late bool _isLiked = false;
  void _handleDoubleTap(QuestionState question) {
    final store = StoreProvider.of<AppState>(context,listen: false);
    if(!question.isLiked){
      store.dispatch(LikeQuestionAction(question: question));
    }
    setState(() {
      _isLiked = true;
    });

    _animationController
      .forward()
      .then((_){
        _animationController
          .reverse()
          .then((_){
            setState(() {
              _isLiked = false;
            });
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (index){
        if(widget.questions.isNotEmpty && index == (widget.questions.length - 1)){
          widget.onNext();
        }
      },
      scrollDirection: Axis.vertical,
      itemCount: widget.questions.length,
      itemBuilder: (context, index){
        var question =  widget.questions.elementAt(index);
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            GestureDetector(
              onDoubleTap: () => _handleDoubleTap(question),
              child: SlideVideoPlayer(
                baseBlobUrl: AppClient.blobService,
                media: question.medias.firstWhere((e) => e.multimediaType == MultimediaType.video),
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
                                .push(MaterialPageRoute(builder: (context) => UserPage(userId: question.userId))),
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
                                    avatar: question,
                                    diameter: 45
                                  ),
                                ),
                                Text(
                                  compressText(question.userName, 13),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if(question.content != null)
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: ExtendableContent(
                                content: question.content!,
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
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              LikeButton(question: question),
                              CountText(count: question.numberOfLikes)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              CommentButton(question: question),
                              CountText(count: question.numberOfComments)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              SolutionButton(question: question),
                              CountText(count: question.numberOfSolutions)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ),
            ),
            if(_isLiked)
              Positioned(
                child: ScaleTransition(
                  scale: _animation,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100,
                  ),
                )
              )
          ],
        );
      }
    );
  }
}