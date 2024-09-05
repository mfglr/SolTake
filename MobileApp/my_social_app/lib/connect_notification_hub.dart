import 'package:my_social_app/constants/notification_functions.dart';
import 'package:my_social_app/models/comment.dart';
import 'package:my_social_app/models/comment_user_like.dart';
import 'package:my_social_app/models/notification.dart';
import 'package:my_social_app/models/question_user_like.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_type.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void connectNotificationHub(Store<AppState> store){
  final hub = NotificationHub();

  hub.hubConnection
  .start()
  ?.then((_){
    store.dispatch(const GetUnviewedNotificationsAction());
  });

  hub.hubConnection.on(
    getQuestionLikedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;
      
      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final like = QuestionUserLike.fromJson(list[1] as dynamic);
      final likeState = like.toQuestionUserLikeState();

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddQuestionUserLikeAction(like: likeState));
      store.dispatch(AddNewQuestionLikeAction(questionId: like.questionId, likeId: like.id));
      store.dispatch(AddUserAction(user: like.appUser!.toUserState()));
      store.dispatch(AddUserImageAction(image: UserImageState.init(like.appUserId)));
    }
  );

  hub.hubConnection.on(
    getNotifications,
    (list){
      final notification = Notification.fromJson((list!.first as dynamic)).toNotificationState();
      
      if(notification.type == NotificationType.questionCommentCreatedNotification){
        final comment = Comment.fromJson(list.last as dynamic).toCommentState();
        store.dispatch(AddNewQuestionCommentSuccessAction(questionId: comment.questionId!, commentId: comment.id));
        store.dispatch(AddCommentAction(comment: comment));
        store.dispatch(AddUserImageAction(image: UserImageState.init(comment.appUserId)));
      }
      else if(notification.type == NotificationType.commentRepliedNotification){
      }
      else if(notification.type == NotificationType.solutionCreatedNotification){
        final solution = Solution.fromJson(list.last as dynamic).toSolutionState();
        store.dispatch(AddNewQuestionSolutionAction(questionId: solution.questionId, solutionId: solution.id));
        store.dispatch(AddSolutionAction(solution: solution));
        store.dispatch(AddUserImageAction(image: UserImageState.init(solution.appUserId)));
      }
      else if(notification.type == NotificationType.solutionMarkedAsCorrectNotification){
        store.dispatch(MarkSolutionAsCorrectSuccessAction(solutionId: notification.solutionId!));
        store.dispatch(MarkQuestionSolutionAsCorrectAction(questionId: notification.questionId!,solutionId: notification.solutionId!));
        store.dispatch(MarkUserQuestionAsSolvedAction(userId: notification.userId, questionId: notification.questionId!));
      }
      else if(notification.type == NotificationType.solutionMarkedAsIncorrectNotification){
        store.dispatch(MarkSolutionAsIncorrectSuccessAction(solutionId: notification.solutionId!));
      }
      else if(notification.type == NotificationType.commentLikedNotification){
        final comment = Comment.fromJson(list[1] as dynamic).toCommentState();
        final like = CommentUserLike.fromJson(list[2] as dynamic);
        final commentUserLikeState = like.toCommentUserLikeState();
        final user = like.appUser!.toUserState();
        
        store.dispatch(AddCommentUserLikeAction(like: commentUserLikeState));
        store.dispatch(AddUserAction(user: user));
        store.dispatch(AddUserImageAction(image: UserImageState.init(user.id)));
        store.dispatch(AddNewCommingCommentLikeAction(commentId: comment.id,likeId:like.id));
      }
      store.dispatch(PrependNotificationAction(notification: notification));
    }
  );
}