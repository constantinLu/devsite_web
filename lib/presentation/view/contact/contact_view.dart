import 'dart:convert';

import 'package:devsite_web/presentation/view/contact/contact_view.desktop.dart';
import 'package:devsite_web/presentation/view/contact/contact_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';

import '../../../application/env.dart';
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

String? requiredValidator(String? value, String fieldLabel) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldLabel is required';
  }
  return null;
}

String? emailValidator(String? value) {
  final requiredValidation = requiredValidator(value, 'Email');
  if (requiredValidation != null) {
    return requiredValidation;
  }

  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  if (!emailRegex.hasMatch(value!.trim())) {
    return 'Enter a valid email address';
  }

  return null;
}

/// email logic
Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> sendEmail(
    BuildContext context, String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': EMAIL_SERVICE_ID,
        'template_id': EMAIL_TEMPLATE_ID,
        //public key
        'user_id': EMAIL_PUBLIC_KEY,
        'template_params': {
          'from_name': "$name",
          'from_email': "$email",
          'message': "$message",
        }
      }));
  if (response.statusCode == 200) {
    return alertMessage(context, "Email sent!", kcTitleTurquoise);
  } else {
    return alertMessage(
        context, "Something when wrong while sending the email!", kcRed);
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> alertMessage(
    BuildContext context, String message, Color backgroundColor) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Center(
          child: Text(message,
              style: montserratStyleWithColor(
                  context, 16, kcBlackFull, FontWeight.w500))),
      elevation: 0,
      backgroundColor: backgroundColor,
    ),
  );
}
