import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GenerateTokenForm extends StatefulWidget {
  const GenerateTokenForm({super.key});

  @override
  State<GenerateTokenForm> createState() => _GenerateTokenFormState();
}

class _GenerateTokenFormState extends State<GenerateTokenForm> {
  late final TextEditingController _email;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(
                fontSize: 13
              ),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.login_form_email,
                border: const OutlineInputBorder(),
              ),
              validator: (value){
                if (value == null || value.isEmpty) return AppLocalizations.of(context)!.generate_token_form_email_required_error;
                return null;
              },
            ),
          ),
          
          OutlinedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Text(AppLocalizations.of(context)!.login_form_button)
                ),
                const Icon(Icons.login)
              ]
            )
          )
        ],
      ),
    );
  }
}