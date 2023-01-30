// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dokumentos/model/document_tag.dart';
import 'package:flutter/material.dart';

class DocDings {
  final String title;
  final int countFiles;
  final List<DocDingsTag> tags;
  final String notes;
  const DocDings({
    required this.title,
    required this.countFiles,
    required this.tags,
    required this.notes,
  });

  static const _testTag1 = DocDingsTag(color: Colors.yellow, title: "Rechnung");
  static const _testTag2 =
      DocDingsTag(color: Colors.red, title: "Lohnabrechnung");
  static const _testTag3 =
      DocDingsTag(color: Colors.green, title: "Versicherung");
  static const _testTag4 = DocDingsTag(color: Colors.blue, title: "Vertrag");

  static const tagList = [
    _testTag1,
    _testTag2,
    _testTag3,
    _testTag4,
  ];

  static const demo = [
    DocDings(title: "Doc1", countFiles: 5, tags: [_testTag1], notes: ""),
    DocDings(
        title: "Doc2",
        countFiles: 5,
        tags: [_testTag1, _testTag2, _testTag4],
        notes: ""),
    DocDings(
        title: "Doc3", countFiles: 5, tags: [_testTag3, _testTag1], notes: ""),
    DocDings(
        title: "Doc4", countFiles: 5, tags: [_testTag1, _testTag4], notes: ""),
  ];
}
