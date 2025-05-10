import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/transaction_state/transaction_state.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionState transaction;
  const TransactionWidget({
    super.key,
    required this.transaction
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: const EdgeInsets.only(right: 8),
                  child: MultimediaGrid(
                    state: transaction.aiModelImage,
                    blobServiceUrl: AppClient.blobService,
                    noMediaPath: noMediaAssetPath,
                    notFoundMediaPath: noMediaAssetPath
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const FaIcon(
                              FontAwesomeIcons.robot,
                              size: 15,
                            ),
                          ),
                          Text(
                            transaction.aiModelName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(
                            Icons.input,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const FaIcon(
                            FontAwesomeIcons.coins,
                            color: Colors.amber,
                            size: 15,
                          ),
                        ),
                        Text(
                          "${transaction.numberOfInputToken * transaction.solPerInputToken} sol",
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(
                            Icons.output,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const FaIcon(
                            FontAwesomeIcons.coins,
                            color: Colors.amber,
                            size: 15,
                          ),
                        ),
                        Text(
                          "${transaction.numberOfOutputToken * transaction.solPerOutputToken} sol",
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Icon(
                              Icons.receipt,
                              size: 15,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const FaIcon(
                              FontAwesomeIcons.coins,
                              color: Colors.amber,
                              size: 15,
                            ),
                          ),
                          Text(
                            "${transaction.sol} sol",
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 3),
                  child: const FaIcon(
                    FontAwesomeIcons.clock,
                    size: 15,
                  ),
                ),
                AppDateWidget(
                  dateTime: transaction.createdAt,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}