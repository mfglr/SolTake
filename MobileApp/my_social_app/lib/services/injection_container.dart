import 'package:get_it/get_it.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/login_service.dart';
import 'package:my_social_app/services/storage/storage.dart';

final getIt = GetIt.instance;

Future registerServices() async {
  getIt.registerSingleton<Storage>(Storage());
  getIt.registerSingleton<AccountService>(AccountService());
  getIt.registerSingleton<LoginService>(LoginService());
}