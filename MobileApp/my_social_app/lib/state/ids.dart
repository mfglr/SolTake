import 'package:flutter/material.dart';
import 'package:my_social_app/constants/records_per_page.dart';

@immutable
class Ids{
  final bool isLast;
  final int? lastId;
  final List<int> ids;

  const Ids({
    required this.ids,
    required this.isLast,
    required this.lastId
  });

  Ids init(List<int> idsAdded) => Ids(
    ids: idsAdded,
    isLast: idsAdded.length < recordsPerPage,
    lastId: idsAdded.isNotEmpty ? idsAdded[idsAdded.length - 1] : lastId
  );

  Ids nextPage(List<int> idsAdded) => Ids(
    ids: ids.followedBy(idsAdded).toList(),
    isLast: idsAdded.length < recordsPerPage,
    lastId: idsAdded.isNotEmpty ? idsAdded[idsAdded.length - 1] : lastId
  );

  Ids add(int id) => Ids(
    ids: [id, ...ids],
    isLast: isLast, 
    lastId: lastId
  );

  Ids remove(int id) => Ids(
    ids: ids.where((item) => item != id).toList(),
    isLast: isLast,
    lastId: lastId
  );
}