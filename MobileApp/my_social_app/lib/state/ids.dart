import 'package:flutter/material.dart';

@immutable
class Ids{
  final int recordsPerPage;
  final bool isLast;
  final int? lastId;
  final Iterable<int> ids;

  const Ids({
    required this.recordsPerPage,
    required this.ids,
    required this.isLast,
    required this.lastId
  });
 
  Ids init(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: ids,
      isLast: ids.length < recordsPerPage,
      lastId: ids.isNotEmpty ? ids.last : lastId
    );

  Ids appendMany(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...this.ids,...ids],
      isLast: isLast,
      lastId: lastId
    );

  Ids prependMany(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...ids,...this.ids],
      isLast: isLast,
      lastId: lastId
    );

  Ids nextPage(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...this.ids,...ids],
      isLast: ids.length < recordsPerPage,
      lastId: ids.isNotEmpty ? ids.last : lastId
    );

  Ids lastPage(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...this.ids,...ids],
      isLast: true,
      lastId: ids.isNotEmpty ? ids.last : lastId
    );

  Ids prependOne(int id)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [id, ...ids],
      isLast: isLast, 
      lastId: ids.isEmpty ? id : lastId
    );

  Ids appendOne(int id)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...ids,id],
      isLast: isLast,
      lastId: lastId
    );

  Ids remove(int id)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: ids.where((item) => item != id),
      isLast: isLast,
      lastId: lastId
    );
}