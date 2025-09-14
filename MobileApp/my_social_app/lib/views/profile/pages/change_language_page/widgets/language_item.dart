import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/state.dart';

class LanguageItem extends StatelessWidget {
  final String content;
  final String language;
  final bool isSelected;
  
  const LanguageItem({
    super.key,
    required this.content,
    required this.language,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.black.withOpacity(0.3) : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(UpdateLanguageAction(language: language));
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(content),
            ],
          ),
        ),
      ),
    );
  }
}