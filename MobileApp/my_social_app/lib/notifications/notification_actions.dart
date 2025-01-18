import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_type.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

void _onCommentLiked(BuildContext context,NotificationState notification){
  if(notification.parentId != null){
    if(notification.questionId != null){
      Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplayQuestionPage(
              questionId: notification.questionId!,
              parentId: notification.parentId,
            )
          )
        );
    }
    else{
      Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplaySolutionPage(
              solutionId: notification.solutionId!,
              parentId: notification.parentId,
            )
          )
        );
    }
  }
  else if(notification.questionId != null){
    Navigator
      .of(context)
      .push(
        MaterialPageRoute(
          builder: (context) => DisplayQuestionPage(
            questionId: notification.questionId!,
            parentId: notification.commentId,
          )
        )
      );
  }
  else{
    Navigator
      .of(context)
      .push(
        MaterialPageRoute(
          builder: (context) => DisplaySolutionPage(
            solutionId: notification.solutionId!,
            parentId: notification.commentId,
          )
        )
      );
  }
}
void _onCommentReplied(BuildContext context, NotificationState notification){
  if(notification.questionId != null){
    Navigator
      .of(context)
      .push(MaterialPageRoute(
        builder: (context) => DisplayQuestionPage(
          questionId: notification.questionId!,
          parentId: notification.parentId,
        ),
      ));
  }
  else{
    Navigator
      .of(context)
      .push(MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!,
          parentId: notification.parentId,
        ),
      ));
  }
}
void _onQuestionCommentCreated(BuildContext context, NotificationState notification){
  Navigator
    .of(context)
    .push(MaterialPageRoute(
      builder: (context) => DisplayQuestionPage(
        questionId: notification.questionId!,
        parentId: notification.commentId,
      ),
    ));
}
void _onQuestionLiked(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push( MaterialPageRoute(
      builder: (context) => DisplayQuestionPage(
        questionId: notification.questionId!,
      )
    ));
}
void _onQuestionSolved(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!
        )
      )
    );
}
void _onSolutionCommentCreated(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!,
          parentId: notification.commentId!,
        )
      )
    );
}
void _onSolutionCreated(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!
        )
      )
    );
}
void _onSolutionMarkedAsCorrect(BuildContext context, NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!
        )
      )
    );
}
void _onSolutionMarkedAsIncorrect(BuildContext context, NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!
        )
      )
    );
}
void _onSolutionWasDownvoted(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!
        )
      )
    );
}
void _onSolutionWasUpvoted(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => DisplaySolutionPage(
          solutionId: notification.solutionId!
        )
      )
    );
}
void _onUserFollowed(BuildContext context,NotificationState notification){
  Navigator
    .of(context)
    .push(
      MaterialPageRoute(
        builder: (context) => UserPage(
          userId: notification.userId
        )
      )
    );
}
void _onUserTaggedInComment(BuildContext context,NotificationState notification){
  if(notification.parentId != null){
    if(notification.questionId != null){
      Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplayQuestionPage(
              questionId: notification.questionId!,
              parentId: notification.parentId,
            )
          )
        );
    }
    else{
      Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplaySolutionPage(
              solutionId: notification.solutionId!,
              parentId: notification.parentId,
            )
          )
        );
    }
  }
  else if(notification.questionId != null){
    Navigator
      .of(context)
      .push(
        MaterialPageRoute(
          builder: (context) => DisplayQuestionPage(
            questionId: notification.questionId!,
            parentId: notification.commentId,
          )
        )
      );
  }
  else{
    Navigator
      .of(context)
      .push(
        MaterialPageRoute(
          builder: (context) => DisplaySolutionPage(
            solutionId: notification.solutionId!,
            parentId: notification.commentId,
          )
        )
      );
  }
}

Map<int,void Function(BuildContext,NotificationState)> notficationsActions = {
  NotificationType.commentLikedNotification: _onCommentLiked,
  NotificationType.commentRepliedNotification: _onCommentReplied,
  NotificationType.questionCommentCreatedNotification: _onQuestionCommentCreated,
  NotificationType.questionLikedNotification: _onQuestionLiked,
  NotificationType.questionSolvedNotification: _onQuestionSolved,
  NotificationType.solutionCommentCreatedNotification: _onSolutionCommentCreated,
  NotificationType.solutionCreatedNotification: _onSolutionCreated,
  NotificationType.solutionMarkedAsCorrectNotification: _onSolutionMarkedAsCorrect,
  NotificationType.solutionMarkedAsIncorrectNotification: _onSolutionMarkedAsIncorrect,
  NotificationType.solutionWasDownvotedNotification: _onSolutionWasDownvoted,
  NotificationType.solutionWasUpvotedNotification: _onSolutionWasUpvoted,
  NotificationType.userFollowedNotification: _onUserFollowed,
  NotificationType.userTaggedInCommentNotifcation: _onUserTaggedInComment
};


