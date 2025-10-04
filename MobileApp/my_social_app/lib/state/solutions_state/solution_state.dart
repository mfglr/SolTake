import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';
import 'package:my_social_app/state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/solutions_state/solution_status.dart';
import 'package:my_social_app/state/users_state/user_state.dart';

class SolutionState extends Entity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int userId;
  final bool isOwner;
  final bool isSaved;
  final String userName;
  final String? content;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final int numberOfDownvotes;
  final int state;
  final Iterable<Media> medias;
  final int numberOfComments;
  final bool doesBelongToQuestionOfCurrentUser;
  final Media? image;
  final bool isCreatedByAI;
  final String? aiModelName;
  final Media? aiImage;

  @override
  int get avatarId => userId;
  @override
  Media? get avatar => image;

  int get findFirstVideoIndex {
    for(var i = 0; i < medias.length; i++){
      if(medias.elementAt(i).type == MultimediaType.video){
        return i;
      }
    }
    return -1;
  }

  SolutionState({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.userId,
    required this.isOwner,
    required this.isSaved,
    required this.userName,
    required this.content,
    required this.isUpvoted,
    required this.numberOfUpvotes,
    required this.isDownvoted,
    required this.numberOfDownvotes,
    required this.medias,
    required this.numberOfComments,
    required this.state,
    required this.doesBelongToQuestionOfCurrentUser,
    required this.image,
    required this.isCreatedByAI,
    required this.aiModelName,
    required this.aiImage
  });

  factory SolutionState.create({
    required int id,
    required int userId,
    required String userName,
    required Media? image,
    required int questionId,
    required String content,
    required bool doesBelongToQuestionOfCurrentUser,
    required Iterable<LocalMedia> medias,
  }) =>
    SolutionState(
      id: id,
      createdAt: DateTime.now(),
      updatedAt: null,
      questionId: questionId,
      userId: userId,
      isOwner: true,
      isSaved: false,
      userName: userName,
      content: content,
      isUpvoted: false,
      numberOfUpvotes: 0,
      isDownvoted: false,
      numberOfDownvotes: 0,
      medias: medias,
      numberOfComments: 0,
      state: SolutionStatus.pending,
      doesBelongToQuestionOfCurrentUser: doesBelongToQuestionOfCurrentUser,
      image: image,
      isCreatedByAI: false,
      aiModelName: null,
      aiImage: null
    ); 

  factory SolutionState.createByAi({
    required int id,
    required UserState user,
    required QuestionState question,
    required AIModelState aiModel,
    required String content,
  }) =>
    SolutionState(
      id: id,
      createdAt: DateTime.now(),
      updatedAt: null,
      questionId: question.id,
      userId: user.id,
      isOwner: true,
      isSaved: false,
      userName: user.userName,
      content: content,
      isUpvoted: false,
      numberOfUpvotes: 0,
      isDownvoted: false,
      numberOfDownvotes: 0,
      medias: [],
      numberOfComments: 0,
      state: SolutionStatus.pending,
      doesBelongToQuestionOfCurrentUser: question.isOwner,
      image: user.image,
      isCreatedByAI: true,
      aiModelName: aiModel.name,
      aiImage: aiModel.image
    );
  SolutionState createByAiSuccess({
    required int id,
    required String content
  }) => 
    _optional(
      newId: id,
      newContent: content
    );

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  bool get hasVideo => medias.any((e) => e.type == MultimediaType.video);

  SolutionState _optional({
    int? newId,
    String? newUserName,
    String? newContent,
    bool? newIsSaved,
    bool? newIsUpvoted,
    int? newNumberOfUpvotes,
    bool? newIsDownvoted,
    int? newNumberOfDownvotes,
    Iterable<Media>? newMedias,
    int? newNumberOfComments,
    int? newState,
    Media? newImage,
  })
    => SolutionState(
        id: newId ?? id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        userId: userId,
        isOwner: isOwner,
        isSaved: newIsSaved ?? isSaved,
        userName: newUserName ?? userName,
        content: newContent ?? content,
        isUpvoted: newIsUpvoted ?? isUpvoted,
        numberOfUpvotes: newNumberOfUpvotes ?? numberOfUpvotes,
        isDownvoted: newIsDownvoted ?? isDownvoted,
        numberOfDownvotes: newNumberOfDownvotes ?? numberOfDownvotes,
        medias: newMedias ?? medias,
        numberOfComments: newNumberOfComments ?? numberOfComments,
        state: newState ?? state,
        doesBelongToQuestionOfCurrentUser: doesBelongToQuestionOfCurrentUser,
        image: newImage ?? image,
        isCreatedByAI: isCreatedByAI,
        aiModelName: aiModelName,
        aiImage: aiImage
      );

  SolutionState changeId(int id) =>
    _optional(newId: id);

  SolutionState makeUpvote() =>
    _optional(
      newIsUpvoted: true,
      newIsDownvoted: false,
      newNumberOfUpvotes: numberOfUpvotes + 1,
      newNumberOfDownvotes: isDownvoted ? numberOfDownvotes - 1 : numberOfDownvotes
    );
  SolutionState removeUpvote() =>
    _optional(
      newIsUpvoted: false,
      newNumberOfUpvotes: numberOfUpvotes - 1
    );
  
  SolutionState makeDownvote() =>
    _optional(
      newIsUpvoted: false,
      newIsDownvoted: true,
      newNumberOfUpvotes: isUpvoted ? numberOfUpvotes - 1 : numberOfUpvotes,
      newNumberOfDownvotes: numberOfDownvotes + 1
    );
  SolutionState removeDownvote() =>
    _optional(
      newIsDownvoted: false,
      newNumberOfDownvotes: numberOfDownvotes - 1
    );

  SolutionState markAsCorrect()
    => _optional(newState: SolutionStatus.correct);
  SolutionState markAsIncorrect()
    => _optional(newState: SolutionStatus.incorrect);  

  SolutionState save() => _optional(newIsSaved: true);
  SolutionState unsave() => _optional(newIsSaved: false);
}