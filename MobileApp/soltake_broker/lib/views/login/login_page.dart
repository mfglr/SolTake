import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/actions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailOrUserName;
  late final TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisibility = false;

  @override
  void initState() {
    _emailOrUserName = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailOrUserName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: _emailOrUserName,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: const TextStyle(
                        fontSize: 13
                      ),
                      decoration: InputDecoration(
                        hintText: "Email ya da kullanıcı adı",
                        border: const OutlineInputBorder()
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) return "Email gerekli!";
                        return null;
                      },
                    )
                  ),
              
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      obscureText: !_passwordVisibility,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _password,
                      style: const TextStyle(
                        fontSize: 13
                      ),
                      decoration: InputDecoration(
                        hintText: "şifre",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () => setState(() { _passwordVisibility = !_passwordVisibility; }),
                          icon: Icon(_passwordVisibility ? Icons.visibility : Icons.visibility_off),
                        )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty) return "Şifre gerekli!";
                        if(value.length < 6) return "Şifre 6 karakterden uzun olmalı!";
                        return null;
                      },
                    ),
                  ),
                
                  OutlinedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        store.dispatch(
                          LoginByPasswordAction(
                            emailOrUserName: _emailOrUserName.text,
                            password: _password.text
                          )
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text("Giriş Yap")
                        ),
                        const Icon(Icons.login)
                      ]
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}