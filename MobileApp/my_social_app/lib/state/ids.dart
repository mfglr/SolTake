import 'package:flutter/material.dart';
import 'package:my_social_app/constants/records_per_page.dart';

@immutable
class Ids{
  final bool isLast;
  final int? lastId;
  final Iterable<int> ids;

  const Ids({
    required this.ids,
    required this.isLast,
    required this.lastId
  });

  Ids init(Iterable<int> idsAdded) => Ids(
    ids: idsAdded,
    isLast: idsAdded.length < recordsPerPage,
    lastId: idsAdded.isNotEmpty ? idsAdded.last : lastId
  );

  Ids nextPage(Iterable<int> idsAdded) => Ids(
    ids: ids.followedBy(idsAdded),
    isLast: idsAdded.length < recordsPerPage,
    lastId: idsAdded.isNotEmpty ? idsAdded.last : lastId
  );

  Ids lastPage(Iterable<int> idsAddded) => Ids(
    ids: ids.followedBy(idsAddded),
    isLast: true,
    lastId: lastId
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