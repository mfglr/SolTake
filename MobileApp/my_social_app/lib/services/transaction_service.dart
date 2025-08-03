import 'package:my_social_app/models/transaction.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class TransactionService {
  final String _controllerName = "transactions";
  final AppClient _appClient;
  
  TransactionService._(this._appClient);
  static final TransactionService _singleton = TransactionService._(AppClient());
  factory TransactionService() => _singleton;

  Future<Iterable<Transaction>> getByBalanceId(int balanceId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/GetByBalanceId/$balanceId", page))
      .then((json) => json as Iterable)
      .then((itrerable) => itrerable.map((e) => Transaction.fromJson(e)));
}