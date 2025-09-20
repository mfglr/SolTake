import 'package:flutter/widgets.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/base_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/upload_status.dart';

@immutable
class UploadableContainer<K, V> extends BaseContainer<K>{
  final V? entity;
  final UploadStatus status;
  final double rate;

  String get rateToString => "${(rate * 100).round()} %";
  
  const UploadableContainer._({
    required super.key,
    required this.entity,
    required this.status,
    required this.rate
  });

  const UploadableContainer({required super.key}) :
    entity = null,
    status = UploadStatus.pending,
    rate = 0;

  UploadableContainer<K, V> uploading(V entity) =>
    UploadableContainer<K, V>._(
      key: key,
      entity: entity,
      status: UploadStatus.uploading,
      rate: rate
    );
  UploadableContainer<K, V> changeRate(double rate) =>
    UploadableContainer<K, V>._(
      key: key, 
      entity: entity,
      status: status,
      rate: rate
    );
  UploadableContainer<K, V> processing() =>
    UploadableContainer<K, V>._(
      key: key,
      entity: entity,
      status: UploadStatus.processing,
      rate: rate
    );
  UploadableContainer<K, V> failed() =>
    UploadableContainer<K, V>._(
      key: key,
      entity: entity,
      status: UploadStatus.failed,
      rate: rate
    );
  UploadableContainer<K, V> reupload() =>
    status == UploadStatus.failed
      ? UploadableContainer<K, V>._(
          key: key,
          entity: entity,
          status: UploadStatus.uploading,
          rate: rate
        )
      : this;
}