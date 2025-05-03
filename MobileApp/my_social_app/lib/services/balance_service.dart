import 'package:my_social_app/models/balance.dart';
import 'package:my_social_app/services/app_client.dart';

class BalanceService {
  static const _controllerName = "Balances";
  final AppClient _appClient;

  const BalanceService._(this._appClient);
  static final BalanceService _singleton = BalanceService._(AppClient());
  factory BalanceService() => _singleton;


  Future<Balance> getBalance(int id) =>
    _appClient
      .get("$_controllerName/GetBalance/$id")
      .then((json) => Balance.fromJson(json));
}