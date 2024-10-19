import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:my_social_app/state/app_state/user_search_state/actions.dart';
import 'package:my_social_app/state/pagination/page.dart';
import 'package:redux/redux.dart';

void firstSearchingUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FirstSearchingUsersAction){
    final key = store.state.searchState.key;
    UserService()
      .search(key, Page.init(usersPerPage, true))
      .then((users){
        store.dispatch(FirstSearchingUsersSuccessAction(userIds: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      })
      .catchError((e){
        store.dispatch(const FirstSearchingUsersFailedAction());
        throw e;
      });
  }
  next(action);
}
void nextSearchingUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSearchingUsersAction){
    final key = store.state.searchState.key;
    final pagination = store.state.searchState.users;
    UserService()
      .search(key, pagination.next)
      .then((users){
        store.dispatch(NextSearchingUsersSuccessAction(userIds: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      })
      .catchError((e){
        store.dispatch(const NextSearhcingUsersFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstSearchingQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FirstSearchingQuestionsAction){
    final state = store.state.searchState;
    QuestionService()
      .searchQuestions(state.examId, state.subjectId, state.topicId, Page.init(questionsPerPage, true))
      .then((questions){
        store.dispatch(FirstSearchingQuestionsSuccessAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(const FirstSearchingQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void nextSearchingQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSearchingQuestionsAction){
    final state = store.state.searchState;
    QuestionService()
      .searchQuestions(state.examId, state.subjectId, state.topicId, state.questions.next)
      .then((questions){
        store.dispatch(NextSearchingQuestionsSuccessAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(const NextSearchingQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void nextSearchedUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSearchedUsersAction){
    final pagination = store.state.searchState.searchedUsers;
    UserService()
      .getSearcheds(pagination.next)
      .then((searchs){
        store.dispatch(NextSearchedUsersSuccessAction(searchIds: searchs.map((e) => e.id)));
        store.dispatch(AddUserSearchsAction(searchs: searchs.map((e) => e.toUserSearchState())));
        store.dispatch(AddUsersAction(users: searchs.map((e) => e.searched!.toUserState())));
        store.dispatch(AddUserImagesAction(images: searchs.map((e) => UserImageState.init(e.searchedId))));
      })
      .catchError((e){
        store.dispatch(const NextSearchedUsersFailedAction());
        throw e;
      });
  }
  next(action);
}
void addSearchedUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is AddSearchedUserAction){
    final int searcherId = store.state.accountState!.id;
    UserService()
      .addSearcher(action.userId)
      .then((search){
        final searchId = store.state.userSearchEntityState.select(searcherId, action.userId)?.id ?? 0;
        store.dispatch(RemoveUserSearchAction(searchId: searchId));
        store.dispatch(AddUserSearchAction(search: search.toUserSearchState()));
        store.dispatch(AddSearchedUserSuccessAction(addedOne: search.id,removedOne: searchId));
        store.dispatch(AddUserConversationInOrderAction(userId: searcherId, id: action.userId));
      });
  }
  next(action);
}
void removeSearchedUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveSearchedUserAction){
    UserService()
      .removeSearcher(action.searchedId)
      .then((_){
        final accountId = store.state.accountState!.id;
        final searchId = store.state.userSearchEntityState.select(accountId, action.searchedId)?.id ?? 0;
        store.dispatch(RemoveSearcedUserSuccessAction(searchId: searchId));
        store.dispatch(RemoveUserSearchAction(searchId: searchId));
        store.dispatch(RemoveUserConversationAction(userId: accountId, id: action.searchedId));
      });
  }
  next(action);
}
