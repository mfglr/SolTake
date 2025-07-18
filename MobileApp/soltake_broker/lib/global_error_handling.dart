import 'package:soltake_broker/exceptions/backend_exception.dart';
import 'package:soltake_broker/utilities/toast_creator.dart';

void handleErrors(Object error){
  if(error is BackendException){
    ToastCreator.displayError(error.message);
  }
  else{
    const isProduction = bool.fromEnvironment('dart.vm.product');
    if(!isProduction){
      ToastCreator.displayError(error.toString());
    }
  }
}