import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

class CreateCommentState{
  final QuestionState? question;
  final SolutionState? solution;
  final CommentState? comment;
  final String content;


  const CreateCommentState({
    required this.question,
    required this.solution,
    required this.comment,
    required this.content,
  });

  CreateCommentState changeContent(String content)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        content: content,
      );

  CreateCommentState changeQuestion(QuestionState question)
    => CreateCommentState(
        question: question,
        solution: null,
        comment: null,
        content: content,
      );
  
  CreateCommentState changeSolution(SolutionState solution)
    => CreateCommentState(
        question: null,
        solution: solution,
        comment: null,
        content: content,
      );

  CreateCommentState changeComment(CommentState comment)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        content: "@${comment.userName} ",
      );
  
  CreateCommentState cancelReply()
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: null,
        content: "",
      );
  CreateCommentState clear()
    => const CreateCommentState(
        question: null,
        solution: null,
        comment: null,
        content: "",
      );
}