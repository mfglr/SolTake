import 'package:flutter/material.dart';

@immutable
class Ids{
  final int recordsPerPage;
  final bool isLast;
  final dynamic lastValue;
  final Iterable<int> ids;

  const Ids({
    required this.recordsPerPage,
    required this.ids,
    required this.isLast,
    required this.lastValue
  });
 
  Ids init(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: ids,
      isLast: ids.length < recordsPerPage,
      lastValue: ids.isNotEmpty ? ids.last : lastValue
    );

  Ids appendMany(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...this.ids,...ids],
      isLast: isLast,
      lastValue: lastValue
    );

  Ids prependMany(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...ids,...this.ids],
      isLast: isLast,
      lastValue: lastValue
    );

  Ids nextPage(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...this.ids,...ids],
      isLast: ids.length < recordsPerPage,
      lastValue: ids.isNotEmpty ? ids.last : lastValue
    );

  Ids lastPage(Iterable<int> ids)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...this.ids,...ids],
      isLast: true,
      lastValue: ids.isNotEmpty ? ids.last : lastValue
    );

  Ids prependOne(int id)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [id, ...ids],
      isLast: isLast, 
      lastValue: ids.isEmpty ? id : lastValue
    );

  Ids prependOneAndRemovePrev(int id)
    => Ids(
        recordsPerPage: recordsPerPage,
        ids: [id,...ids.where((e) => e != id)],
        isLast: isLast,
        lastValue: lastValue
      );

  Ids appendOne(int id)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: [...ids,id],
      isLast: isLast,
      lastValue: lastValue
    );

  Ids remove(int id)
    => Ids(
      recordsPerPage: recordsPerPage,
      ids: ids.where((item) => item != id),
      isLast: isLast,
      lastValue: lastValue
    );
}