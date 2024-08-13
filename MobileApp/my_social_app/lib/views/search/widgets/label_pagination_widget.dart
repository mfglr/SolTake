import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/views/search/widgets/label_pagination_item_widget.dart';
import 'package:my_social_app/views/search/widgets/pagination_line_widget.dart';

class LabelPaginationWidget extends StatelessWidget {

  final Iterable<String> labels;
  final double page;
  final double width;
  final int initialPage;
  final PageController pageController;

  const LabelPaginationWidget({
    super.key,
    required this.labels,
    required this.page,
    required this.width,
    required this.initialPage,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: labels
            .mapIndexed((index,e) => Expanded(
              child: LabelPaginationItemWidget(
                label: e,
                countOfLabel: labels.length,
                isActive: page - 0.3 <= index && index <= page + 0.3,
                pageController: pageController,
                index: index,
                width: width,
              )
            ))
            .toList() 
        ),
        PaginationLineWidget(width: width, pageCount: labels.length, initialPage: initialPage, page: page)
      ],
    );
  }
}