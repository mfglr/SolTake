import 'package:http/http.dart' as http;
import 'package:my_social_app/Exceptions/backend_exception.dart';
import 'package:my_social_app/initiliaze.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/login_service.dart';
import 'package:my_social_app/services/storage/storage.dart';

class HttpIntercepter extends http.BaseClient{
  final http.Client _inner;
  HttpIntercepter(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {

    final Storage storage = getIt<Storage>();
    final LoginService loginService = getIt<LoginService>();

    if(account != null){
      request.headers.addAll( { "Authorization" : "Bearer ${account!.token.accessToken}" } );
    }

    final response = await _inner.send(request);

    if(response.statusCode >= 400){
      switch(response.statusCode){
        case(401):
          account = await loginService.loginByReshtoken(account!.id, account!.token.refreshToken);
          storage.setLoginResponse(account!);
          return await send(request);
        case(419):
          storage.removeLoginResponse();
          throw BackendException(await response.stream.bytesToString());
        default:
          throw BackendException(await response.stream.bytesToString());
      }
    }

    return response;
  }

}