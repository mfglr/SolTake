import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_widget.dart';

class SolutionContainerLoadingWidget extends StatelessWidget {
  const SolutionContainerLoadingWidget({super.key});


  Widget _buildLoadingRectangle({double width = 110, double height = 18}) =>
    SizedBox(
      height: height,
      width: width,
      child: LoadingWidget(
        borderRadius: height / 2,
      )
    );

  @override
  Widget build(BuildContext context) {
    const double margin = 8;
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin, bottom: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: margin),
                      child: const LoadingCircleWidget(
                        diameter: 45,
                      ),
                    ),
                    _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
                  ],
                ),
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: margin),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3 / 5,
              child: const LoadingWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:margin, right: margin, top: margin,bottom: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4),
                _buildLoadingRectangle(width: MediaQuery.of(context).size.width * 1 / 4)
              ],
            ),
          ),
        ],
      ),
    );
  }
}