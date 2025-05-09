import 'package:flutter/material.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/sorting_menu_widget/sorting_menu_widget_texts.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class SortingMenuWidget extends StatelessWidget {
  final bool isDescending;
  final void Function() changeIsDescending;
  const SortingMenuWidget({
    super.key,
    required this.changeIsDescending,
    required this.isDescending
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: changeIsDescending,
      child: Row(
        children: [
          LanguageWidget(
            child: (language) => Text(
              sorting[language]!,
            ),
          ),
          Icon(
            isDescending ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          )
        ],
      )
    );
  }
}