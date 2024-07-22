import 'package:my_social_app/exceptions/app_exception.dart';
import 'package:my_social_app/utilities/toast_creator.dart';

void handleErrors(Object error){
  if(error is AppException){
    ToastCreator.displayError(error.message);
  }
  else{
    ToastCreator.displayError(error.toString());
  }
}