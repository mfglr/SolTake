import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soltake_broker/models/languages.dart';

const _approved = {
  Languages.en: "Approved",
  Languages.tr: "Onaylandı"
};

const _pending = {
  Languages.en: "Pending",
  Languages.tr: "Beklemede"
};

const _rejected = {
  Languages.en: "Rejected",
  Languages.tr: "Reddedildi"
};

const status = [
  _approved,
  _pending,
  _rejected
];

const colors = [
  Colors.green,
  Colors.amber,
  Colors.red
];

const icons = [
  FontAwesomeIcons.check,
  FontAwesomeIcons.clock,
  FontAwesomeIcons.circleXmark
];