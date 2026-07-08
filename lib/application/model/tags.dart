import 'package:flutter/material.dart';

import '../../presentation/common/color_picker.dart';

class Tag {
  final String name;
  final Color? color;
  final Color? backgroundColor;
  bool override;

  Tag(
      {required this.name,
      required this.color,
      required this.backgroundColor,
      this.override = false});

  setOverride(bool override) {
    this.override = override;
  }
}

class TagName {
  static const String java = 'java';
  static const String spring = 'spring';
  static const String springsec = 'spring security';
  static const String dart = 'dart';
  static const String flutter = 'flutter';
  static const String react = 'react';

  static const String javaee = 'java-ee';
  static const String jsf = 'jsf';

  static const String postgresql = 'postgresql';
  static const String mysql = 'mysql';
  static const String impala = 'impala';
  static const String jooq = 'jooq';

  static const String azure = 'azure';
  static const String gcp = 'gcp';

  static const String spock = 'spock';
  static const String unitTesting = 'unit-test';
  static const String integrationTesting = 'integration-test';
  static const String e2eTesting = 'E2E-test';

  static const String git = 'git';
  static const String docker = 'docker';
  static const String kubernetes = 'kubernetes';
  static const String teamcity = 'teamcity';
  static const String gradle = 'gradle';
  static const String maven = 'maven';

  static const String rest = 'rest-api';
  static const String kafka = 'kafka';

  static const String vercel = 'vercel';
  static const String nextJS = 'next.js';
  static const String typescript = 'typescript';
  static const String figma = 'figma';

  static const String codex = 'codex';
  static const String chatgpt = 'chatgpt';


}

class TagManager {
  static List<Tag> tags = [
    // programming languages
    Tag(name: TagName.java, color: kcBlackFull, backgroundColor: kcYellow),
    Tag(name: TagName.spring, color: kcBlackFull, backgroundColor: kcSpringGreen),
    Tag(name: TagName.dart, color: kcBlackFull, backgroundColor: Colors.blueGrey),
    Tag(name: TagName.flutter, color: kcBlackFull, backgroundColor: kcBlue),
    Tag(name: TagName.react, color: kcBlackFull, backgroundColor: softBlue),
    Tag(name: TagName.nextJS, color: kcBlackFull, backgroundColor: Colors.grey),
    Tag(name: TagName.springsec, color: kcBlackFull, backgroundColor: Colors.greenAccent),
    Tag(name: TagName.typescript, color: kcBlackFull, backgroundColor: Colors.blueGrey),


    Tag(name: TagName.javaee, color: kcWhiteCultured, backgroundColor: kcPurple),
    Tag(name: TagName.jsf, color: kcBlackFull, backgroundColor: kcRed),

    Tag(name: TagName.postgresql, color: kcBlackFull, backgroundColor: kcBlue),
    Tag(name: TagName.mysql, color: kcBlackFull, backgroundColor: kcBlue),
    Tag(name: TagName.impala, color: kcWhiteCultured, backgroundColor: kcDarkBlue),

    //cloud
    Tag(name: TagName.azure, color: kcBlackFull, backgroundColor: kcBlue),
    Tag(name: TagName.gcp, color: kcBlackFull, backgroundColor: Colors.redAccent),

    // test
    Tag(name: TagName.spock, color: kcWhiteCultured, backgroundColor: kcSpringGreen),
    Tag(name: TagName.unitTesting, color: kcWhiteCultured, backgroundColor: Colors.purple),
    Tag(name: TagName.integrationTesting, color: kcBlackErie, backgroundColor: Colors.orange),
    Tag(name: TagName.e2eTesting, color: kcBlackFull, backgroundColor: Colors.greenAccent),

    //dev-ops
    Tag(name: TagName.git, color: kcWhiteCultured, backgroundColor: kcGreyDim),
    Tag(name: TagName.docker, color: kcWhiteCultured, backgroundColor: kcBlue),
    Tag(name: TagName.kubernetes, color: kcWhiteCultured, backgroundColor: kcBlue),
    Tag(name: TagName.teamcity, color: kcWhiteCultured, backgroundColor: Colors.redAccent),
    Tag(name: TagName.gradle, color: kcWhiteCultured, backgroundColor: kcGreyDim),
    Tag(name: TagName.maven, color: kcWhiteCultured, backgroundColor: earthyBrown),

    //
    Tag(name: TagName.rest, color: kcWhiteCultured, backgroundColor: kcDarkBlue),
    Tag(name: TagName.kafka, color: kcBlackFull, backgroundColor: kcWhiteCultured),
    Tag(name: TagName.figma, color: kcBlackFull, backgroundColor: kcRed),


    //ai
    Tag(name: TagName.codex, color: kcBlackFull, backgroundColor: kcBlue),
    Tag(name: TagName.chatgpt, color: kcBlackFull, backgroundColor: Colors.cyanAccent),
    Tag(name: TagName.vercel, color: kcBlackFull, backgroundColor: Colors.yellow),

    //fe



  ];

  static Tag getTag(String name) {
    return tags.firstWhere(
      (tag) => tag.name == name,
      orElse: () => Tag(name: name, color: kcBlackFull, backgroundColor: kcWhiteCultured),
    );
  }
}

extension TagOverride on Tag {
  Tag overrideBackground() {
    return Tag(name: name, color: color, backgroundColor: backgroundColor, override: true);
  }
}
