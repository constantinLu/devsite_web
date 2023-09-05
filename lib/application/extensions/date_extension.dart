import '../model/project.dart';

extension DateUtil on DateTime {
  String get monthYear {
    return "${Month.monthString(month)} $year";
  }
}
