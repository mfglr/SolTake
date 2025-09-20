import 'package:flutter/widgets.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/base_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/upload_status.dart';

@immutable
class UploadableContainer<V> implements BaseContainer {
  final String key;
  final V? entity;
  final UploadStatus status;
  final double rate;

  const UploadableContainer._({
    required this.key,
    required this.entity,
    required this.status,
    required this.rate
  });

  const UploadableContainer({required this.key}) :
    entity = null,
    status = UploadStatus.pending,
    rate = 0;

  UploadableContainer<V> uploading(V entity) =>
    UploadableContainer<V>._(
      key: key,
      entity: entity,
      status: UploadStatus.uploading,
      rate: rate
    );
  UploadableContainer<V> changeRate(double rate) =>
    UploadableContainer._(
      key: key, 
      entity: entity,
      status: status,
      rate: rate
    );
  UploadableContainer<V> processing() =>
    UploadableContainer._(
      key: key,
      entity: entity,
      status: UploadStatus.processing,
      rate: rate
    );
  UploadableContainer<V> success() =>
    UploadableContainer._(
      key: key,
      entity: entity,
      status: UploadStatus.success,
      rate: rate
    );
  UploadableContainer<V> failed() =>
    UploadableContainer._(
      key: key,
      entity: entity,
      status: UploadStatus.failed,
      rate: rate
    );
  UploadableContainer<V> reupload() =>
    status == UploadStatus.failed
      ? UploadableContainer<V>._(
          key: key,
          entity: entity,
          status: UploadStatus.uploading,
          rate: rate
        )
      : this;
}