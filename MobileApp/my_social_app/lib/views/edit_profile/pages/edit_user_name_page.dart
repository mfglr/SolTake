import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_social_app/constants/valid_user_name_characters.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class EditUserNamePage extends StatefulWidget {
  final UserState user; 
  const EditUserNamePage({super.key,required this.user});

  @override
  State<EditUserNamePage> createState() => _EditUserNamePageState();
}

class _EditUserNamePageState extends State<EditUserNamePage> {
  final TextEditingController _controller = TextEditingController();
  late String _oldUserName;
  bool isExist = true;
  bool loading = false;

  void Function()? _generateApprover(){
    return !isExist && 
    _controller.text != _oldUserName && 
    _controller.text.isNotEmpty ? 
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(UpdateUserNameAction(userName: _controller.text));
        Navigator.of(context).pop();
      } : 
      null;
  }

  @override
  void initState() {
    _controller.text = widget.user.userName;
    _oldUserName = widget.user.userName;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        actions: [
          TextButton(
            onPressed: _generateApprover(),
            child: loading ? 
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2)
              ) : 
              const Icon(Icons.check)
          )
        ],
        title: const Text(
          "Edit User Name",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
              onChanged: (value) => setState(() {
                if(value.isNotEmpty && !validUserNameChracters.contains(value[value.length - 1])){
                  ToastCreator.displayError("Invalid character!!!",length: Toast.LENGTH_SHORT);
                  _controller.text = value.substring(0,value.length - 1);
                  return;
                }
                if(value == "") return;
                loading = true;
                AccountService()
                  .isUserNameExist(value)
                  .then((value) => setState(() {
                    isExist = value;
                    loading = false;
                  }));
              }),
            )
          ],
        ),
      ),
    );
  }
}