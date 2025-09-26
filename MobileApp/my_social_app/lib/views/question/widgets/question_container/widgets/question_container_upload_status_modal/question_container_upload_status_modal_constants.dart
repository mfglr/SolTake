import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/models/languages.dart';

const _failed = {
  Languages.en: "Uploading failed. Please click to try again.",
  Languages.tr: "Yükleme başarısız. Tekrar denemek için tıklayın."
};

const _uploading = {
  Languages.en: "Uploading ...",
  Languages.tr: "Yükleniyor ..."
};

const _processing = {
  Languages.en: "Processing ...",
  Languages.tr: "İşleniyor ..."
};

const contents = {
  EntityStatus.processing: _processing,
  EntityStatus.uploadFailed: _failed,
  EntityStatus.uploading: _uploading
};

