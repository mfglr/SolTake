import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/utilities/toast_creator.dart';

void handleErrors(Object error){
  if(error is BackendException){
    ToastCreator.displayError(error.message);
  }
  else{
    ToastCreator.displayError(error.toString());
  }
}