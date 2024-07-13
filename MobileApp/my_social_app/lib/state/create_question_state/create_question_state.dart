import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

enum Exam{
  tyt,//Temel Yeterlilik Testi
  ayt,//Alan Yeterlilik Testi
  lgs,//Liselere Geçiş Sistemi
  dgs,//Dikey Geçiş Sınavı
}

enum Subject{
  almanca,
  biyoloji,
  cografya,
  cografya1,
  cografya2,
  din,
  edebiyat,
  felsefe,
  psikoloji,
  sosyoloji,
  mantik,
  fenbilimleri,
  fizik,
  geometri,
  kimya,
  matematik,
  tarih,
  tarih1,
  tarih2,
  turkce,
  ingilizce,
  yabancidil,
  inkilap,
  vatandaslik,
  guncelbilgi,
}

@immutable
class CreateQuestionState{
  final List<XFile> images;
  final Exam? exam;
  final Subject? subject;
  final List<int> topicIds;
  final String? content;

  const CreateQuestionState({
    required this.images,
    required this.exam,
    required this.subject,
    required this.topicIds,
    required this.content
  });

  CreateQuestionState addImage(XFile image)
    => CreateQuestionState(
        images: images.followedBy([image]).toList(),
        exam: exam,
        subject: subject,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState changeActiveIndex(int activeIndex)
    => CreateQuestionState(
        images: images,
        exam: exam,
        subject: subject,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState removeImage(XFile image)
    => CreateQuestionState(
        images: images.where((e) => e != image).toList(),
        exam: exam,
        subject: subject,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState updateContent(String content)
    => CreateQuestionState(
        images: images,
        exam: exam,
        subject: subject,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState updateExam(Exam exam)
    => CreateQuestionState(
        images: images,
        exam: exam,
        subject: subject,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState updateSubject(Subject subject)
    => CreateQuestionState(
        images: images,
        exam: exam,
        subject: subject,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState addTopicId(int topicId)
    => CreateQuestionState(
        images: images,
        exam: exam,
        subject: subject,
        topicIds: topicIds.followedBy([topicId]).toList(),
        content: content
      );
  CreateQuestionState removeTopicId(int topicId)
    => CreateQuestionState(
        images: images,
        exam: exam,
        subject: subject,
        topicIds: topicIds.where((e) => e != topicId).toList(),
        content: content
      );
}