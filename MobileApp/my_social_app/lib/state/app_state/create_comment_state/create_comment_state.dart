import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

class CreateCommentState{
  final QuestionState? question;
  final SolutionState? solution;
  final CommentState? comment;
  final String content;
  final String hintText;


  const CreateCommentState({
    required this.question,
    required this.solution,
    required this.comment,
    required this.content,
    required this.hintText,
  });

  CreateCommentState changeContent(String content)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        content: content,
        hintText: hintText,
      );

  CreateCommentState changeQuestion(QuestionState question)
    => CreateCommentState(
        question: question,
        solution: null,
        comment: comment,
        content: content,
        hintText: "Comment on ${question.formatUserName(10)}' s question...",
      );
  
  CreateCommentState changeSolution(SolutionState solution)
    => CreateCommentState(
        question: null,
        solution: solution,
        comment: comment,
        content: content,
        hintText: "Comment on ${solution.userName}' s solution...",
      );

  CreateCommentState changeComment(CommentState comment)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        content: "@${comment.userName} ",
        hintText: hintText,
      );
  
  CreateCommentState cancelReply()
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: null,
        content: "",
        hintText: hintText,
      );

  CreateCommentState changeHintText(String hintText)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        content: content,
        hintText: hintText,
      );
}