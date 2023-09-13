import 'dart:convert';

import 'package:devsite_web/presentation/view/contact/contact_view.desktop.dart';
import 'package:devsite_web/presentation/view/contact/contact_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/color_picker.dart';
import '../../common/style.dart';

class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => ContactDesktopView(),
      tablet: (_) => ContactDesktopView(),
      mobile: (_) => ContactMobileView(),
    );
  }
}

/// email logic
Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> sendEmail(
    BuildContext context, String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': 'null',
        'template_id': 'null',
        'user_id': 'null',
        'template_params': {
          'from_name': "$name",
          'from_email': "$email",
          'message': "$message",
        }
      }));
  if (response.statusCode == 200) {
    return alertMessage(context, "Email sent!", kcTitleTurquoise);
  } else {
    return alertMessage(context, "Something when wrong while sending the email!", kcRed);
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> alertMessage(
    BuildContext context, String message, Color backgroundColor) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
          child: Text(message,
              style: montserratStyleWithColor(context, 16, kcBlackFull, FontWeight.w500))),
      elevation: 0,
      backgroundColor: backgroundColor,
    ),
  );
}
