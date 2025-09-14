import 'package:my_social_app/state/balance_state/actions.dart';
import 'package:my_social_app/state/balance_state/balance_state.dart';
import 'package:redux/redux.dart';

BalanceState loadBalanceSuccessReducer(BalanceState prev, LoadBalanceSuccessAction action)
  => action.balance;


Reducer<BalanceState> balanceReducers = combineReducers([
  TypedReducer<BalanceState,LoadBalanceSuccessAction>(loadBalanceSuccessReducer).call
]);