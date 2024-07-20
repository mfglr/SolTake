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
 
  Ids init(Iterable<int> ids) => Ids(
    ids: ids,
    isLast: ids.length < recordsPerPage,
    lastId: ids.isNotEmpty ? ids.last : lastId
  );

  Ids nextPage(Iterable<int> ids) => Ids(
    ids: this.ids.followedBy(ids),
    isLast: ids.length < recordsPerPage,
    lastId: ids.isNotEmpty ? ids.last : lastId
  );

  Ids lastPage(Iterable<int> ids) => Ids(
    ids: this.ids.followedBy(ids),
    isLast: true,
    lastId: ids.isNotEmpty ? ids.last : lastId
  );

  Ids create(int id) => Ids(
    ids: [id, ...ids],
    isLast: isLast, 
    lastId: ids.isEmpty ? id : lastId
  );

  Ids remove(int id) => Ids(
    ids: ids.where((item) => item != id),
    isLast: isLast,
    lastId: lastId
  );
}