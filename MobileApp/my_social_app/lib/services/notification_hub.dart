import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/notification_functions.dart';
import 'package:my_social_app/models/comment.dart';
import 'package:my_social_app/models/comment_user_like.dart';
import 'package:my_social_app/models/follow.dart';
import 'package:my_social_app/models/notification.dart';
import 'package:my_social_app/models/question_user_like.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/models/solution_user_vote.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class NotificationHub{
  late final HubConnection _hubConnection; 
  late final StreamSubscription<HubConnectionState> _stateConsumer;
    
  HubConnection get hubConnection => _hubConnection;

  NotificationHub._(Store<AppState> store){
    _hubConnection = HubConnectionBuilder()
      .withUrl("${dotenv.env['API_URL']}/notification?access_token=${store.state.accessToken}")
      .build();
      
    _stateConsumer = _hubConnection.stateStream
      .distinct()
      .listen((state){
        if(state == HubConnectionState.Connected){
          store.dispatch(const GetUnviewedNotificationsAction());
        }
      });
  }
  static NotificationHub? _singleton;
  factory NotificationHub() => _singleton!;

  static Future init(Store<AppState> store) async {
    if(_singleton != null){
      _singleton!._off();
      await _singleton!._stateConsumer.cancel();
      await _singleton!._hubConnection.stop();
    }
    _singleton = NotificationHub._(store);
    await _singleton!._hubConnection.start();
    _singleton!._on(store);
  }
  
  static Future close() async{
    if(_singleton != null){
      _singleton!._off();
      await _singleton!._stateConsumer.cancel();
      await _singleton!._hubConnection.stop();
    }
  }

  void _off(){
    _hubConnection.off(getQuestionCommentCreatedNotification);
    _hubConnection.off(getSolutionCommentCreatedNotification);
    _hubConnection.off(getCommentRepliedNotification);
    _hubConnection.off(getQuestionLikedNotification);
    _hubConnection.off(getSolutionWasUpvotedNotification);
    _hubConnection.off(getSolutionWasDownvotedNotification);
    _hubConnection.off(getSolutionMarkAsIncorrectNotification);
    _hubConnection.off(getSolutionMarkAsCorrectNotification);
    _hubConnection.off(getUserFollowedNotification);
    _hubConnection.off(getQuestionSolvedNotification);
    _hubConnection.off(getSolutionCreatedNotification);
    _hubConnection.off(getCommentLikedNotification);
    _hubConnection.off(getUserTagInCommentNotification);
  }

  void _on(Store<AppState> store){
    //QuestionCommentCreatedNotification
  _hubConnection.on(
    getQuestionCommentCreatedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;

      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final comment = Comment.fromJson(list[1] as dynamic).toCommentState();

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddNewQuestionCommentAction(questionId: comment.questionId!, commentId: comment.id));
      store.dispatch(AddCommentAction(comment: comment));
      store.dispatch(AddUserImageAction(image: UserImageState.init(comment.appUserId)));
    }
  );
  //SolutionCommentCreatedNotification
  _hubConnection.on(
    getSolutionCommentCreatedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;

      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final comment = Comment.fromJson(list[1] as dynamic).toCommentState();

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddNewSolutionCommentAction(solutionId: comment.solutionId!, commentId: comment.id));
      store.dispatch(AddCommentAction(comment: comment));
      store.dispatch(AddUserImageAction(image: UserImageState.init(comment.appUserId)));
    }
  );
  //CommentRepliedNotification
  _hubConnection.on(
    getCommentRepliedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;
      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final comment = Comment.fromJson(list[1] as dynamic).toCommentState();

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddNewCommentReplyAction(commentId: comment.parentId!,replyId: comment.id));
      store.dispatch(AddCommentAction(comment: comment));
      store.dispatch(AddUserImageAction(image: UserImageState.init(comment.appUserId)));
    }
  );
  //QuestionLikedNotification
  _hubConnection.on(
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
  //CommentLikedNotification
  _hubConnection.on(
    getCommentLikedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;

      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final like = CommentUserLike.fromJson(list[1] as dynamic);

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddCommentUserLikeAction(like: like.toCommentUserLikeState()));
      store.dispatch(AddUserAction(user: like.appUser!.toUserState()));
      store.dispatch(AddUserImageAction(image: UserImageState.init(like.appUserId)));
      store.dispatch(AddNewCommentLikeAction(commentId: notification.commentId!, likeId:like.id));
    }
  );
  //SolutionCreatedNotification
  _hubConnection.on(
    getSolutionCreatedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;

      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final solution = Solution.fromJson(list.last as dynamic).toSolutionState();

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddNewQuestionSolutionAction(questionId: solution.questionId, solutionId: solution.id));
      store.dispatch(AddSolutionAction(solution: solution));
      store.dispatch(AddUserImageAction(image: UserImageState.init(solution.appUserId)));
    }
  );
  //UserFollowedNotification
  _hubConnection.on(
    getUserFollowedNotification,
    (list){
      if(list == null || list.length != 2 || list.any((e) => e == null)) return;

      final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
      final follow = Follow.fromJson(list[1] as dynamic);
      final followState = follow.toFollowState();

      store.dispatch(PrependNotificationAction(notification: notification));
      store.dispatch(AddFollowAction(follow: followState));
      store.dispatch(AddNewFollowerAction(curentUserId: follow.followedId,followerId: follow.followerId,followId: follow.id));
    }
  );
  //SolutionMarkAsIncorrectNotification
  _hubConnection
    .on(
      getSolutionMarkAsIncorrectNotification,
      (list){
        if(list == null || list.length != 1 || list.any((e) => e == null)) return;

        final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();

        store.dispatch(PrependNotificationAction(notification: notification));
        store.dispatch(MarkSolutionAsIncorrectSuccessAction(solutionId: notification.solutionId!));
        store.dispatch(MarkQuestionSolutionAsIncorrectAction(questionId:notification.questionId!,solutionId:notification.solutionId!));
      }
    );
  //SolutionMarkAsCorrectNotification
  _hubConnection
    .on(
      getSolutionMarkAsCorrectNotification,
      (list){
        if(list == null || list.length != 1 || list.any((e) => e == null)) return;

        final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
        
        store.dispatch(PrependNotificationAction(notification: notification));
        store.dispatch(MarkSolutionAsCorrectSuccessAction(solutionId: notification.solutionId!));
        store.dispatch(MarkQuestionSolutionAsCorrectAction(questionId: notification.questionId!,solutionId: notification.solutionId!));
        store.dispatch(MarkUserQuestionAsSolvedAction(userId: notification.appUserId, questionId: notification.questionId!));
      }
    );
  //getQuestionSolvedNotification
  _hubConnection
    .on(
      getQuestionSolvedNotification,
      (list){
        if(list == null || list.length != 1 || list.any((e) => e == null)) return;
        final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
        store.dispatch(PrependNotificationAction(notification: notification));
      }
    );
  //SolutionWasUpvotedNotification
  _hubConnection
    .on(
      getSolutionWasUpvotedNotification,
      (list){
        if(list == null || list.length != 2 || list.any((e) => e == null)) return;

        final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
        final vote = SolutionUserVote.fromJson(list[1] as dynamic);
        final voteState = vote.toSolutionUserVoteState();

        store.dispatch(PrependNotificationAction(notification: notification));
        store.dispatch(AddSolutionUserVoteAction(vote: voteState));
        store.dispatch(AddNewSolutionUpvoteAction(solutionId: notification.solutionId!, voteId: vote.id));
        store.dispatch(AddUserAction(user: vote.appUser!.toUserState()));
        store.dispatch(AddUserImageAction(image: UserImageState.init(vote.appUserId)));
      }
    );
  //SolutionWasDownvotedNotification
  _hubConnection
    .on(
      getSolutionWasDownvotedNotification,
      (list){
        if(list == null || list.length != 2 || list.any((e) => e == null)) return;

        final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
        final vote = SolutionUserVote.fromJson(list[1] as dynamic);
        final voteState = vote.toSolutionUserVoteState();

        store.dispatch(PrependNotificationAction(notification: notification));
        store.dispatch(AddSolutionUserVoteAction(vote: voteState));
        store.dispatch(AddNewSolutionDownvoteAction(solutionId: notification.solutionId!, voteId: vote.id));
        store.dispatch(AddUserAction(user: vote.appUser!.toUserState()));
        store.dispatch(AddUserImageAction(image: UserImageState.init(vote.appUserId)));
      }
    );
  //UserTagInCommentNotification
  _hubConnection
    .on(
      getUserTagInCommentNotification,
      (list){
        if(list == null || list.length != 2 || list.any((e) => e == null)) return;

        final notification = Notification.fromJson((list[0] as dynamic)).toNotificationState();
        final comment = Comment.fromJson(list[1] as dynamic).toCommentState();

        store.dispatch(PrependNotificationAction(notification: notification));
        store.dispatch(AddCommentAction(comment: comment));
        store.dispatch(AddUserImageAction(image: UserImageState.init(comment.appUserId)));
        if(comment.questionId != null){
          store.dispatch(AddNewQuestionCommentAction(questionId: comment.questionId!, commentId: comment.id));
        }
        else if(comment.solutionId != null){
          store.dispatch(AddNewSolutionCommentAction(solutionId: comment.questionId!, commentId: comment.id));
        }
        else{
          store.dispatch(AddNewCommentReplyAction(commentId: comment.parentId!,replyId: comment.id));
        }
      }
    );
  }

}