import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/packages/entity_state/entity_status.dart';
const _uploading = {
  Languages.en: "Uploading",
  Languages.tr: "Yükleniyor"
};

const _processing = {
  Languages.en: "Processing",
  Languages.tr: "İşleniyor"
};

const _uploadSuccess = {
  Languages.en: "Successful Uploading",
  Languages.tr: "Yükleme Başarılı"
};

const _uploadFailed = {
  Languages.en: "Uploading Failed",
  Languages.tr: "Yükeleme Başarısız"
};

const questionStatusToText = {
  EntityStatus.uploading: _uploading,
  EntityStatus.processing: _processing,
  EntityStatus.uploadSuccess: _uploadSuccess,
  EntityStatus.uploadFailed: _uploadFailed
};