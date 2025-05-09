import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

Iterable<AIModelState> selectAIModels(Store<AppState> store, bool isDescending) =>
  store.state.aiModels.values.sorted(
    (x,y) => isDescending 
      ? x.solPerInputToken.compareTo(y.solPerInputToken)
      : y.solPerInputToken.compareTo(x.solPerInputToken)
    );