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
  final String? url;

  const Project({
    required this.id,
    required this.name,
    required this.company,
    required this.sector,
    required this.description,
    this.logo,
    required this.color,
    required this.tags,
    required this.startDate,
    required this.endDate,
    this.url,
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

  static String monthString(int key) => Month.values.firstWhere((element) => element.value == key).name;
}

var projects = [
  Project(
      id: 16,
      name: "VoltLab",
      company: "-",
      sector: "Business",
      description: "Interactive Electrical Calculators",
      logo: AppAssets.voltlabLogo,
      tags: [
        TagManager.getTag(TagName.vercel),
        TagManager.getTag(TagName.chatgpt),
        TagManager.getTag(TagName.nextJS),
        TagManager.getTag(TagName.typescript),
      ],
      startDate: DateTime(2025, 11, 01),
      endDate: DateTime.now(),
      color: Colors.blue,
      url: "https://www.voltlab.app"),
  Project(
      id: 13,
      name: "Nature Ozon",
      company: "NatureOzon SRL",
      sector: "Medical",
      description:
          "a modern presentation website for a medical clinic specializing in ozone therapy and rejuvenation treatments, focusing on clear service communication and user-friendly design",
      logo: AppAssets.natureOzonLogo,
      tags: [
        TagManager.getTag(TagName.vercel),
        TagManager.getTag(TagName.chatgpt),
        TagManager.getTag(TagName.nextJS),
        TagManager.getTag(TagName.typescript),
      ],
      startDate: DateTime(2025, 06, 01),
      endDate: DateTime.now(),
      color: Colors.white,
      url: "https://nature-ozon.vercel.app"),
  Project(
      id: 115,
      name: "TIP",
      company: "Eurocontrol",
      sector: "Aviation",
      description: "Traffic Inspector: Inspection and validation of the aircraft traffic for operational analysis",
      logo: AppAssets.eurocontrolLogo,
      color: Colors.white,
      tags: [
        TagManager.getTag(TagName.java),
        TagManager.getTag(TagName.maven),
        TagManager.getTag(TagName.impala),
        TagManager.getTag(TagName.integrationTesting),
        TagManager.getTag(TagName.azure),
      ],
      startDate: DateTime(2025, 10, 01),
      endDate: DateTime.now(),
      url: 'https://sherlock.eurocontrol.int'),
  Project(
      id: 114,
      name: "FIP",
      company: "Eurocontrol",
      sector: "Aviation",
      description: "Flight Inspector: Inspection and validation of flight data for compliance and operational analysis",
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
      startDate: DateTime(2025, 05, 01),
      endDate: DateTime.now(),
      url: 'https://sherlock.eurocontrol.int'),
  Project(
      id: 113,
      name: "ACAS",
      company: "Eurocontrol",
      sector: "Aviation",
      description: "Airborne Collision Avoidance System: Provides insights into aircraft collision avoidance events",
      logo: AppAssets.eurocontrolLogo,
      color: Colors.white,
      tags: [
        TagManager.getTag(TagName.java),
        TagManager.getTag(TagName.maven),
        TagManager.getTag(TagName.impala),
        TagManager.getTag(TagName.spring),
        TagManager.getTag(TagName.azure),
      ],
      startDate: DateTime(2025, 02, 01),
      endDate: DateTime.now(),
      url: 'https://sherlock.eurocontrol.int'),
  Project(
      id: 113,
      name: "IAM",
      company: "Eurocontrol",
      sector: "Authenication/Auhorization",
      description: "Identity and Access Management",
      logo: AppAssets.eurocontrolLogo,
      color: Colors.white,
      tags: [
        TagManager.getTag(TagName.java),
        TagManager.getTag(TagName.springsec),
        TagManager.getTag(TagName.azure),
        TagManager.getTag(TagName.postgresql),
      ],
      startDate: DateTime(2024, 04, 01),
      endDate: DateTime.now(),
      url: 'https://sherlock.eurocontrol.int'),
  Project(
      id: 15,
      name: "CNS-CAP",
      company: "Eurocontrol",
      sector: "Aviation",
      description: "Aircraft communication, navigation and surveillance backend data processing",
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
      url: 'https://sherlock.eurocontrol.int'),
  Project(
      id: 1,
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
      url: 'https://www.orange.ro'),
  Project(
      id: 2,
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
      url: 'https://www.revolut.com/'),
  Project(
      id: 3,
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
        TagManager.getTag(TagName.gcp),
      ],
      startDate: DateTime(2021, 06, 01),
      endDate: DateTime(2023, 01, 01),
      url: 'https://www.revolut.com/'),
  Project(
      id: 4,
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
        TagManager.getTag(TagName.spock),
        TagManager.getTag(TagName.unitTesting),
        TagManager.getTag(TagName.gcp),
      ],
      startDate: DateTime(2021, 06, 01),
      endDate: DateTime(2023, 01, 01),
      url: 'https://www.revolut.com/'),
  Project(
      id: 5,
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
        TagManager.getTag(TagName.spock),
        TagManager.getTag(TagName.unitTesting),
        TagManager.getTag(TagName.gcp),
      ],
      startDate: DateTime(2021, 06, 01),
      endDate: DateTime(2023, 01, 01),
      url: 'https://www.revolut.com/'),
  Project(
      id: 6,
      name: "SEPA-Tester",
      company: "Revolut",
      sector: "Finance",
      description: "Bank transaction simulator for automated testing of mandatory scenarios required by the bank authority"
          " before going LIVE",
      logo: AppAssets.revolutLogo,
      color: kcRevolut,
      tags: [
        TagManager.getTag(TagName.java),
        TagManager.getTag(TagName.gradle),
        TagManager.getTag(TagName.postgresql),
        TagManager.getTag(TagName.e2eTesting),
        TagManager.getTag(TagName.spock),
        TagManager.getTag(TagName.unitTesting),
      ],
      startDate: DateTime(2021, 03, 01),
      endDate: DateTime(2021, 06, 01),
      url: 'https://www.revolut.com/'),
  Project(
    id: 7,
    name: "Forcaster",
    company: "Fortech",
    sector: "Finance",
    description: "Financial forecasting and projections performed to "
        "facilitate any decision-making relevant for determining future business performance",
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
    id: 8,
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
    id: 9,
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
    id: 10,
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
    id: 11,
    name: "Unite",
    company: "Mercedes",
    sector: "Finance",
    description: "Car sales with different financial instruments used by dealerships entities in europe markets",
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
];
