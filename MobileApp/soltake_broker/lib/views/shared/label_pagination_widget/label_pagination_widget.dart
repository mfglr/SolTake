import 'package:flutter/widgets.dart';
import 'package:soltake_broker/views/shared/label_pagination_widget/label_pagination_item_widget.dart';
import 'package:soltake_broker/views/shared/label_pagination_widget/pagination_line_widget.dart';

class LabelPaginationWidget extends StatelessWidget {

  final Widget Function(bool,int) labelBuilder;
  final double page;
  final double width;
  final int initialPage;
  final int labelCount;
  final PageController pageController;

  const LabelPaginationWidget({
    super.key,
    required this.labelBuilder,
    required this.page,
    required this.labelCount,
    required this.width,
    required this.initialPage,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            labelCount, 
            (index) => Expanded(
              child: LabelPaginationItemWidget(
                labelBuilder: (isActive) => labelBuilder(isActive,index),
                isActive: page - 0.3 <= index && index <= page + 0.3,
                pageController: pageController,
                index: index,
              )
            )
          )
        ),
        PaginationLineWidget(width: width, pageCount: labelCount, initialPage: initialPage, page: page)
      ],
    );
  }
}