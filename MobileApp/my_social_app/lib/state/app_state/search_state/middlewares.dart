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

void getFirstPageSearchingUsersIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetFirstPageSearchingUsersIfNoPageAction){
    final key = store.state.searchState.key;
    if(key != ""){
      final pagination = store.state.searchState.users;
      if(!pagination.isLast && !pagination.hasAtLeastOnePage){
        store.dispatch(const GetFirstPageSearchingUsersAction());
      }
    }
  }
  next(action);
}
void getFirstPageSearchingUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetFirstPageSearchingUsersAction){
    final key = store.state.searchState.key;
    UserService()
      .search(key, const Page(offset: null, take: usersPerPage, isDescending: true))
      .then((users){
        store.dispatch(AddFirstPageSearchingUsersAction(userIds: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      });
  }
  next(action);
}
void getNextPageSearchingUsersIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchingUsersIfReadyAction){
    final pagination = store.state.searchState.users;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageSearchingUsersAction());
    }
  }
  next(action);
}
void getNextPageSearchingUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchingUsersAction){
    final key = store.state.searchState.key;
    final pagination = store.state.searchState.users;
    UserService()
      .search(key, pagination.next)
      .then((users){
        store.dispatch(AddNextPageSearchingUsersAction(userIds: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      });
  }
  next(action);
}


void getFirstPageSearchingQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetFirstPageSearhingQuestionsIfNoPageAction){
    final pagination = store.state.searchState.questions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(const GetFirstPageSearchingQuestionsAction());
    }
  }
  next(action);
}
void getFirstPageSearchingQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetFirstPageSearchingQuestionsAction){
    final state = store.state.searchState;
    QuestionService()
      .searchQuestions(state.key, state.examId, state.subjectId, state.topicId, const Page(isDescending: true,offset: null,take: questionsPerPage))
      .then((questions){
        store.dispatch(AddFirstPageSearchingQuestionsAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}
void getNextPageSearchingQuestionsIfReadyMiddleare(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchingQuestionsIfReadyAction){

    final pagination = store.state.searchState.questions;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageSearchingQuestionsAction());
    }
  }
  next(action);
}
void getNextPageSearchingQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchingQuestionsAction){
    final state = store.state.searchState;
    QuestionService()
      .searchQuestions(state.key, state.examId, state.subjectId, state.topicId, state.questions.next)
      .then((questions){
        store.dispatch(AddNextPageSearchingQuestionsAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}

void getNextPageSearchedUsersIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchedUsersIfNoPageAction){
    final pagination = store.state.searchState.searchedUsers;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(const GetNextPageSearchedUsersAction());
    }
  }
  next(action);
}
void getNextPageSearchedUsersIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchedUsersIfNoPageAction){
    final pagination = store.state.searchState.searchedUsers;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageSearchedUsersAction());
    }
  }
  next(action);
}
void getNextPageSearchedUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchedUsersAction){
    final pagination = store.state.searchState.searchedUsers;
    UserService()
      .getSearcheds(pagination.next)
      .then((searchs){
        store.dispatch(AddNextPageSearchedUsersAction(searchIds: searchs.map((e) => e.id)));
        store.dispatch(AddUserSearchsAction(searchs: searchs.map((e) => e.toUserSearchState())));
        store.dispatch(AddUsersAction(users: searchs.map((e) => e.searched!.toUserState())));
        store.dispatch(AddUserImagesAction(images: searchs.map((e) => UserImageState.init(e.searchedId))));
      });
  }
  next(action);
}
void addSearchedUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is AddSearchedUserAction){
    UserService()
      .addSearched(action.userId)
      .then((search){
        store.dispatch(AddSearchedUserSuccessAction(searchId: search.id));
        store.dispatch(AddUserSearchAction(search: search.toUserSearchState()));
      });
  }
  next(action);
}
void removeSearchedUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveSearchedUserAction){
    UserService()
      .removeSearched(action.searchedId)
      .then((_){
        final accountId = store.state.accountState!.id;
        final search = store.state.userSearchEntityState.select(accountId, action.searchedId);
        if(search == null) return;
        store.dispatch(RemoveSearcedUserSuccessAction(searchId: search.id));
        store.dispatch(RemoveUserSearchAction(searchId: search.id));
      });
  }
  next(action);
}
