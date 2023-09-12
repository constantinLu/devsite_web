import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:flutter/material.dart';

import 'tags.dart';

class Project {
  final int id;
  final String name;
  final String company;
  final String sector;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String? logo;
  final Color color;
  final List<Tag> tags;

  const Project({
    required this.id,
    required this.name,
    required this.company,
    required this.sector,
    required this.description,
    required this.logo,
    required this.color,
    required this.tags,
    required this.startDate,
    required this.endDate,
  });
}

enum Month {
  Jan(1),
  Feb(2),
  Mar(3),
  Apr(4),
  May(5),
  Jun(6),
  Jul(7),
  Aug(8),
  Sep(9),
  Oct(10),
  Nov(11),
  Dec(12);

  final int value;

  const Month(this.value);

  static String monthString(int key) =>
      Month.values.firstWhere((element) => element.value == key).name;
}

var projects = [
  Project(
    id: 1,
    name: "Unite",
    company: "Mercedes",
    sector: "Finance",
    description:
        "Car sales with different financial instruments used by dealerships entities in europe markets",
    logo: AppAssets.mercedesLogo,
    color: Colors.white,
    tags: [
      TagManager.getTag(TagName.javaee),
      TagManager.getTag(TagName.jsf),
      TagManager.getTag(TagName.maven),
      TagManager.getTag(TagName.unitTesting),
    ],
    startDate: DateTime(2018, 04, 01),
    endDate: DateTime(2019, 04, 01),
  ),
  Project(
    id: 2,
    name: "Secur-auth",
    company: "Fortech",
    sector: "IT Security",
    description: "Authentication and authorization service provider",
    logo: AppAssets.fortechLogo,
    color: kcBlackCard,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.spring),
      TagManager.getTag(TagName.maven),
      TagManager.getTag(TagName.react),
      TagManager.getTag(TagName.mysql),
    ],
    startDate: DateTime(2019, 04, 01),
    endDate: DateTime(2019, 06, 01),
  ),
  Project(
    id: 3,
    name: "E-resume",
    company: "Fortech",
    sector: "Human resources",
    description: "Resume manager, creator, aggregator, editor based on templates. "
        "Report generator based on skills, years of experience, projects.",
    logo: AppAssets.fortechLogo,
    color: kcBlackCard,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.spring),
      TagManager.getTag(TagName.maven),
      TagManager.getTag(TagName.react),
      TagManager.getTag(TagName.mysql),
    ],
    startDate: DateTime(2019, 06, 01),
    endDate: DateTime(2019, 12, 01),
  ),
  Project(
    id: 5,
    name: "Office-space",
    company: "Fortech",
    sector: "Human resources",
    description: "Office desk reservation management application. "
        "Used for desk booking into the company offices",
    logo: AppAssets.fortechLogo,
    color: kcBlackCard,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.spring),
      TagManager.getTag(TagName.maven),
      TagManager.getTag(TagName.postgresql),
    ],
    startDate: DateTime(2019, 12, 01),
    endDate: DateTime(2020, 09, 01),
  ),
  Project(
    id: 4,
    name: "Forcaster",
    company: "Fortech",
    sector: "Finance",
    description: "Financial forecasting web-app"
        "Financial projections performed to facilitate any decision-making relevant for determining future business performance",
    logo: AppAssets.fortechLogo,
    color: kcBlackCard,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.spring),
      TagManager.getTag(TagName.maven),
      TagManager.getTag(TagName.postgresql),
    ],
    startDate: DateTime(2020, 09, 01),
    endDate: DateTime(2021, 03, 01),
  ),
  Project(
    id: 5,
    name: "SEPA-Tester",
    company: "Revolut",
    sector: "Finance",
    description: "Bank transaction simulator. "
        "This mimicked the real world transactions of money in order "
        "to automatically test mandatory scenarios required by the bank authority before going LIVE",
    logo: AppAssets.revolutLogo,
    color: kcRevolut,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.gradle),
      TagManager.getTag(TagName.postgresql),
      TagManager.getTag(TagName.e2eTesting),
      TagManager.getTag(TagName.spock),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.gcp),
    ],
    startDate: DateTime(2021, 03, 01),
    endDate: DateTime(2021, 06, 01),
  ),
  Project(
    id: 6,
    name: "Bailiff",
    company: "Revolut",
    sector: "Finance",
    description: "Debt collection service",
    logo: AppAssets.revolutLogo,
    color: kcRevolut,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.gradle),
      TagManager.getTag(TagName.postgresql),
      TagManager.getTag(TagName.e2eTesting),
      TagManager.getTag(TagName.spock),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.gcp),
    ],
    startDate: DateTime(2021, 06, 01),
    endDate: DateTime(2023, 01, 01),
  ),
  Project(
    id: 7,
    name: "SEPA Instant",
    company: "Revolut",
    sector: "Finance",
    description: "Payment systems solutions for integration in Eurozone for "
        "Instant transfers (SEPA Inst)",
    logo: AppAssets.revolutLogo,
    color: kcRevolut,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.gradle),
      TagManager.getTag(TagName.postgresql),
      TagManager.getTag(TagName.e2eTesting),
      TagManager.getTag(TagName.spock),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.gcp),
    ],
    startDate: DateTime(2021, 06, 01),
    endDate: DateTime(2023, 01, 01),
  ),
  Project(
    id: 8,
    name: "SEPA Non-instant",
    company: "Revolut",
    sector: "Finance",
    description: "Payment systems solutions for integration in Eurozone for "
        "Direct Debits, and Credit Transfers (SDD, SCT)",
    logo: AppAssets.revolutLogo,
    color: kcRevolut,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.gradle),
      TagManager.getTag(TagName.postgresql),
      TagManager.getTag(TagName.e2eTesting),
      TagManager.getTag(TagName.spock),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.gcp),
    ],
    startDate: DateTime(2021, 06, 01),
    endDate: DateTime(2023, 01, 01),
  ),
  Project(
    id: 9,
    name: "EBA",
    company: "Revolut",
    sector: "Finance",
    description: "Payment systems solutions for integration in Eurozone",
    logo: AppAssets.revolutLogo,
    color: kcRevolut,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.gradle),
      TagManager.getTag(TagName.postgresql),
      TagManager.getTag(TagName.e2eTesting),
      TagManager.getTag(TagName.spock),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.gcp),
    ],
    startDate: DateTime(2022, 03, 01),
    endDate: DateTime(2023, 01, 01),
  ),
  Project(
    id: 10,
    name: "Web-shop",
    company: "Orange",
    sector: "IT Telecom",
    description: "Shopping web-platform",
    logo: AppAssets.orangeLogo,
    color: kcOrangeClient,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.gradle),
      TagManager.getTag(TagName.postgresql),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.kafka),
    ],
    startDate: DateTime(2023, 02, 01),
    endDate: DateTime(2023, 06, 01),
  ),
  Project(
    id: 11,
    name: "CNS-CAP",
    company: "Eurocontrol",
    sector: "Aviation",
    description: "Aircraft communication, navigation and surveillance dashboard",
    logo: AppAssets.eurocontrolLogo,
    color: Colors.white,
    tags: [
      TagManager.getTag(TagName.java),
      TagManager.getTag(TagName.maven),
      TagManager.getTag(TagName.impala),
      TagManager.getTag(TagName.unitTesting),
      TagManager.getTag(TagName.integrationTesting),
      TagManager.getTag(TagName.azure),
    ],
    startDate: DateTime(2023, 07, 01),
    endDate: DateTime.now(),
  )
];
