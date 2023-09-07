import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../common/space.dart';

class ContactMobileView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ContactMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      child: Center(child: Text("CONTACT MOBILE")),
    );
  }
}